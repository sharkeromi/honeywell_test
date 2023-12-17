import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:honeywell_test/controller.dart';

class ExternalScanLayer2 extends StatelessWidget {
  ExternalScanLayer2({super.key});
  final HoneyController honeyController = Get.find<HoneyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layer 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Layer 2'),
            // ElevatedButton(
            //     onPressed: () {
            //       honeyController.scanValue.value = '';
            //     },
            //     child: Text('reset')),
            Text('Scanned data: \n${honeyController.scanValue}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
