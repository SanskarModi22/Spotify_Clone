import 'package:flutter/material.dart';
class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
      bottomNavigationBar: _Footer(),
    );
  }
}
Widget _Footer()
{

}
Widget _Body()
{

}
