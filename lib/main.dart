import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneaker_shopping_app/filterButton.dart';
import 'package:sneaker_shopping_app/item.dart';
import 'package:sneaker_shopping_app/shoe_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xffaaa6d6), // purple
          cardColor: const Color(0xff1a191c), // black
          backgroundColor: const Color(0xfff4f5fc),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xfff68a0a)) // orange
          ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Widget searchIcon = SvgPicture.asset('assets/icon/search.svg');
  final Widget profileIcon = SvgPicture.asset('assets/icon/profile.svg');
  final Widget filterIcon = SvgPicture.asset('assets/icon/filter.svg');
  final Widget adidasIcon = SvgPicture.asset('assets/icon/adidas.svg');
  final Widget nikeIcon = SvgPicture.asset('assets/icon/nike.svg');
  final Widget pumaIcon = SvgPicture.asset('assets/icon/puma.svg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).backgroundColor,
            statusBarIconBrightness: Brightness.dark),
        leading: IconButton(onPressed: () {}, icon: profileIcon),
        actions: [
          IconButton(onPressed: () {}, icon: searchIcon),
          const SizedBox(
            width: 8,
          )
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              'Catalog',
              style: TextStyle(
                  fontFamily: 'Futura', color: Colors.black, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.filter_alt_rounded),
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontFamily: 'Futura',
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(
                            5.0,
                            5.0,
                          ), //Offset
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                FilterButton(null, nikeIcon, false),
                FilterButton(null, adidasIcon, false),
                FilterButton(null, pumaIcon, false)
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
            child: GridView.builder(
                itemCount: shoes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7),
                itemBuilder: (context, index) => Item(shoes[index])),
          ))
        ],
      ),
    );
  }
}
