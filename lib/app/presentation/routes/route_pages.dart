import 'package:get/get.dart';
import 'package:hive_innovation_shop/app/presentation/routes/route_pages_name.dart';
import 'package:hive_innovation_shop/app/presentation/screens/auth_screens/login_screen/login_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/home_screen/home_screen.dart';
import 'package:hive_innovation_shop/app/presentation/screens/product_detail_screen/product_detail_screen.dart';

class RoutePages {


  var routerPage = [

    GetPage(name: RoutePagesName.kINITIAL, page:()=> const LoginScreen()),
    GetPage(name: RoutePagesName.kHome, page:()=> const HomeScreen()),
    GetPage(name: RoutePagesName.kProductDetail, page:()=> const ProductDetailScreen()),
  ];
}