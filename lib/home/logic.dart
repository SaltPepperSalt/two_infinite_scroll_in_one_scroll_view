import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomePageLogic extends GetxController {
  final RxBool isUpperListItemLeft = false.obs;
  final RxBool isDownerListItemLeft = false.obs;
  final RxInt upperListItemLength = 10.obs;
  final RxInt downerListItemLength = 10.obs;

  final GlobalKey scrollViewKey = GlobalKey();

  final int upperListItemLimit = 50;
  final int downerListItemLimit = 50;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          scrollController.position.pixels <
              scrollController.position.minScrollExtent + 200 &&
          upperListItemLength.value <= upperListItemLimit) {
        double currentPosition = scrollController.position.pixels;
        upperListItemLength.value += 10;
        scrollController.jumpTo(currentPosition + 100 * 10);
      } else if (scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          scrollController.position.pixels + 200 >
              scrollController.position.maxScrollExtent &&
          downerListItemLength.value <= downerListItemLimit) {
        downerListItemLength.value += 10;
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    scrollController
        .jumpTo(100 * 10 - (getSize(scrollViewKey)?.height ?? 0) / 2);
    super.onReady();
  }

  Size? getSize(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      Size size = renderBox.size;
      return size;
    }
    return null;
  }
}
