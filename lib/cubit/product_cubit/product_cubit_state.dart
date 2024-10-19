part of 'product_cubit_cubit.dart';

@immutable
sealed class ProductCubitState {}

final class ProductCubitInitial extends ProductCubitState {}

final class ChangeSelectedImage extends ProductCubitState {
  final int selectedImage;

  ChangeSelectedImage({required this.selectedImage});
}

class ProductLoading extends ProductCubitState {}

class ProductCategoriesLoaded extends ProductCubitState {
  final List<String> categories;

  ProductCategoriesLoaded({required this.categories});
}

class ProductsLoaded extends ProductCubitState {
  final List<Product> products;

  ProductsLoaded({required this.products});
}

class AllProductsLoaded extends ProductCubitState {
  final List<Product> products;

  AllProductsLoaded({required this.products});
}

class ProductError extends ProductCubitState {
  final String message;

  ProductError({required this.message});
}
