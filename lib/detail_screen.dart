import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneaker_shop_app_animated/filterButton.dart';
import 'package:sneaker_shop_app_animated/filter_color.dart';
import 'package:sneaker_shop_app_animated/shoe_model.dart';

class DetailScreen extends StatefulWidget {
  final Shoe shoe;

  const DetailScreen(this.shoe, {Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Column(
          children: [
            buildImage(),
            buildDetails(context),
          ],
        ),
      ),
    );
  }

  buildDetails(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(42),
            topLeft: Radius.circular(42),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Animate(
                  effects: [
                    const FadeEffect(curve: Curves.easeInOut),
                    SlideEffect(
                      duration: 500.milliseconds,
                      curve: Curves.easeInOut,
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ),
                  ],
                  delay: 700.milliseconds,
                  child: buildTitleAndSubTitle(),
                ),
                const SizedBox(height: 24),
                Animate(
                  effects: [
                    const FadeEffect(curve: Curves.easeInOut),
                    SlideEffect(
                      duration: 500.milliseconds,
                      curve: Curves.easeInOut,
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ),
                  ],
                  delay: 800.milliseconds,
                  child: buildSizes(),
                ),
                const SizedBox(height: 24),
                Animate(
                  effects: [
                    const FadeEffect(curve: Curves.easeInOut),
                    SlideEffect(
                      duration: 500.milliseconds,
                      curve: Curves.easeInOut,
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ),
                  ],
                  delay: 900.milliseconds,
                  child: buildColors(),
                ),
                const SizedBox(height: 42),
                Animate(
                  effects: [
                    const FadeEffect(curve: Curves.easeInOut),
                    SlideEffect(
                      duration: 500.milliseconds,
                      curve: Curves.easeInOut,
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ),
                  ],
                  delay: 1000.milliseconds,
                  child: buildAddToCartButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().slideY(
          delay: 200.milliseconds,
          duration: 500.milliseconds,
          begin: 1,
          end: 0,
        );
  }

  buildImage() {
    return Animate(
      effects: [
        FadeEffect(curve: Curves.easeInOut, delay: 700.milliseconds),
      ],
      child: Expanded(
        flex: 2,
        child: Image(
          image: AssetImage(widget.shoe.imageSrc),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Theme.of(context).primaryColor,
      ),
      elevation: 0.0,
      backgroundColor: Theme.of(context).primaryColor,
      actions: [
        Icon(
          Icons.favorite_border_rounded,
          color: Theme.of(context).backgroundColor,
        ),
        const Padding(padding: EdgeInsets.all(8)),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }

  Widget buildAddToCartButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.shoe.price,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icon/shop.svg'),
                  const SizedBox(width: 10),
                  const Text(
                    "Add to cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildColors() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            FilterColor(Colors.red),
            SizedBox(width: 20),
            FilterColor(Colors.green),
            SizedBox(width: 20),
            FilterColor(Colors.blue),
            SizedBox(width: 20),
          ],
        ),
      ],
    );
  }

  Column buildSizes() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterButton('US6', null, true),
              SizedBox(width: 10),
              FilterButton('US7', null, true),
              SizedBox(width: 10),
              FilterButton('US8', null, true),
              SizedBox(width: 10),
              FilterButton('US9', null, true),
              SizedBox(width: 10),
              FilterButton('US10', null, true),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }

  Column buildTitleAndSubTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.shoe.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          widget.shoe.subTitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
