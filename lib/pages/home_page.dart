import 'package:animate_do/animate_do.dart';
import 'package:bag_app_ui/pages/card_page.dart';
import 'package:bag_app_ui/pages/favorite_page.dart';
import 'package:bag_app_ui/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:bag_app_ui/MediaQueryValues.dart';
import 'package:bag_app_ui/colors.dart';
import 'package:bag_app_ui/constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<String> _list = ["All", "Belt", "Wallet", "Pouch", "Back pack"];  
  int _selectedItem = 0;
  late ScrollController _controller;

  void _scrollListner() {
    if (_controller.offset >= 100) {
      setState(() {
        print("scroll started");
        _boxHeight = 250;
        _topPickHight = 340;
        _imageSize = 150;
      });
    }
    if (_controller.offset <= 10) {
      setState(() {
        Future.delayed(Duration(milliseconds: 150), () {
          setState(() {
            print("reached top");
            _boxHeight = 300;
            _topPickHight = 380;
            _imageSize = 250;
          });
        });
      });
    }
  }

  double _boxHeight = 350;
  double _imageSize = 250;
  double _topPickHight = 380;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListner);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary2Color,
      body: Column(children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: _boxHeight,
          width: double.infinity,
          // color: Colors.amber,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: _topPickHight,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        kPrimaryColor.withOpacity(1),
                        kPrimaryColor.withOpacity(1),
                      ]),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      60,
                    ),
                  ),
                ),
                child: Stack(children: [
                  // * app bar
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50.0, right: 20.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "KIFET",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                        ),
                        AppbarWidget(),
                      ],
                    ),
                  ),

                  // * top picks
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Text(
                      "Top\n Bags",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // * plant image

                  Positioned(
                    right: 20,
                    bottom: 0.0,
                    child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1),
                      height: _imageSize,
                      width: _imageSize,
                      child: Image.asset("assets/plant1.png"),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
        //horizontal list
        Container(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedItem = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 60,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            _list[index],
                            style: TextStyle(
                                color: _selectedItem == index
                                    ? kPrimary1Color
                                    : kPrimaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  );
                }))),
        //vertical list
        Expanded(
          child: ListView.builder(
            controller: _controller,
            padding: EdgeInsets.zero,
            itemCount: images.length,
            itemBuilder: (context, inx) {
              return FadeInRight(
                duration: Duration(seconds: 1),
                child: BagTileWidget(
                  plantName: "Leather",
                  imgUrl: images[inx],
                  index: inx,
                ),
              );
            },
          ),
        )

        // * row dots wigets
      ]),
    );
  }
}

class AppbarWidget extends StatelessWidget {
  AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.favorite),
          color: Colors.red,
          onPressed: () {
            print('favvvvvvvvvv');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FavoritePage()));
          },
        ),
        SizedBox(
          width: 10,
        ),
        Stack(children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(.3)),
            child: IconButton(
              icon: Icon(Icons.shopping_bag),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              },
            ),
          ),
          Positioned(
            top: -20,
            bottom: 20,
            left: 30,
            child: CircleAvatar(
              radius: 5.0,
              backgroundColor: Colors.red,
            ),
          )
        ])
      ],
    );
  }
}

class BagTileWidget extends StatefulWidget {
  final String plantName;
  final String imgUrl;
  final int index;
  const BagTileWidget({
    Key? key,
    required this.plantName,
    required this.imgUrl,
    required this.index,
  }) : super(key: key);

  @override
  State<BagTileWidget> createState() => _BagTileWidgetState();
}

class _BagTileWidgetState extends State<BagTileWidget> {
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
        child: Stack(
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                                picUrl: widget.imgUrl,
                              )));
                },
                child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(widget
                        .imgUrl) /*  ZoomIn(                    
                        duration: Duration(seconds: 1),
                        child:  Image.asset(widget.imgUrl)), */
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void doNothing(BuildContext context) {}
