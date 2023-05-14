import 'package:animate_do/animate_do.dart';
import 'package:bag_app_ui/constant.dart';
import 'package:bag_app_ui/pages/home_page.dart';
import 'package:bag_app_ui/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:bag_app_ui/MediaQueryValues.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../colors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondary2Color,
        body: Container(
          width: double.infinity,
          child:
              //appbar
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, right: 20.0, left: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          alignment: Alignment.centerLeft,
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.black54,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          "Your Favorits",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //list favoride
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: images.length,
                  itemBuilder: (context, inx) {
                    return FadeInRight(
                      child: BagTileFavoridteWidget(
                        plantName: "Leather",
                        imgUrl: images[inx],
                        index: inx,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class BagTileFavoridteWidget extends StatefulWidget {
  final String plantName;
  final String imgUrl;
  final int index;
  const BagTileFavoridteWidget({
    Key? key,
    required this.plantName,
    required this.imgUrl,
    required this.index,
  }) : super(key: key);

  @override
  State<BagTileFavoridteWidget> createState() => _BagTileFavoridteWidgetState();
}

class _BagTileFavoridteWidgetState extends State<BagTileFavoridteWidget> {
  double? _boxWidth;

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
      _boxWidth = MediaQueryValues(context).width - 50.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 5),
      child: Container(
        width: _boxWidth,
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: const ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                flex: 1,
                onPressed: doNothing,
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
              SlidableAction(
                flex: 1,
                onPressed: doNothing,
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: ItemListWidget(widget: widget, boxWidth: _boxWidth, ),
        ),
      ),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    super.key,
    required this.widget,
    required double? boxWidth,
  }) : _boxWidth = boxWidth;

  final BagTileFavoridteWidget widget;
  final double? _boxWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(
                            picUrl: widget.imgUrl,
                          )));
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: 150,
              width: _boxWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Row(children: [
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.plantName,
                        style: TextStyle(
                            color: kPrimary1Color,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.price_change,
                              size: 20.0,
                              color: kPrimaryColor,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              '1.900',
                              style: TextStyle(
                                  color: kPrimary1Color,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                    // )
                  ],
                )
              ]),
            ),
          ),
        ),
        Positioned(
          left: 1,
          child: Container(
              height: 150, width: 150, child: Image.asset(widget.imgUrl)),
        ),
      ],
    );
  }
}

void doNothing(BuildContext context) {}
