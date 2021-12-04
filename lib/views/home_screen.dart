import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.location_on),
        title: Text('damascus'.tr()),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.filter),),
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.search),)
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {  },),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(items:  [
        BottomNavigationBarItem(icon:Icon(Icons.home), label: 'home'.tr()),
        BottomNavigationBarItem(icon:Icon(Icons.home),  label: 'my reals'.tr()),
      ],),
    );
  }
}
