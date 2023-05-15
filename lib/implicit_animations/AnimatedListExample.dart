import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> _list = [];

  void _addItem() {
    setState(() {
      _list.insert(0, 'New Item ${_list.length}');
      _listKey.currentState?.insertItem(0);
    });
  }

  void _removeItem(int index) {
    setState(() {
      String removedItem = _list[index];
      _list.removeAt(index);
      _listKey.currentState
          ?.removeItem(index, duration: const Duration(milliseconds: 500),
              (BuildContext context, Animation<double> animation) {
        return ListTile(
          title: Text(removedItem),
          textColor: Colors.red,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated List Example"),
      ),
      body: AnimatedList(
          key: _listKey,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: Container(
                color: Colors.amber,
                child: ListTile(
                  title: Text(_list[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _removeItem(index);
                    },
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
