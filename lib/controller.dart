import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:honeywell_scanner/honeywell_scanner.dart';

class HoneyController extends GetxController with WidgetsBindingObserver implements ScannerCallback {
  HoneywellScanner honeywellScanner = HoneywellScanner(onScannerDecodeCallback: (scannedData) {
    // Display the scanned data here
    log(scannedData!.code.toString());
  }, onScannerErrorCallback: (error) {
    // Handle the error here
  });
  ScannedData? scannedData;
  final RxString errorMessage = RxString('');
  final RxBool isDeviceSupported = RxBool(false);
  final RxBool scannerEnabled = RxBool(false);
  final RxBool scan1DFormats = RxBool(true);
  final RxBool scan2DFormats = RxBool(true);

  static const BTN_START_SCANNER = 0, BTN_STOP_SCANNER = 1, BTN_START_SCANNING = 2, BTN_STOP_SCANNING = 3;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    honeywellScanner.scannerCallback = this;
    init();
  }

  Future<void> init() async {
    updateScanProperties();
    isDeviceSupported.value = await honeywellScanner.isSupported();
    log('Device Support Status: $isDeviceSupported');
  }

  void updateScanProperties() {
    List<CodeFormat> codeFormats = [];
    if (scan1DFormats.value) codeFormats.addAll(CodeFormatUtils.ALL_1D_FORMATS);
    if (scan2DFormats.value) codeFormats.addAll(CodeFormatUtils.ALL_2D_FORMATS);

    Map<String, dynamic> properties = {
      ...CodeFormatUtils.getAsPropertiesComplement(codeFormats),
      'DEC_CODABAR_START_STOP_TRANSMIT': true,
      'DEC_EAN13_CHECK_DIGIT_TRANSMIT': true,
    };
    honeywellScanner.setProperties(properties);
  }

  void onDecoded(ScannedData? scannedData) {
    this.scannedData = scannedData;
  }

  void onError(Exception error) {
    errorMessage.value = error.toString();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        honeywellScanner.resumeScanner();
        break;
      case AppLifecycleState.inactive:
        honeywellScanner.pauseScanner();
        break;
      case AppLifecycleState.paused: //AppLifecycleState.paused is used as stopped state because deactivate() works more as a pause for lifecycle
        honeywellScanner.pauseScanner();
        break;
      case AppLifecycleState.detached:
        honeywellScanner.pauseScanner();
        break;
      default:
        break;
    }
  }

  Future<void> onClick(int id) async {
    try {
      errorMessage.value = '';
      if (id == 1) {
        if (await honeywellScanner.startScanner()) {
          scannerEnabled.value = true;
        }
      } else if (id == 2) {
        if (await honeywellScanner.stopScanner()) {
          scannerEnabled.value = false;
        }
      } else if (id == 3) {
        await honeywellScanner.startScanning();
      } else if (id == 4) {
        await honeywellScanner.stopScanning();
      }
    } catch (e) {
      errorMessage.value = e.toString();

      log(errorMessage.value);
    }
  }

  Widget scannedDataView(context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color, height: 0.8), children: [
        const TextSpan(text: 'Scanned code: '),
        TextSpan(text: '${scannedData?.code}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: 'Scanned codeId symbol: '),
        TextSpan(text: '${scannedData?.codeId}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: 'Scanned code type: '),
        TextSpan(text: '${scannedData?.codeType}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: 'Scanned aimId: '),
        TextSpan(text: '${scannedData?.aimId}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: 'Scanned charset: '),
        TextSpan(text: '${scannedData?.charset}\n\n', style: const TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }

  @override
  void dispose() {
    honeywellScanner.stopScanner();
    super.dispose();
  }
}
