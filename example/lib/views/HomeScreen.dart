import 'package:flutter/material.dart';
import 'package:okra_widget/okra_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        children: <Widget>[
          new Card(
            color : Colors.red,
            child: new SizedBox(
              height: 120,
              child: new Column(
                children: <Widget>[
                  new Text("Zenith Bank"),
                  new Text("2100014645 (Savings)"),
                  new Text("N 24,000"),
                ],
              )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          callOkra(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new IconButton(icon: Icon(Icons.home), onPressed: null),
              new IconButton(icon: Icon(Icons.home), onPressed: null),
              new IconButton(icon: Icon(Icons.home), onPressed: null),
              new IconButton(icon: Icon(Icons.home), onPressed: null),
            ],
          ),
          shape: CircularNotchedRectangle(),
          elevation: 24,
          color: Colors.blueGrey,
        ),
    );
  }
}

void callOkra(BuildContext context) async{
    var banks = [
      "ecobank-nigeria",
      "fidelity-bank",
      "first-bank-of-nigeria",
      "first-city-monument-bank",
      "guaranty-trust-bank",
      "access-bank",
      "unity-bank",
      "alat",
      "polaris-bank",
      "stanbic-ibtc-bank",
      "standard-chartered-bank",
      "sterling-bank",
      "union-bank-of-nigeria",
      "united-bank-for-africa",
      "wema-bank"
    ];

    OkraOptions options = OkraOptions(
        isWebview: true,
        key: "1ce5-58bf-af49-2d805fa8f798",
        token: "358130a943486f33dced",
        products: [Product.auth,
          Product.balance,
          Product.identity,
          Product.transactions],
        environment: "production-sandbox",
        clientName: "Carrot");
    options.color = "#9013FE";
    options.limit = "3";
    options.isCorporate = false;
    options.connectMessage = "Which account do you want to connect with?";
    options.callback_url = "";
    options.redirect_url = "";
    options.logo = "https://swipe.ng/assets/img/newswipe-logo-dark.svg";
    options.widget_success = "Your account was successfully linked to SwipeNG";
    options.widget_failed = "An unknown error occurred, please try again.";
    options.currency = "NGN";
    options.noPeriodic = true;
    options.exp = "";
    options.success_title = "null";
    options.success_message = "null";
    options.guarantors = new Guarantor(false,"""Carrot requires you to add guarantors""",1);
    options.filter = Filter("all", banks);
    OkraHandler reply = await Okra.create(context, options);
}