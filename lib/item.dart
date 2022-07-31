import 'package:flutter/material.dart';
import 'package:sneaker_shopping_app/detail_screen.dart';
import 'package:sneaker_shopping_app/shoe_model.dart';

class Item extends StatefulWidget {
  final Shoe shoe;

  const Item(this.shoe, {Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailScreen(widget.shoe)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                    isLiked
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                ),
                Icon(Icons.add, color: Theme.of(context).colorScheme.secondary)
              ],
            ),
            Expanded(
              child: Hero(
                tag: widget.shoe.imageSrc,
                child: Image.asset(
                  widget.shoe.imageSrc,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.shoe.title,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.shoe.subTitle,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.shoe.price,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
