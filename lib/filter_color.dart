import 'package:flutter/material.dart';

class FilterColor extends StatefulWidget {
  final Color color;

  const FilterColor(this.color, {Key? key}) : super(key: key);

  @override
  State<FilterColor> createState() => _FilterColorState();
}

class _FilterColorState extends State<FilterColor> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 50,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Colors.white,
          ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5.0, 5.0), //Offset
              blurRadius: 10.0,
              spreadRadius: 2.0,
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
