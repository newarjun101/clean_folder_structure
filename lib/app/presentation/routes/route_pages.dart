import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/di/cart_binding.dart';
import 'package:hive_innovation_shop/app/di/home_screeen_binding.dart';
import 'package:hive_innovation_shop/app/di/prouduct_detail_binding.dart';
import 'package:hive_innovation_shop/app/di/splash_screen_binding.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages_name.dart';
import 'package:hive_innovation_shop/app/presentation/screens/auth_screens/login_screen/login_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/cart_screen/cart_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/checkout_success_screen/checkout_success_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/home_screen/home_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/product_detail_screen/product_detail_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/splash_screen/splash_screen.dart';

import '../screens/auth_screens/register_screen/register_screen.dart';

class RoutePages {
  var routerPage = [
    GetPage(
        name: RoutePagesName.kINITIAL,
        page: () => const HomeScreen(),
        binding: HomeScreenBinding()),
    GetPage(
      name: RoutePagesName.kLogin,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RoutePagesName.kCreateAccount,
      page: () => const CreateAccountScreen(),
    ),
    GetPage(
        name: RoutePagesName.kProductDetail,
        page: () => const ProductDetailScreen(),
        binding: ProductDetailBinding()),
    GetPage(
        name: RoutePagesName.kCart,
        page: () => const CartScreen(),
        binding: CartBinding()),
    GetPage(
      name: RoutePagesName.kSuccess,
      page: () => const CheckoutSuccessScreen(),
    ),
    GetPage(
        name: RoutePagesName.kSplash,
        page: () => const SplashScreen(),
        binding: SplashScreenBinding())
  ];
}
