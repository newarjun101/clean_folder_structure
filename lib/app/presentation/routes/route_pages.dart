import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/di/auth_binding.dart';
import 'package:hive_innovation_shop/app/di/prouduct_detail_binding.dart';
import 'package:hive_innovation_shop/app/di/splash_screen_binding.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages_name.dart';
import 'package:hive_innovation_shop/app/presentation/screens/auth_screens/login_screen/login_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/cart_screen/cart_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/checkout_success_screen/checkout_success_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/home_screen/home_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/product_detail_screen/product_detail_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:hive_innovation_shop/app/view_model/product_detail_view_model.dart';
import 'package:hive_innovation_shop/app/view_model/splash_screen_view_model.dart';

class RoutePages {
  var routerPage = [
    GetPage(
      name: RoutePagesName.kINITIAL,
      page: () => const HomeScreen(),
        binding: ProductDetailBinding()
    ),
    GetPage(
        name: RoutePagesName.kLogin,
        page: () => const LoginScreen(),
      binding: AuthBinding()

        ),
    GetPage(
        name: RoutePagesName.kProductDetail,
        page: () => const ProductDetailScreen(),
        binding: ProductDetailBinding()),
    GetPage(
      name: RoutePagesName.kCart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: RoutePagesName.kSuccess,
      page: () => const CheckoutSuccessScreen(),
    ),
    GetPage(name: RoutePagesName.kSplash, page: ()=>const SplashScreen(),
    binding: SplashScreenBinding())
  ];
}
