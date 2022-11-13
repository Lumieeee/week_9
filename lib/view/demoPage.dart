import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:minggu_9/controller/demoController.dart';

class DemoPage extends StatelessWidget {
  final DemoController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
            child: Text(Get.arguments),
            ),
            SwitchListTile(
              value: ctrl.isDark,
              title: Text('Touch to change ThemeMode'),
              onChanged: ctrl.changeTheme
            ),
            ElevatedButton(
              onPressed: () => Get.snackbar(
                'Snackbar', 'Hello this is Snackbar message',
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white,
                backgroundColor: Colors.black87),
              child: Text('Snack Bar')
            ),
            ElevatedButton(
              onPressed: () => Get.defaultDialog(
                title: 'Dialouge',
                content: Text('Hey, from Dailouge')
              ),
              child: Text('Dialouge')
            ),
            ElevatedButton(
              onPressed: () => Get.bottomSheet(
                Container(
                 height: 150,
                 color: Colors.white,
                 child: Text(
                  'Hello from Bottom Sheet',
                  style: TextStyle(fontSize: 30),
                 ), 
                )),
              child: Text('Bottom Sheet')
            ),
            ElevatedButton(
              onPressed: () => Get.offNamed('/'),
              child: Text('Back to Home')
            ),
          ],
        ),
      ),
    );
  }
}