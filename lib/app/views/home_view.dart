import 'package:appfire/app/components/currency_box.dart';
import 'package:appfire/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 150, left: 30, right: 30, bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/github.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 60),
                CurrencyBox(
                    seletedItem: homeController.toCurrency,
                    controller: toText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.toCurrency = model!;
                      });
                    }),
                SizedBox(height: 50),
                CurrencyBox(
                    seletedItem: homeController.fromCurrency,
                    controller: fromText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.fromCurrency = model!;
                      });
                    }),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber, // background
                    onPrimary: Colors.black, // foreground
                  ),
                  onPressed: () {
                    homeController.convert();
                  },
                  child: Text('Converter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
