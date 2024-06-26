
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badge;
import '../../shared_components/custom_widget/custom_widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final RxInt _selectedPageIndex = RxInt(0);
  final RxInt _selectedNavBarIndex = RxInt(1);
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _selectedPageIndex.value);
  }
  onTap(index) {
    if (index == 0) {
      _drawerKey.currentState!.openDrawer();
      // notificationController.badgeClean();
    } else if(index == 1){
      _selectedNavBarIndex.value = index ;
      pageController.jumpToPage(0);
    }else if(index == 2){
      _selectedNavBarIndex.value = index ;
      pageController.jumpToPage(1);
    }
    else if(index == 3){
      _selectedNavBarIndex.value = index ;
      pageController.jumpToPage(2);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: CustomWidgets().customDrawer(context),
      body: Column(
        children: [

        ],
      ),
    );
  }
}


