import 'package:flutter/material.dart';
import 'package:asdfg/ui/home/home_controller.dart';
import 'package:get/get.dart';


class ViewScreen extends StatelessWidget {
  final ViewController controller = Get.find();
  ViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount:controller.auctionList.length ,
              scrollDirection:Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(title: Text(controller.auctionList[index].title.toString()),);
              },
            );
          }
        }),
      );
    
  }
}
