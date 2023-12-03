import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:honeywell_test/const.dart';
import 'package:honeywell_test/controller.dart';

class External extends StatelessWidget {
  External({super.key});
  final HoneyController honeyController = Get.find<HoneyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('External scanner'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('*Start scanning with your device to get scanned data*',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: cIconColor)),
                    Text('Scanned data: \n${honeyController.scanValue}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ElevatedButton(
                    //       // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                    //       onPressed: (honeyController.scannedData != null || honeyController.scanValue.value != '')
                    //           ? () {
                    //               // String data =
                    //               //     'Title: custom stop 1 Address: 20/4, pallabi, mirror-12, Dhaka, Bangladesh Date: 12-07-2023. Time: 10:00 - 12:00 Comment: habbeajd aoidjas';
                    //               if (honeyController.scanValue != '' && honeyController.scanValue.value.contains('Address:')) {
                    //                 honeyController.stringManipulation(honeyController.scanValue.value);
                    //               }
                    //             }
                    //           : null,
                    //       child: const Text("Parse scanned data"),
                    //     ),
                    //   ],
                    // ),
                    // CustomModifiedTextField(
                    //   controller: honeyController.title,
                    //   hint: 'Title',
                    //   inputAction: TextInputAction.done,
                    // ),
                    // CustomModifiedTextField(
                    //   controller: honeyController.address,
                    //   hint: 'Address',
                    //   inputAction: TextInputAction.done,
                    // ),
                    // CustomModifiedTextField(controller: honeyController.date, hint: 'Date'),
                    // CustomModifiedTextField(
                    //   controller: honeyController.time,
                    //   hint: 'Time',
                    //   inputAction: TextInputAction.done,
                    // ),
                    // CustomModifiedTextField(
                    //   controller: honeyController.comment,
                    //   hint: 'Comment',
                    //   inputAction: TextInputAction.done,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // void onDecoded(ScannedData? scannedData) {
  //   honeyController.scannedData = scannedData;
  // }
  // @override
  // void onError(Exception error) {
  //   honeyController.errorMessage.value = error.toString();
  // }
}
