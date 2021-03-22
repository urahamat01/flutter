import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SwipeDismissible extends StatefulWidget {
  SwipeDismissible({Key key}) : super(key: key);

  @override
  _SwipeDismissibleState createState() => _SwipeDismissibleState();
}

class _SwipeDismissibleState extends State<SwipeDismissible> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  //dynamic items = List<String>.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                items.removeAt(index);
              });

              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            child: ListTile(title: Text('$item')),
          );
        },
      ),
    );
  }
}
