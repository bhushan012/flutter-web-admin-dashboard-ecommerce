import 'package:ecommerce_admin_tut/models/product.dart';
import 'package:ecommerce_admin_tut/pages/home/desktop.dart';
import 'package:ecommerce_admin_tut/pages/home/mobile.dart';
import 'package:ecommerce_admin_tut/pages/home/tablet.dart';
import 'package:ecommerce_admin_tut/provider/appstate.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:ecommerce_admin_tut/widgets/size_constraint.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../locator.dart';

class DealersProductPage extends StatefulWidget {
  DealersProductPage({Key key}) : super(key: key);

  @override
  _DealersProductPageState createState() => _DealersProductPageState();
}

class _DealersProductPageState extends State<DealersProductPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    String dealerId = ModalRoute.of(context).settings.arguments;
    print("dealerid on approveDealerProducs $dealerId");

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Products")),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    FutureBuilder<List<Product>>(
                      future: appState.fetchProducts(dealerId),
                      builder: (context, snapshot) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // print("hellooooooooo:${snapshot.data.length}"),
                          children: List<Widget>.generate(
                              appState.dealerList.length, (int index) {
                            return ApproveProductRequest(
                                name: snapshot.data[index].productName,
                                price: snapshot.data[index].price,
                                category: snapshot.data[index].category,
                                imgUrl: snapshot.data[index].imgUrl
                                //  address:snapshot.data[index].address,
                                );
                          }),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )));
  }
}

class ApproveProductRequest extends StatelessWidget {
  final String name;
  final String price;
  final String imgUrl;
  final String category;
  final Product productDetails;
  const ApproveProductRequest({
    Key key,
    this.name,
    this.price,
    this.imgUrl,
    this.category,
    this.productDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          // color: greyColordark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
              side:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //  SizedBox(width: 10,),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
                child: Container(
                  decoration: BoxDecoration(
                      // color: greyColordark,
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      this.imgUrl ?? "",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),

              Expanded(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          this.name ?? "New Inspiron 5590 Laptop",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Price:${this.price}/-" ?? "Price:/-",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),

                    SizedBox(
                      height: 10,
                    ),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          this.category ?? "Category: Notebook  Laptop ",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),

                    SizedBox(
                      height: 10,
                    ),

                    // Row(mainAxisAlignment: MainAxisAlignment.end,

                    //   children: [
                    //     FlatButton(minWidth: 12,
                    //     color:Colors.red, child:Text("Decline",style: TextStyle(fontSize: 12,color:Colors.white)),
                    //     onPressed:(){}),
                    //     SizedBox(
                    //   width: 5,
                    // ),
                    // FlatButton(minWidth: 12,
                    //     color:Colors.green, child:Text("Accept",style: TextStyle(fontSize: 12,color:Colors.white)),
                    //     onPressed:(){}),

                    //   ],
                    // ),
                  ],
                ),
              ),
              // Icon(Icons.arrow_forward_ios),
              Padding(
                padding: const EdgeInsets.all(0),
                child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      locator<NavigationService>()
                          .globalNavigateTo(ViewDealersProducts, context);
                      // Navigator.pushNamed(context, '/productNameAdmin',
                      //     arguments: Product());
                      // // arguments:dealerId;
                    }),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
