import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxSnackBar extends StatelessWidget {
  const GetxSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.snackbar(
                "Title", 
                "This is the titile of snack bar lalal",
                snackPosition: SnackPosition.BOTTOM,
                // titleText: Text("Title 02"),
                // messageText: Text("this is my new message 02"),
                colorText: Colors.amber,
                // backgroundColor: Colors.blue,
                borderRadius: 10,
                margin: EdgeInsets.all(20),
                // maxWidth: 60,
                animationDuration: Duration(milliseconds: 2000),
                isDismissible: true,
                dismissDirection: DismissDirection.horizontal,
                leftBarIndicatorColor: Colors.black,
                overlayBlur: 3,
                showProgressIndicator: true,
                icon: Icon(Icons.ac_unit),
                shouldIconPulse: true


                );
            },
            child: Text("Show Snack bar")),
      ),
    ));
  }
}
