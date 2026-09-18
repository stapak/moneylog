import '../models/category.dart';

class CategoryService {
  void validateCategory(Category category){
    if(category.name.trim().isEmpty){
      throw ArgumentError("Category name cannot be empty.");
    }
  }
}