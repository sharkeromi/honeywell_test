import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:honeywell_test/routes.dart';

class ExternalScanLayer1 extends StatelessWidget {
  const ExternalScanLayer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layer 1'),
        
      ),
      body: Center(
        child: Column(
          children: [
            Text('Layer 1'),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Get.toNamed(krLayer2);
            }, child: Text('Go to layer 2'))
          ],
        ),
      ),
    );
  }
}