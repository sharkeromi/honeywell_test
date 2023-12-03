import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:honeywell_test/controller.dart';

class Honeywell extends StatelessWidget {
  Honeywell({super.key});
  final HoneyController honeyController = Get.find<HoneyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Honeywell scanner'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Honeywell supported: ${honeyController.isDeviceSupported}',
                    style: TextStyle(color: honeyController.isDeviceSupported.value ? Colors.green : Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                    Text(
                      'Scanner: ${honeyController.scannerEnabled.value ? "Started" : "Stopped"}',
                      style: TextStyle(color: honeyController.scannerEnabled.value ? Colors.blue : Colors.orange),
                    ),
                  const SizedBox(height: 8),
                  if (honeyController.scannedData != null && honeyController.errorMessage.value == '' && honeyController.isDeviceSupported.value)
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color, height: 0.8), children: [
                        const TextSpan(text: 'Scanned code: '),
                        TextSpan(text: '${honeyController.scannedData?.code}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'Scanned codeId symbol: '),
                        TextSpan(text: '${honeyController.scannedData?.codeId}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'Scanned code type: '),
                        TextSpan(text: '${honeyController.scannedData?.codeType}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'Scanned aimId: '),
                        TextSpan(text: '${honeyController.scannedData?.aimId}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: 'Scanned charset: '),
                        TextSpan(text: '${honeyController.scannedData?.charset}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                    ),
                  const SizedBox(height: 8),
                  if (honeyController.errorMessage.value != '') ...[
                    Text(
                      'Error: ${honeyController.errorMessage.value}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                  ],
                  // SwitchListTile(
                  //   title: const Text("Scan 1D Codes"),
                  //   subtitle: const Text("like Code-128, Code-39, Code-93, etc"),
                  //   value: honeyController.scan1DFormats.value,
                  //   onChanged: (value) {
                  //     honeyController.scan1DFormats.value = value;
                  //     honeyController.updateScanProperties();
                  //   },
                  // ),
                  // SwitchListTile(
                  //   title: const Text("Scan 2D Codes"),
                  //   subtitle: const Text("like QR, Data Matrix, Aztec, etc"),
                  //   value: honeyController.scan2DFormats.value,
                  //   onChanged: (value) {
                  //     honeyController.scan2DFormats.value = value;
                  //     honeyController.updateScanProperties();
                  //   },
                  // ),
                  const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: const Text("Start Scanner"),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                          onPressed: () => honeyController.onClick(1),
                        ),
                        ElevatedButton(
                          child: const Text("Stop Scanner"),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue.shade700)),
                          onPressed: () => honeyController.onClick(2),
                        ),
                      ],
                    ),
                  const SizedBox(height: 10),
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
