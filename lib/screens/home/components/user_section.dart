import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otterdev_gallery/components/custom_button.dart';
import 'package:otterdev_gallery/components/custom_shimmer.dart';
import 'package:otterdev_gallery/constants.dart';
import 'package:otterdev_gallery/controllers/user_controller.dart';
import 'package:otterdev_gallery/networks/api_response.dart';
import 'package:otterdev_gallery/screens/home/components/user_item.dart';

class UserSection extends StatelessWidget {
  const UserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController c = Get.find(tag: "user");
    return Obx(() {
      switch (c.status.value) {
        case Status.LOADING:
          return buildLoading(context);
        case Status.COMPLETED:
          return buildCompleted(context);
        case Status.ERROR:
          return buildError(context);
        default:
          return buildLoading(context);
      }
    });
  }

  Widget buildLoading(BuildContext context) {
    return Column(
      children: List.generate(
        6,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: kDefaultMargin),
          child: CustomShimmer(
            child: Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCompleted(BuildContext context) {
    UserController c = Get.find(tag: "user");
    return Column(
      children: List.generate(
        c.data.length,
        (index) => UserItem(c.data[index]),
      ),
    );
  }

  Widget buildError(BuildContext context) {
    UserController c = Get.find(tag: "user");
    return Column(
      children: [
        const Text("Oops! Something went wrong..."),
        const SizedBox(height: 10.0),
        CustomButton(
          "Reload",
          onPressed: c.fetch,
        ),
      ],
    );
  }
}
