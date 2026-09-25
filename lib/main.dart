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

  static const Map<String, IconData> accountIcons = {
    'account_balance': Icons.account_balance,
    'account_balance_wallet': Icons.account_balance_wallet,
    'savings': Icons.savings,
    'credit_card': Icons.credit_card,
    'payments': Icons.payments,
    'wallet': Icons.wallet,
    'cash': Icons.money,
    'money': Icons.money,
    'currency_rupee': Icons.currency_rupee,
    'business': Icons.business,
    'home': Icons.home,
    'shopping_bag': Icons.shopping_bag,
    'restaurant': Icons.restaurant,
    'directions_car': Icons.directions_car,
    'flight': Icons.flight,
    'phone_android': Icons.phone_android,
    'computer': Icons.computer,
    'work': Icons.work,
    'school': Icons.school,
    'favorite': Icons.favorite,
  };

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

  IconData getAccountIcon(String iconName) {
    return accountIcons[iconName] ?? Icons.account_balance;
  }

  Future<void> addAccount() async {
    final nameController = TextEditingController();
    final balanceController = TextEditingController();

    String selectedIcon = 'account_balance';

    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Add Account'),
              content: SingleChildScrollView(
                child: Column(
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
                      keyboardType:
                      const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Opening balance',
                        hintText: 'e.g. 5000',
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose account icon',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: accountIcons.entries.map((entry) {
                        final isSelected =
                            selectedIcon == entry.key;

                        return InkWell(
                          onTap: () {
                            setDialogState(() {
                              selectedIcon = entry.key;
                            });
                          },
                          borderRadius:
                          BorderRadius.circular(12),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Theme.of(context)
                                  .colorScheme
                                  .primaryContainer
                                  : Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              borderRadius:
                              BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              entry.value,
                              color: isSelected
                                  ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(dialogContext, false),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () async {
                    final name = nameController.text.trim();

                    final balance = double.tryParse(
                      balanceController.text.trim(),
                    );

                    if (name.isEmpty ||
                        balance == null ||
                        balance < 0) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
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
                      iconName: selectedIcon,
                    );

                    await repository.createAccount(account);

                    if (!dialogContext.mounted) return;

                    Navigator.pop(dialogContext, true);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );

    nameController.dispose();
    balanceController.dispose();

    if (result == true) {
      await loadAccounts();
    }
  }

  Future<void> editAccount(Account account) async {
    final nameController =
    TextEditingController(text: account.name);

    final balanceController = TextEditingController(
      text: account.openingBalance.toString(),
    );

    String selectedIcon = account.iconName;

    if (!accountIcons.containsKey(selectedIcon)) {
      selectedIcon = 'account_balance';
    }

    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Edit Account'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Account name',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: balanceController,
                      keyboardType:
                      const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Opening balance',
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose account icon',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: accountIcons.entries.map((entry) {
                        final isSelected =
                            selectedIcon == entry.key;

                        return InkWell(
                          onTap: () {
                            setDialogState(() {
                              selectedIcon = entry.key;
                            });
                          },
                          borderRadius:
                          BorderRadius.circular(12),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Theme.of(context)
                                  .colorScheme
                                  .primaryContainer
                                  : Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              borderRadius:
                              BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              entry.value,
                              color: isSelected
                                  ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(dialogContext, false),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () async {
                    final name = nameController.text.trim();

                    final balance = double.tryParse(
                      balanceController.text.trim(),
                    );

                    if (name.isEmpty ||
                        balance == null ||
                        balance < 0) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Enter a valid name and opening balance.',
                          ),
                        ),
                      );
                      return;
                    }

                    final updatedAccount = Account(
                      id: account.id,
                      name: name,
                      openingBalance: balance,
                      iconName: selectedIcon,
                    );

                    await repository.updateAccount(
                      updatedAccount,
                    );

                    if (!dialogContext.mounted) return;

                    Navigator.pop(dialogContext, true);
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            );
          },
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
              onPressed: () =>
                  Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () =>
                  Navigator.pop(context, true),
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
            margin:
            const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  getAccountIcon(
                    account.iconName,
                  ),
                ),
              ),
              title: Text(account.name),
              subtitle: Text(
                'Opening balance: ₹${account.openingBalance.toStringAsFixed(2)}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: 'Edit account',
                    icon: const Icon(
                      Icons.edit_outlined,
                    ),
                    onPressed: () =>
                        editAccount(account),
                  ),
                  IconButton(
                    tooltip: 'Delete account',
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                    onPressed: () =>
                        deleteAccount(account),
                  ),
                ],
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