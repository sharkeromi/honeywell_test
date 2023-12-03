import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_pda_scanner/pda_listener_mixin.dart';
import 'package:honeywell_test/const.dart';

class Device2 extends StatefulWidget {
  const Device2({super.key});

  @override
  State<StatefulWidget> createState() => PageAlphaState();
}

class PageAlphaState extends State<Device2> with PdaListenerMixin<Device2> {
  var _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDA Scanner Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('*Start scanning with your device to get scanned data*', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: cIconColor)),
            Text('Scanning result: \n$_code', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }

  @override
  void onEvent(Object event) {
    setState(() {
      _code = event;
      log("ChannelPage: $event");
    });
  }

  @override
  void onError(Object error) {}
}
