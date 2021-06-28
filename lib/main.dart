import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final productImage = [
    'one.jpg',
    'two.jpg',
    'three.jpg',
    'four.jpg',
    'five.jpg',
    'six.jpg'
  ];
  final productName = [
    'Iphone 12',
    'Note 20 Ultra',
    'Macbook Air',
    'Macbook Pro',
    'Gaming PC',
    'Backlit Keyboard'
  ];
  final productRate = [5.0, 5.0, 5.0, 5.0, 5.0, 5.0];
  final productReview = [23, 23, 23, 23, 23, 23];

  final productCatImg = ['c1.png', 'e1.png', 'h1.png', 'e1.png', 'others.png'];
  final productCatName = [
    'Clothes',
    'Electronics',
    'Households',
    'Appliances',
    'Others'
  ];
  final productCatItems = [
    '5 items',
    '20 items',
    '5 items',
    '20 items',
    '15 items'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          // ignore: prefer_const_constructors
          title: Text(
            'EcomApp UI',
            // ignore: prefer_const_constructors
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: <Widget>[
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Builder(
          builder: (BuildContext context) {
            return RefreshIndicator(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'View More',
                            style: TextStyle(
                              color: Color(0xffa349bf),
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                        ),
                        itemCount: productImage.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageView) {
                          return Container(
                            child: Stack(
                              children: [
                                Container(
                                  width: 300,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                        '${productImage[itemIndex]}'),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: 300,
                                    padding: EdgeInsets.only(
                                        left: 8, bottom: 8, top: 8),
                                    decoration:
                                        BoxDecoration(color: Color(0xffd1d0cd)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${productName[itemIndex]}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              itemSize: 10,
                                              initialRating: 5,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Color(0xfffceb4e),
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            Text(
                                              '${productRate[itemIndex]}',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              '(${productReview[itemIndex]} Reviews)',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productCatName.length,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 200,
                            child: Card(
                              child: ListTile(
                                leading: Image(
                                    image:
                                        AssetImage('${productCatImg[index]}')),
                                title: Text(
                                  '${productCatName[index]}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  '${productCatItems[index]}',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Items',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'View More',
                            style: TextStyle(
                              color: Color(0xffa349bf),
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverGrid(
                      delegate: SliverChildListDelegate([
                        MyGrid('one.jpg', 'Iphone 12', 5.0, 23),
                        MyGrid('two.jpg', 'Note 20 Ultra', 5.0, 23),
                        MyGrid('three.jpg', 'Macbook Air', 5.0, 23),
                        MyGrid('four.jpg', 'Macbook Pro', 5.0, 23),
                        MyGrid('five.jpg', 'Gaming PC', 5.0, 23),
                        MyGrid('six.jpg', 'Baclit Keyboard', 5.0, 23),
                        MyGrid('seven.jpg', 'Mercedes', 5.0, 23),
                        MyGrid('eight.jpg', 'Mutton', 5.0, 23),
                        MyGrid('nine.jpg', 'Roadster', 5.0, 23),
                        MyGrid('ten.jpg', 'Royal Field', 5.0, 23),
                      ]),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2)),
                ],
              ),
              onRefresh: () async {
                await Future.value({});
              },
            );
          },
        ));
  }
}

class MyGrid extends StatelessWidget {
  final String productPopularImg;
  final String productPopularName;
  final double productPopularRate;
  final int productPopularReview;

  MyGrid(this.productPopularImg, this.productPopularName,
      this.productPopularRate, this.productPopularReview);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage('$productPopularImg'),
            fit: BoxFit.cover,
          ),
          Text(
            '$productPopularName',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              RatingBar.builder(
                itemSize: 10,
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Color(0xfffceb4e),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text(
                '$productPopularRate',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                '($productPopularReview Reviews)',
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
