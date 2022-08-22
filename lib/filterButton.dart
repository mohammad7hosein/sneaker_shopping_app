import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final Widget? icon;
  final String? text;
  final bool isText;

  const FilterButton(this.text, this.icon, this.isText, {Key? key})
      : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
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
        padding: const EdgeInsets.all(4),
        child: widget.isText
            ? Container(
                width: 45,
                height: 45,
                alignment: Alignment.center,
                child: Text(
                  widget.text!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                icon: widget.icon!,
              ),
        decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(
                  5.0,
                  5.0,
                ), //Offset
                blurRadius: 10.0,
                spreadRadius: 2.0,
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(16))),
      ),
    );
  }
}
