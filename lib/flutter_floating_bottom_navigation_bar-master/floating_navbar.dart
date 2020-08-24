import './floating_navbar_item.dart';
import 'package:flutter/material.dart';

typedef Widget ItemBuilder(BuildContext context, FloatingNavbarItem items);

class FloatingNavbar extends StatefulWidget {
  final List<FloatingNavbarItem> items;
  final int currentIndex;
  final void Function(int val) onTap;
  final Color selectedBackgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final int backgroundColor ;
  final double fontSize;
  final double iconSize;
  final double itemBorderRadius;
  final double borderRadius;
  final ItemBuilder itemBuilder;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double width;
  final double allWidth;


  FloatingNavbar({
    Key key,
    @required this.items,
    @required this.currentIndex,
    @required this.onTap,
    ItemBuilder itemBuilder,
    this.allWidth,
    this.backgroundColor = 0xffdddddd,
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = Colors.black,
    this.iconSize = 12.0,
    this.fontSize = 14.0,
    this.borderRadius = 8,
    this.itemBorderRadius = 8,
    this.unselectedItemColor = Colors.black,
    this.margin = const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
    this.padding = const EdgeInsets.only(bottom: 2, top: 2),
    this.width = double.infinity,
  })  : assert(items.length > 1),
        assert(items.length <= 5),
        assert(currentIndex <= items.length),
        assert(width > 50),
        itemBuilder = itemBuilder ??
            _defaultItemBuilder(
              unselectedItemColor: unselectedItemColor,
              selectedItemColor: selectedItemColor,
              borderRadius: borderRadius,
              fontSize: fontSize,
              backgroundColor: Color(backgroundColor),
              currentIndex: currentIndex,
              iconSize: iconSize,
              itemBorderRadius: itemBorderRadius,
              items: items,
              onTap: onTap,
              selectedBackgroundColor: selectedBackgroundColor,
              allWidth: allWidth,
            ),
        super(key: key);

  @override
  _FloatingNavbarState createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar> {
  List<FloatingNavbarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: widget.margin,
            child: Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: Color(widget.backgroundColor),
              ),
              width: widget.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: items.map((f) {
                    return widget.itemBuilder(context, f);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ItemBuilder _defaultItemBuilder({
  Function(int val) onTap,
  List<FloatingNavbarItem> items,
  int currentIndex,
  Color selectedBackgroundColor,
  Color selectedItemColor,
  Color unselectedItemColor,
  Color backgroundColor,
  double fontSize,
  double iconSize,
  double itemBorderRadius,
  double borderRadius,
  double allWidth
}) {
  return (BuildContext context, FloatingNavbarItem item) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: currentIndex == items.indexOf(item)
                      ? selectedBackgroundColor
                      : backgroundColor,
                  borderRadius: BorderRadius.circular(itemBorderRadius)),
              child: InkWell(
                onTap: () {
                  onTap(items.indexOf(item));
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  //max-width for each item
                  //24 is the padding from left and right
                  width: (allWidth) *
                          (100 / (items.length * 100))-4,

                  padding: EdgeInsets.all(4),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${item.title}',
                        style: TextStyle(
                          color: currentIndex == items.indexOf(item)
                              ? selectedItemColor
                              : unselectedItemColor,
                          fontSize: fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
