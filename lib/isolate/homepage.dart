import 'package:flutter/material.dart';
import 'package:ui_ex/isolate/data_transfer_page.dart';
import 'package:ui_ex/isolate/infinite_process_page.dart';
import 'package:ui_ex/isolate/performance_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.flash_on),
                  text: 'Performance',
                ),
                Tab(
                  icon: Icon(Icons.sync),
                  text: 'Infinite Process',
                ),
                Tab(
                  icon: Icon(Icons.storage),
                  text: 'Data Transfer',
                ),
              ],
            ),
            title: Text('Isolate Example'),
          ),
          body: TabBarView(
            children: [
              //This here to call Page Class()..
              PerformancePage(),
              InfiniteProcessPageStarter(),
              DataTransferPageStarter(),
            ],
          ),
        ),
      ),
    );
  }
}