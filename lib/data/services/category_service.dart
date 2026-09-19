
import '../models/category.dart';

class CategoryService {
  static const String deletedCategoryName = 'Deleted';

  void validateCategory(Category category) {
    final categoryName = category.name.trim();

    if (categoryName.isEmpty) {
      throw ArgumentError('Category name cannot be empty.');
    }

    if (categoryName.toLowerCase() ==
        deletedCategoryName.toLowerCase()) {
      throw ArgumentError(
        'The category name "Deleted" is reserved.',
      );
    }
  }
}