import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet({ Key? key }) : super(key: key);

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    double sheet = 0;
    return 
      ExpandableBottomSheet(
          onIsContractedCallback: () {
          sheet = 0;

          setState(() {});
        },

        onIsExtendedCallback: () {
          sheet = 500;

          setState(() {});
        },
          expandableContent: Container(
            height: sheet,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 14, 18, 29),
                    Color(0xFF1B1E21),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 0.9),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          enableToggle: true,
          persistentContentHeight: sheet,
          background: Column(),
      );
  }
}