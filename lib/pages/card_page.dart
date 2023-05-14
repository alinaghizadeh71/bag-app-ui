import 'package:animate_do/animate_do.dart';
import 'package:bag_app_ui/constant.dart';
import 'package:bag_app_ui/pages/product_page.dart';
import 'package:bag_app_ui/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bag_app_ui/MediaQueryValues.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../colors.dart';
import '../widgets/button_wiget.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
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
                    top: 50.0, right: 20.0, left: 20.0, bottom: 30.0),
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
                          "Your Cards",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shopping Address",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: (){
                               Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()));
                            },
                            child: Text( "Edit",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),),
                            
                           
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: kPrimaryColor,
                        ),
                        Text(
                          "Mohrenstrasse 37 10117 Berlin.",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //list favoride
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: images.length - 6,
                  itemBuilder: (context, inx) {
                    return FadeInRight(
                      child: BagCardWidget(
                        plantName: "Leather",
                        imgUrl: images[inx],
                        index: inx,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Final Price:",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "\$36.000",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20.0, bottom: 20.0),
                child: ButtonWidget(title: 'Shopping',toast: 'Go to Shopping',),
              )
            ],
          ),
        ));
  }
}

class BagCardWidget extends StatefulWidget {
  final String plantName;
  final String imgUrl;
  final int index;
  const BagCardWidget({
    Key? key,
    required this.plantName,
    required this.imgUrl,
    required this.index,
  }) : super(key: key);

  @override
  State<BagCardWidget> createState() => _BagCardWidgetState();
}

class _BagCardWidgetState extends State<BagCardWidget> {
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
          child: ItemCardWidget(boxWidth: _boxWidth, widget: widget),
        ),
      ),
    );
  }
}

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    super.key,
    required double? boxWidth,
    required this.widget,
  }) : _boxWidth = boxWidth;

  final double? _boxWidth;
  final BagCardWidget widget;

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
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.monetization_on_outlined,
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
                          Icon(
                            Icons.numbers_outlined,
                            size: 20.0,
                            color: kPrimaryColor,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            '3',
                            style: TextStyle(
                                color: kPrimary1Color,
                                fontSize: 17,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
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
