
import '../database/app_database.dart';
import '../models/category.dart' as model;

class CategoryRepository {
  final AppDatabase database;

  CategoryRepository(this.database);

  // CREATE CATEGORY
  Future<void> createCategory(model.Category category) async {
    await database.createCategory(
      id: category.id,
      name: category.name,
      type: category.type == model.CategoryType.income ? 0 : 1,
      isDefault: category.isDefault,
      createdAt: category.createdAt,
    );
  }

  // READ ALL CATEGORIES
  Future<List<model.Category>> getAllCategories() async {
    final categories = await database.select(database.categories).get();

    return categories.map((category) {
      return model.Category(
        id: category.id,
        name: category.name,
        type: category.type == 0
            ? model.CategoryType.income
            : model.CategoryType.expense,
        isDefault: category.isDefault,
        createdAt: category.createdAt,
      );
    }).toList();
  }

  // READ ONE CATEGORY
  Future<model.Category?> getCategoryById(String id) async {
    final category = await database.getCategoryById(id);

    if (category == null) {
      return null;
    }

    return model.Category(
      id: category.id,
      name: category.name,
      type: category.type == 0
          ? model.CategoryType.income
          : model.CategoryType.expense,
      isDefault: category.isDefault,
      createdAt: category.createdAt,
    );
  }

  // UPDATE CATEGORY
  Future<bool> updateCategory(model.Category category) async {
    return database.updateCategory(
      id: category.id,
      name: category.name,
      type: category.type == model.CategoryType.income ? 0 : 1,
    );
  }

  // DELETE CATEGORY
  Future<bool> deleteCategory(String id) async {
    return database.deleteCategory(id);
  }
}