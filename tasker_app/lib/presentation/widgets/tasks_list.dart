import 'package:flutter/material.dart';
import 'package:tasker_app/presentation/widgets/my_done_tasks.dart';

class TasksList extends StatelessWidget {
  bool done;
  TasksList({Key? key, required this.done}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Task(
            title: "Сломать тебе жизнь",
            date: DateTime(2020 - 10 - 10),
            description: "",
            status: false,
            creator_id: 1,
            user_id: 1000,
            project_id: null,
            deadline: DateTime(2020 - 10 - 10),
          ),
          Task(
            title: "Сдать и сделать диплом",
            date: DateTime(2020 - 10 - 10),
            description: "",
            status: false,
            creator_id: 1,
            user_id: 1000,
            project_id: null,
            deadline: DateTime(2020 - 10 - 10),
          ),
          Task(
            title:
                "Собрать весь assdosers и ываолдывл аорывлоралыовр аолрыfdddddddddddddddваолрsddddd",
            date: DateTime(2020 - 10 - 10),
            description: "",
            status: false,
            creator_id: 1,
            user_id: 1000,
            project_id: null,
            deadline: DateTime(2020 - 10 - 10),
          ),
          Task(
            title: "Cкинуть отчет по ТРПО",
            date: DateTime(2020 - 10 - 10),
            description: "",
            status: false,
            creator_id: 1,
            user_id: 1000,
            project_id: null,
            deadline: DateTime(2020 - 10 - 10),
          ),
          Task(
            title: "Cкинуть отчет по ТРПО",
            date: DateTime(2020 - 10 - 10),
            description: "",
            status: false,
            creator_id: 1,
            user_id: 1000,
            project_id: null,
            deadline: DateTime(2020 - 10 - 10),
          ),
          if (done == false) ...[
            MyDoneTasks(),
          ]
        ]));
  }
}

class Task extends StatefulWidget {
  final String title;
  final DateTime date;
  final String description;
  bool status; // int -> bool
  final int creator_id;
  final int? user_id;
  final int? project_id;
  final DateTime deadline;

  Task(
      // ?
      {Key? key,
      required this.title,
      required this.date,
      required this.description,
      required this.status,
      required this.creator_id,
      required this.user_id,
      required this.project_id,
      required this.deadline})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: SizedBox(
        child: Expanded(
          child: Card(
            color: Color(0x26C4C4C4),
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
                          setState(() {
                            widget.status = !widget.status;
                          });
                          //to done tasks
                        },
                        icon: Icon(
                            widget.status
                                ? Icons.check_box_outlined
                                : Icons.check_box_outline_blank,
                            color: Color(0xFFDADADA),
                            size: 28)),
                    Expanded(
                      child: Text(widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
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
      ),
    );
  }
}
