import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_infinite_scroll_in_one_scroll_view/home/logic.dart';

class HomePage extends StatelessWidget {
  final HomePageLogic _logic = Get.put(HomePageLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      body: CustomScrollView(
        key: _logic.scrollViewKey,
        controller: _logic.scrollController,
        slivers: [
          Obx(
            () => SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  _logic.upperListItemLength.value,
                  (index) => Container(
                    height: 100.0,
                    decoration: const BoxDecoration(color: Colors.red),
                    alignment: Alignment.center,
                    child: Text(
                        'Upper ${_logic.upperListItemLength.value - index - 1}'),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  _logic.downerListItemLength.value,
                  (index) => Container(
                    height: 100.0,
                    decoration: const BoxDecoration(color: Colors.blue),
                    alignment: Alignment.center,
                    child: Text('Downer $index'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
