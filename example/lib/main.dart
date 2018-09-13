import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'outline_material_icons example',
      home: MyHomePage(title: 'outline_material_icons example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedName;
  IconData selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                selectedIcon != null ? Icon(selectedIcon, size: 48.0) : Container(),
                Flexible(child: Text(
                  selectedName ?? "Select an icon",
                  style: Theme.of(context).textTheme.subhead,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
              ),
              itemCount: OMIcons.codePoints.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  selectedName = OMIcons.codePoints.keys.toList()[index];
                  selectedIcon = IconData(OMIcons.codePoints[selectedName], fontFamily: 'outline_material_icons', fontPackage: 'outline_material_icons');
                  setState(() {});
                },
                child: Icon(IconData(OMIcons.codePoints.values.toList()[index], fontFamily: 'outline_material_icons', fontPackage: 'outline_material_icons')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
