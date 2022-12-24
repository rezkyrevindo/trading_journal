import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trading_journal/utils/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  Future init() async {}

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });

    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsCustom.mainColor,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: "Daily",
                ),
                Tab(
                  text: "Calendar",
                ),
                Tab(
                  text: "Weekly",
                ),
                Tab(
                  text: "Monthly",
                ),
              ],
            ),
          ),
          body: new TabBarView(
            //controller untuk tab bar
            controller: controller,
            children: [
              Tab(
                text: "Monthly",
              ),
              Tab(
                text: "Monthly",
              ),
              Tab(
                text: "Monthly",
              ),
              Tab(
                text: "Monthly",
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Add your onPressed code here!
            },
            label: const Text('Add'),
            icon: const Icon(Icons.add),
            backgroundColor: ColorsCustom.mainColor,
          ),
        ),
      ),
    );
  }
}
