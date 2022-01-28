import 'package:flutter/material.dart';
import 'package:u_taxi/tabPages/earning_tab.dart';
import 'package:u_taxi/tabPages/home_tab.dart';
import 'package:u_taxi/tabPages/profile_tab.dart';
import 'package:u_taxi/tabPages/rating_tab.dart';
 
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routName = '/mainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController!.index = _selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeTabPage(),
          EarningTabPage(),
          RatingTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: 'Earning'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Rating'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: onItemClicked,
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
