import 'package:flutter/material.dart';

class EarningTabPage extends StatefulWidget {
  const EarningTabPage({ Key? key }) : super(key: key);

  @override
  _EarningTabPageState createState() => _EarningTabPageState();
}

class _EarningTabPageState extends State<EarningTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Earning Tab Page"),),
    );
  }
}