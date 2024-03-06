import 'package:asdfg/ui/home/repository_home.dart';
import 'package:flutter/material.dart';
import 'package:asdfg/models/aunction_model.dart';
import 'package:get/get.dart';


class ViewController extends GetxController {
  Api api = Api();
  RxBool isLoading = true.obs;
  var auctionList = <Results>[].obs;

  get carouselController => null;

  @override
  void onInit() {
    fetchAuctions();
    super.onInit();
  }

  void fetchAuctions() async {
    try {
      isLoading(true);
      var auctions = await api.fetchAuctionsfromAPI();
      auctionList.assignAll(auctions.results ?? []);
       print("Auction List Length: ${auctionList.length}");
       
    } finally {
      isLoading(false);
    }
  }
}
