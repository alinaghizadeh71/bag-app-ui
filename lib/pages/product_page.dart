import 'package:bag_app_ui/colors.dart';
import 'package:bag_app_ui/pages/card_page.dart';
import 'package:bag_app_ui/widgets/button_wiget.dart';
import 'package:flutter/material.dart';



class ProductPage extends StatefulWidget {
  final String picUrl;

  ProductPage({required this.picUrl, super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int? counts=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondary2Color,
        body: Container(
          padding: const EdgeInsets.only(
              top: 50.0, right: 20.0, left: 20.0, bottom: 20.0),
          width: double.infinity,
          child: Stack(
            children: [
              //appbar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.black54,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      AppbarWidgetProductPage()
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Salima Store",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "\$1.900",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              //details
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 330,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Back Bag",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text("Colors:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[600]!.withOpacity(0.3),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 11,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.cyanAccent,
                            radius: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.pinkAccent,
                            radius: 15,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //count
                      Row(
                        children: [
                          Text('Counts:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(counts.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          CountIconWidget(true,"assets/plus.png"),
                          SizedBox(
                            width: 10,
                          ),
                           CountIconWidget(false, "assets/minus.png"),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ButtonWidget(
                        title: 'Add To Card',
                        toast: 'Moved to cart',
                      )
                    ],
                  ),
                ),
              ),
              //image
              Positioned(
                left: 40.0,
                top: 150.0,
                child: Hero(
                  tag: widget.picUrl,
                  child: AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1),
                      height: 300,
                      width: 300,
                      child: Image.asset(widget.picUrl)),
                ),
              ),
            ],
          ),
        ));
  }
  CountIconWidget(final bool type, final String icon) {
  return Container(
    height: 40,
    width: 40,
    child: Center(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[200])),
        onPressed: () {
          setState(() { 
             type
              ?  counts= counts! + 1
              : (counts! > 0)
                  ? counts = counts! - 1
                  : Container();
                   print(counts);
          });
         
        },
        child: Image.asset(icon, fit: BoxFit.fill, color: Colors.black),
      ),
    ),
  );
}
}



class AppbarWidgetProductPage extends StatefulWidget {
  const AppbarWidgetProductPage({super.key});

  @override
  State<AppbarWidgetProductPage> createState() =>
      _AppbarWidgetProductPageState();
}

class _AppbarWidgetProductPageState extends State<AppbarWidgetProductPage> {
  late bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              isfavorite = !isfavorite;
              print(isfavorite);
            });
          },
          icon: isfavorite
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border_outlined),
          color: Colors.red,
        ),
        SizedBox(
          width: 10,
        ),
        Stack(children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: kPrimaryColor.withOpacity(.1)),
            child: IconButton(
              icon: Icon(Icons.shopping_bag),
              color: kPrimaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              },
            ),
          ),
          Positioned(
            top: -17,
            bottom: 20,
            left: 30,
            child: CircleAvatar(
              radius: 3.0,
              backgroundColor: Colors.red,
            ),
          )
        ])
      ],
    );
  }
}
