class Account {
  final String id;
  final String name;
  final double openingBalance;
  final String iconName;

  const Account({
    required this.id,
    required this.name,
    required this.openingBalance,
    this.iconName = 'account_balance',
  });
}