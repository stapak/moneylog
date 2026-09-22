
import 'package:flutter/material.dart';

import 'data/database/app_database.dart'
    show AppDatabase;
import 'data/models/account.dart';
import 'data/repositories/account_repository.dart';

void main() {
  runApp(const BudgetApp());
}

class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoneyLog',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const AccountsScreen(),
    );
  }
}

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  late final AppDatabase database;
  late final AccountRepository repository;

  List<Account> accounts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    database = AppDatabase();
    repository = AccountRepository(database);

    loadAccounts();
  }

  Future<void> loadAccounts() async {
    final loadedAccounts = await repository.getAllAccounts();

    if (!mounted) return;

    setState(() {
      accounts = loadedAccounts;
      isLoading = false;
    });
  }

  Future<void> addAccount() async {
    final nameController = TextEditingController();
    final balanceController = TextEditingController();

    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Account name',
                  hintText: 'e.g. Savings',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: balanceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Opening balance',
                  hintText: 'e.g. 5000',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final balance = double.tryParse(
                  balanceController.text.trim(),
                );

                if (name.isEmpty || balance == null || balance < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Enter a valid name and opening balance.',
                      ),
                    ),
                  );
                  return;
                }

                final account = Account(
                  id: DateTime.now()
                      .microsecondsSinceEpoch
                      .toString(),
                  name: name,
                  openingBalance: balance,
                );

                await repository.createAccount(account);

                if (!context.mounted) return;

                Navigator.pop(context, true);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );

    nameController.dispose();
    balanceController.dispose();

    if (result == true) {
      await loadAccounts();
    }
  }

  Future<void> deleteAccount(Account account) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: Text(
            'Are you sure you want to delete "${account.name}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    await repository.deleteAccount(account.id);
    await loadAccounts();
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoneyLog Accounts'),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : accounts.isEmpty
          ? const Center(
        child: Text(
          'No accounts yet.\nTap + to add your first account.',
          textAlign: TextAlign.center,
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final account = accounts[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.account_balance),
              ),
              title: Text(account.name),
              subtitle: Text(
                'Opening balance: ₹${account.openingBalance.toStringAsFixed(2)}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => deleteAccount(account),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addAccount,
        child: const Icon(Icons.add),
      ),
    );
  }
}