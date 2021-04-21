import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../locator.dart';
import 'custom_text.dart';

class TopBuyerWidget extends StatelessWidget {
  final String dealerName;
  final String totalSale;
  TopBuyerWidget({this.dealerName, this.totalSale, key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/profile.jpg'),
          ),
          title: Text(this.dealerName ?? "Prathamesh"),
          subtitle: Text(this.totalSale ?? '50, orders'),
          trailing: CustomText(
            text: '\$ 19999',
            color: Colors.green.shade800,
            weight: FontWeight.bold,
          ),
        ),
        onTap: () {
          locator<NavigationService>()
              .globalNavigateTo(DealersProductPages, context);
        });
  }
}
