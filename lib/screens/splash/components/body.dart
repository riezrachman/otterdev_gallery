import 'package:flutter/material.dart';
import 'package:otterdev_gallery/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/images-solid.png",
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Otterdev",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 4.0),
              Text(
                "Gallery",
                style: TextStyle(
                  color: kDarkColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
