enum CategoryType {
  income,
  expense,
}

class Category {
  final String id;
  final String name;
  final CategoryType type;
  final bool isDefault;
  final DateTime createdAt;

  const Category({
    required this.id,
    required this.name,
    required this.type,
    required this.isDefault,
    required this.createdAt,
  });
}