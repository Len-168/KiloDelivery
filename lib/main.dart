// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyTabBarPage(),
//     );
//   }
// }

// class MyTabBarPage extends StatefulWidget {
//   @override
//   _MyTabBarPageState createState() => _MyTabBarPageState();
// }

// class _MyTabBarPageState extends State<MyTabBarPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(
//         length: 3, vsync: this); // Adjust the length according to your tabs
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TabBar Example'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Tab 1'),
//             Tab(text: 'Tab 2'),
//             Tab(text: 'Tab 3'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           // Contents of Tab 1
//           Center(child: Text('Tab 1 Content')),

//           // Contents of Tab 2
//           Center(child: Text('Tab 2 Content')),

//           // Contents of Tab 3
//           Center(child: Text('Tab 3 Content')),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Set the active tab by index (e.g., setting it to Tab 2)
//           _tabController.animateTo(2);
//         },
//         child: Icon(Icons.arrow_forward),
//       ),
//     );
//   }
// }

import 'package:delivery_app/view/splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'binding/GetXBinding.dart';

void main() async {
  await GetStorage.init();
  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: DeliveryBinding(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
      ],
    );
  }
}
