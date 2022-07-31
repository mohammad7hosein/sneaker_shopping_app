import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneaker_shopping_app/filterButton.dart';
import 'package:sneaker_shopping_app/filter_color.dart';
import 'package:sneaker_shopping_app/shoe_model.dart';

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
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Color(0xffaaa6d6)),
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
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Hero(
                tag: widget.shoe.imageSrc,
                child: Image(
                  image: AssetImage(widget.shoe.imageSrc),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(42),
                            topLeft: Radius.circular(42))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTitleAndSubTitle(),
                        const SizedBox(
                          height: 24,
                        ),
                        buildSizes(),
                        const SizedBox(
                          height: 24,
                        ),
                        buildColors(),
                        const SizedBox(
                          height: 42,
                        ),
                        buildAddToCartButton(context)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildAddToCartButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.shoe.price,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icon/shop.svg',
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Text(
                  "Add to cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildColors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              width: 10,
            ),
            FilterColor(Colors.red),
            SizedBox(
              width: 20,
            ),
            FilterColor(Colors.green),
            SizedBox(
              width: 20,
            ),
            FilterColor(Colors.blue),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }

  Column buildSizes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                width: 10,
              ),
              FilterButton('US6', null, true),
              SizedBox(
                width: 10,
              ),
              FilterButton('US7', null, true),
              SizedBox(
                width: 10,
              ),
              FilterButton('US8', null, true),
              SizedBox(
                width: 10,
              ),
              FilterButton('US9', null, true),
              SizedBox(
                width: 10,
              ),
              FilterButton('US10', null, true),
              SizedBox(
                width: 10,
              ),
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
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          widget.shoe.subTitle,
          style: const TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
