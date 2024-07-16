import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedCloseButton extends StatelessWidget {
  const RoundedCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black54,
      ),
      child: IconButton(
        icon: const Icon(Icons.close),
        onPressed: Get.back,
      ),
    );
  }
}
