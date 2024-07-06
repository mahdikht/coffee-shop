import 'package:coffee_shop/models/Coffee.dart';
import 'package:coffee_shop/services/CoffeeServices.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CoffeeServices coffeeServices = CoffeeServices();

  late Future<Coffee> futureCoffees;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCoffees = coffeeServices.getCoffees();
  }

  void onTap(int index) {
    setState(() {
      switch (index) {
        case 0:
          currentIndex = 0;
          break;
        case 1:
          currentIndex = 1;
          break;
        case 2:
          currentIndex = 2;
          break;
        default:
          currentIndex = 0;
      }
    });
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0c0f14),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: const BoxDecoration(
                          // color: Colors.black,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff262b33),
                                Color(0xff0e1116)
                              ]
                          ),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          color: Colors.black,
                          child: Image.asset(
                            'assets/images/randomguy.jpg',
                            fit: BoxFit.cover,
                            width: 45,
                            height: 45,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: const Text(
                        'بهترین قهوه رو واسه خودت انتخاب کن',
                        style: TextStyle(
                            color: Color(0xffd2d2d2),
                            fontSize: 36,
                            fontFamily: 'Yekan',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff141921),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                        child: TextField(
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                          decoration: InputDecoration(
                              icon: Icon(Icons.search,
                                  color: Color(0xff4c4f54), size: 30),
                              border: InputBorder.none,
                              hintText: 'قهوه مورد علاقه ات رو پیدا کن...',
                              hintStyle: TextStyle(
                                  color: Color(0xff4c4f54), fontSize: 20)),
                        ),
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                        stops: [0.0, 0.3  , 1, 1.0], // 10% purple, 80% transparent, 10% purple
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = 0;
                                });
                              },
                              child: CoffeeButton(
                                  text: 'کاپوچینو',
                                  isSelected: currentIndex == 0 ? true : false)),
                          SizedBox(width: 30,),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = 1;
                                });
                              },
                              child: CoffeeButton(
                                  text: 'اسپرسو',
                                  isSelected: currentIndex == 1 ? true : false)),
                          SizedBox(width: 30,),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = 2;
                                });
                              },
                              child: CoffeeButton(
                                  text: 'لاته',
                                  isSelected: currentIndex == 2 ? true : false)),
                          SizedBox(width: 30,),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = 3;
                                });
                              },
                              child: CoffeeButton(
                                  text: 'قهوه های دمی',
                                  isSelected: currentIndex == 3 ? true : false)),
                          SizedBox(width: 30,),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = 4;
                                });
                              },
                              child: CoffeeButton(
                                  text: 'موکا',
                                  isSelected: currentIndex == 4 ? true : false)),
                          SizedBox(width: 150,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: currentIndex == 0 ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        CoffeeTemplate(
                          image: 'assets/images/cappuccino.jpg',
                          title: 'کاپوچینو',
                          desc: 'با شیر',
                          price: '49,000',
                          rate: '4.5',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CoffeeTemplate(
                          image: 'assets/images/cappuccino2.jpg',
                          title: 'کاپوچینو',
                          desc: 'با شکلات',
                          price: '49,000',
                          rate: '4.3',
                        ),
                      ],
                    ) : currentIndex == 1 ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        CoffeeTemplate(image: 'assets/images/espresso.jpg', title: 'اسپرسو', desc: 'با شکلات', price: '39,000', rate: '3.9')
                      ],
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        CoffeeTemplate(image: 'assets/images/latte.jpg', title: 'لاته', desc: 'با شیر', price: '45,000', rate: '4.3')
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          )),
        ));
  }
}

class CoffeeTemplate extends StatelessWidget {
  const CoffeeTemplate(
      {Key? key,
      required this.image,
      required this.title,
      required this.desc,
      required this.price,
      required this.rate})
      : super(key: key);
  final String image;
  final String title;
  final String desc;
  final String price;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: 220,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff262b33),
            Color(0xff0e1116)
          ]
        ),
        borderRadius: BorderRadius.circular(20),
        // color: const Color(0xff1f232b),
      ),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.asset(
                        image,
                        width: 220,
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                      Opacity(
                          opacity: 0.9,
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20)),
                                color: Colors.black54),
                            width: 80,
                            height: 30,
                          )),
                      SizedBox(
                        width: 80,
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              rate.toPersianDigit(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 23,
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            alignment: Alignment.centerRight,
            child: Text(
              desc,
              style: const TextStyle(fontSize: 23, color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      price.toPersianDigit(),
                      style: const TextStyle(
                          fontSize: 25,
                          color: Color(0xffce7641),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text(
                      'تومان',
                      style: TextStyle(fontSize: 23, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffd17842),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 37,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CoffeeButton extends StatelessWidget {
  const CoffeeButton({Key? key, required this.text, required this.isSelected})
      : super(key: key);

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: isSelected
                    ? const Color(0xffd17842)
                    : const Color(0xff4b4e53),
                fontSize: 31),
          ),
          if (isSelected == true)
            ClipOval(
              child: Container(
                color: const Color(0xffd17842),
                width: 10,
                height: 10,
              ),
            )
        ],
      ),
    );
  }
}
