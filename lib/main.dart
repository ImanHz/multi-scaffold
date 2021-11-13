import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var show = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Scaffold',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              setState(() {
                show = !show;
              });
            },
          ),
          title: const Text("App"),
        ),
        body: InsideWidget(show: show),
      ),
    );
  }
}

class InsideWidget extends StatelessWidget {
  const InsideWidget({
    Key? key,
    required this.show,
  }) : super(key: key);

  final bool show;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Row(
      children: [
        show
            ? SizedBox(
                width: 0.2 * w,
                height: h,
                child: Drawer(
                    child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
                  child: ListView(
                    children: const [
                      DrawerHeader(child: Text("Iman")),
                      ListTile(
                        leading: Icon(Icons.ac_unit),
                        title: Text("Home"),
                      ),
                      ListTile(
                        leading: Icon(Icons.account_tree_sharp),
                        title: Text("Home2"),
                      ),
                      ListTile(
                        leading: Icon(Icons.radio_button_unchecked_outlined),
                        title: Text("Home3"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.vertical_distribute_rounded),
                        title: Text("Home3"),
                      ),
                    ],
                  ),
                )),
              )
            : Container(),
        SizedBox(
          width: show ? 0.8 * w : w,
          height: h,
          child: const Scaffold(
              backgroundColor: Colors.yellow,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              floatingActionButton: FloatingActionButton(
                  onPressed: null, child: Icon(Icons.inbox)),
              body:
                  SizedBox(width: 100, child: Center(child: Text("Content")))),
        ),
      ],
    );
  }
}
