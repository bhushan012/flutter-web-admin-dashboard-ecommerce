import 'package:ecommerce_admin_tut/provider/appstate.dart';
import 'package:ecommerce_admin_tut/widgets/top_buyer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return ListView(
      children: [
        
                    Column(
                      children: List<Widget>.generate(
                          appState.customerList.length, (index) {
                        print(
                            "dealerName is ${appState.customerList[index].customerName}");
                        print(
                            "dealerName is ${appState.customerList[index].customerId}");
                        // print(
                        //     "todays totalSale is ${appState.dealerList[index].totalSale}");
                        String dealerId=appState.dealerList[index].dealerId;
                        return Column(
                          children: [
                            InkWell(
                                child: TopBuyerWidget(
                                  dealerName:
                                      appState.customerList[index].customerName,
                                  // totalSale:
                                  //     appState.dealerList[index].totalSale,
                                ),
                                onTap: () { Navigator.pushNamed(
                                    context, '/dealersProductPage');
                                    print("hello world");
                                    // args:dealerId;
                                    }
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
                    // TopBuyerWidget(),
                    // TopBuyerWidget(),
                    // TopBuyerWidget(),
                    // TopBuyerWidget(),
                    // TopBuyerWidget(),
                  ],
    );   


  }
}
