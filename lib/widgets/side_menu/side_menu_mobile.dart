import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class SideMenuMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey[200], offset: Offset(3, 5), blurRadius: 17)
      ]),
      width: 60,
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text("DashBoard",
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                  IconButton(
                    icon: Icon(Icons.dashboard),
                    onPressed: () {
                      locator<NavigationService>()
                          .globalNavigateTo(PageControllerRoute, context);

                      print("dashboard Clicked");
                    },
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.people),
              onPressed: () {
                locator<NavigationService>().navigateTo(ApproveDealers);
                print("people Clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                locator<NavigationService>().navigateTo(Cart);
                print("shopping_cart Clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.category),
              onPressed: () {
                locator<NavigationService>().navigateTo(ApproveProductsByAdmin);
                print("category Clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print("notifications Clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                locator<NavigationService>().navigateTo(OrdersPageHistory);

                print("person Clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print("settings Clicked");
              },
            ),
          ],
        ),
      ),
    );
  }
}
