part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<String> categories;

  CategoryLoaded({required this.categories});
}

class CategorySelected extends CategoryState {
  final List<String> categories;
  final String selectedCategory;

  CategorySelected({required this.categories, required this.selectedCategory});
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});
}
