import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_project/cubit/hive_cubit/hive_cubit.dart';
import 'package:test_project/services/constants.dart';
import 'package:test_project/ui/themes/app_theme.dart';
import 'package:test_project/views/home_screen/navigation.dart';
import 'package:test_project/views/splash/splash_screen.dart';

import 'cubit/category_cubit/category_cubit.dart';
import 'cubit/product_cubit/product_cubit_cubit.dart';
import 'models/product_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>(HiveConstant.favoritesProductBox);
  await Hive.openBox<Product>(HiveConstant.cartProductBox);
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => HiveCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        home: NavigationScreen(),
      ),
    );
  }
}

extension SizeDevice on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
