import 'package:ecommerce_admin_tut/screens/dealersProductPage.dart';
import 'package:ecommerce_admin_tut/provider/appstate.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:ecommerce_admin_tut/widgets/cards/card_item.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:ecommerce_admin_tut/widgets/charts/sales_chart.dart';
import 'package:ecommerce_admin_tut/widgets/top_buyer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class HomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return ListView(
      children: [
        PageHeader(
          text: 'DASHBOARD',
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CardItem(
            icon: Icons.monetization_on_outlined,
            title: "Revenue",
            subtitle: "Revenue this month",
            value: "\$ 4,323",
            color1: Colors.green.shade700,
            color2: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CardItem(
            icon: Icons.shopping_basket_outlined,
            title: "Products",
            subtitle: "Total products on store",
            value: "231",
            color1: Colors.lightBlueAccent,
            color2: Colors.blue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CardItem(
            icon: Icons.delivery_dining,
            title: "Orders",
            subtitle: "Total orders for this month",
            value: "33",
            color1: Colors.redAccent,
            color2: Colors.red,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 1.19,
                  child: SalesChart()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.19,
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(0, 3),
                          blurRadius: 16)
                    ]),
                child: Column(
                  children: [
                    CustomText(
                      text: 'Top Buyers',
                      size: 30,
                    ),
                    // TopBuyerWidget(),
                    Column(
                      children: List<Widget>.generate(
                          appState.allDealerList.length, (index) {
                        print(
                            "dealerName is ${appState.allDealerList[index].dealerName}");
                        print(
                            "dealerName for the ui is ${appState.allDealerList[index].dealerName}");
                        // print(
                        //     "todays totalSale is ${appState.dealerList[index].totalSale}");
                        String dealerId = appState.dealerList[index].dealerId;
                        return Column(
                          children: [
                            TopBuyerWidget(
                              dealerName:
                                  appState.allDealerList[index].dealerName,
                              totalSale:
                                  appState.allDealerList[index].totalSale,
                            )
                            //  DealersNameCard(
                            //    name:appState.dealerList[index].dealerName,
                            //    imgUrl:appState.dealerList[index].imgUrl
                            //  ),
                            // Text(appState.productCategory[index].name)
                          ],
                        );
                      }),
                    ),
                    TopBuyerWidget(),
                    TopBuyerWidget(),
                    TextButton(
                        child: Text("gotonextPage"),
                        onPressed: () {
                          locator<NavigationService>()
                              .globalNavigateTo(DealersProductPages, context);
                        })
                    // TopBuyerWidget(),
                    // TopBuyerWidget(),
                    // TopBuyerWidget(),
                    // TopBuyerWidget(),
                    // TopBuyerWidget(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
