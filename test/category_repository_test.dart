
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:moneylog/data/database/app_database.dart'
    show AppDatabase;
import 'package:moneylog/data/models/category.dart';
import 'package:moneylog/data/repositories/category_repository.dart';

void main() {
  late AppDatabase database;
  late CategoryRepository repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = CategoryRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('Create and read an income category', () async {
    final category = Category(
      id: 'category-1',
      name: 'Salary',
      type: CategoryType.income,
      isDefault: true,
      createdAt: DateTime(2026, 1, 1),
    );

    await repository.createCategory(category);

    final savedCategory =
    await repository.getCategoryById('category-1');

    expect(savedCategory, isNotNull);
    expect(savedCategory!.name, 'Salary');
    expect(savedCategory.type, CategoryType.income);
    expect(savedCategory.isDefault, isTrue);
  });

  test('Create and read an expense category', () async {
    final category = Category(
      id: 'category-2',
      name: 'Food',
      type: CategoryType.expense,
      isDefault: true,
      createdAt: DateTime(2026, 1, 1),
    );

    await repository.createCategory(category);

    final savedCategory =
    await repository.getCategoryById('category-2');

    expect(savedCategory, isNotNull);
    expect(savedCategory!.name, 'Food');
    expect(savedCategory.type, CategoryType.expense);
  });

  test('Read all categories', () async {
    await repository.createCategory(
      Category(
        id: 'category-1',
        name: 'Salary',
        type: CategoryType.income,
        isDefault: true,
        createdAt: DateTime(2026, 1, 1),
      ),
    );

    await repository.createCategory(
      Category(
        id: 'category-2',
        name: 'Food',
        type: CategoryType.expense,
        isDefault: true,
        createdAt: DateTime(2026, 1, 1),
      ),
    );

    final categories = await repository.getAllCategories();

    expect(categories.length, 2);
  });

  test('Update a category', () async {
    await repository.createCategory(
      Category(
        id: 'category-1',
        name: 'Food',
        type: CategoryType.expense,
        isDefault: true,
        createdAt: DateTime(2026, 1, 1),
      ),
    );

    final updated = await repository.updateCategory(
      Category(
        id: 'category-1',
        name: 'Groceries',
        type: CategoryType.expense,
        isDefault: true,
        createdAt: DateTime(2026, 1, 1),
      ),
    );

    final category =
    await repository.getCategoryById('category-1');

    expect(updated, isTrue);
    expect(category!.name, 'Groceries');
    expect(category.type, CategoryType.expense);
  });

  test('Delete a category', () async {
    await repository.createCategory(
      Category(
        id: 'category-1',
        name: 'Food',
        type: CategoryType.expense,
        isDefault: false,
        createdAt: DateTime(2026, 1, 1),
      ),
    );

    final deleted =
    await repository.deleteCategory('category-1');

    final category =
    await repository.getCategoryById('category-1');

    expect(deleted, isTrue);
    expect(category, isNull);
  });
}