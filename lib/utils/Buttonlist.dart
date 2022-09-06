import 'package:fleetapp/screens/my_fleet.dart';
import 'package:fleetapp/utils/Buttondata.dart';
import 'package:flutter/material.dart';

class MyButtonList extends StatefulWidget {
  const MyButtonList({Key key, @required this.buttons}) : super(key: key);

  final List<ButtonData> buttons;

  @override
  State<MyButtonList> createState() => _MyButtonListState();
}

class _MyButtonListState extends State<MyButtonList> {
 List<bool> favoriateState;

  @override
  void initState() {
    favoriateState = List.generate(
        widget.buttons.length, (index) => widget.buttons[index].isFavorite);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < widget.buttons.length; i++)
          MyWidget(
            text: widget.buttons[i].text,
            onPressed: () {
              for (var j = 0; j < favoriateState.length; j++) {
                favoriateState[j] = false;
              }
              setState(() {
                favoriateState[i] = true;
                if (widget.buttons[i].onPressed != null) {
                  widget.buttons[i].onPressed();
                }
              });
            },
            isFavourte: favoriateState[i],
          ),
      ],
    );
  }
}
