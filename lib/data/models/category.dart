class Category{
  final String id;
  final String name;
  final bool isIncome;
  final String? parentId;

  const Category({
    required this.id,
    required this.name,
    required this.isIncome,
    this.parentId,
  });
}