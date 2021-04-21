import 'package:ecommerce_admin_tut/main.dart';
import 'package:ecommerce_admin_tut/pages/brands/brands_page.dart';
import 'package:ecommerce_admin_tut/pages/categories/categories_page.dart';
import 'package:ecommerce_admin_tut/pages/login/login.dart';

import 'package:ecommerce_admin_tut/pages/registration/registration.dart';
import 'package:ecommerce_admin_tut/screens/approveDealer.dart';
import 'package:ecommerce_admin_tut/screens/approveDealerProducts.dart';
import 'package:ecommerce_admin_tut/screens/approveProducts.dart';
import 'package:ecommerce_admin_tut/screens/cart.dart';
// import 'package:ecommerce_admin_tut/pages/registration/registration.dart';
import 'package:ecommerce_admin_tut/screens/dealersProductPage.dart';
import 'package:ecommerce_admin_tut/screens/login.dart';
import 'package:ecommerce_admin_tut/screens/orderHistory.dart';
import 'package:ecommerce_admin_tut/screens/profile.dart';
import 'package:ecommerce_admin_tut/screens/singleProductdetails.dart';

import 'package:ecommerce_admin_tut/widgets/layout/layout.dart';

import '../pages/home/home_page.dart';

import '../pages/products/products_page.dart';
import '../pages/users/users_page.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());
    case UsersRoute:
      return _getPageRoute(UsersPage());
    case ProductsRoute:
      return _getPageRoute(ProductsPage());
    // case OrdersRoute:
    //   return _getPageRoute(OrdersPage());
    case Login:
      return _getPageRoute(LoginPage());
    case RegistrationRoute:
      return _getPageRoute(RegistrationPage());
    case LayoutRoute:
      return _getPageRoute(LayoutTemplate());
    case CategoriesRoute:
      return _getPageRoute(CategoriesPage());
    case BrandsRoute:
      return _getPageRoute(BrandsPage());
    case PageControllerRoute:
      return _getPageRoute(AppPagesController());
    case DealersProductPages:
      return _getPageRoute(DealersProductPage());
    case ViewDealersProducts:
      return _getPageRoute(SingleProductDetails());
    case OrdersPageHistory:
      return _getPageRoute(ClientDealerHistory());

    case ApproveDealers:
      return _getPageRoute(ApproveDealer());
    case Cart:
      return _getPageRoute(CartPage());
    case DealersProductApproval:
      return _getPageRoute(ApproveDealerProducts());
    // case ProfileDetails:
    //   return _getPageRoute(Profile());
    case ApproveProductsByAdmin:
      return _getPageRoute(ApproveProducts());
    default:
      return _getPageRoute(LayoutTemplate());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
