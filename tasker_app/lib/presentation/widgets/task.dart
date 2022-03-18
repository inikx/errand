import 'package:flutter/material.dart';
import 'package:tasker_app/data/models/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: SizedBox(
        child: Card(
          color: const Color(0x26C4C4C4),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              //open task
            },
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                      },
                      icon: Icon(
                          task.status == 1
                          ?
                          Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                          color: const Color(0xFFDADADA),
                          size: 28)),
                  Expanded(
                    child: Text(task.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}