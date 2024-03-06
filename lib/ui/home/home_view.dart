import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:asdfg/Components/text_widgets.dart';
import 'package:asdfg/assets/colors.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  final ViewController controller = Get.put(ViewController());
  HomeScreen({Key? key}) : super(key: key);

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // heading -------------------------------
          Container(
            padding: const EdgeInsets.all(9.0),
            child:
                const HeadingBoldText(text: "ProXcure", color: MyColors.blueBg),
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MediumBoldText(
                      text: 'Porpular Auctions',
                    ),
                    MediumBoldText(
                      text: 'See All ->',
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 3,
                      padEnds: false,
                      autoPlayInterval: const Duration(seconds: 10),
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.easeInOutCubic),
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                                child: Image.network(item,
                                    fit: BoxFit.cover, width: 1000)),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          // lost auctions --------------------------------
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                MediumBoldText(
                  text: 'Last Auctions',
                ),
                MediumBoldText(
                  text: 'See All ->',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(9.0),
            height: 70,
            decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(40)
                ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search...',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: MyColors.blueBg,
                          style: BorderStyle.solid,
                          width: 1.5)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: MyColors.black45,
                          style: BorderStyle.solid,
                          width: 2.0)),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.tune))),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: const EdgeInsets.all(9.0),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // ----------------------LIST VIEW BUILDER----------------------
                return ListView.builder(
                  itemCount: controller.auctionList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    // ------------------------eEACH LIST CONTAINER-----------------
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      height: 70,
                      decoration: BoxDecoration(
                        color: MyColors.white100,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(3, 2),
                          ),
                        ],
                      ),
                      // -----------------COLUMN FOR CONTENT OF EACH CONTAINER---------------
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:200 ,
                                child: MediumBoldText(
                                  text: controller.auctionList[index].title
                                      .toString(),
                                ),
                              ),
                              Row(
                                children: const [
                                  SmallRegularText(text: "11h: 12m :10s"),
                                  SizedBox(width: 5,),
                                  Icon(
                                    LineIcons.gavel,
                                    color: MyColors.greenHighlight,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumRegularText(text: "Max Bid: Rs.45000/-"),
                              ElevatedButton(
                                onPressed: () {},
                                child: const SmallBoldText(text: "Bid Now"),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        // The button is pressed
                                        return MyColors.lightBlueBg;
                                      }
                                      // The button is not pressed
                                      return MyColors.lightBlueBg
                                          .withOpacity(0.5);
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
