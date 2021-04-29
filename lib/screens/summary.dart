import 'package:flutter/material.dart';

import '../models/assessment.dart';
import '../models/group_member.dart';

class SummaryScreen extends StatelessWidget {
  final GroupMember _evaluator;
  final List _assessments;

  SummaryScreen({evaluator, assessments})
      : _evaluator = evaluator,
        _assessments = assessments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              children: <Widget>[
                const Text(
                  'Peer and Self Assessement by',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  _evaluator.fullName,
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          body: ListView.separated(
            itemCount: _assessments.length,
            itemBuilder: (context, index) => _ListTile(
              index: index,
              assessements: _assessments,
            ),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  final int index;
  final List<Assessment> assessements;
  _ListTile({this.index, this.assessements});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.assessements[widget.index].member.shortName),
      subtitle: Text(widget.assessements[widget.index].member.fullName),
      trailing: CircleAvatar(
        child: Text(
          widget.assessements[widget.index].percent.round().toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: widget.assessements[widget.index].percent < 50
            ? Colors.red
            : Colors.green,
      ),
      //TODO: Add the navigation to the detail screen
      onTap: () async {
        var a = await Navigator.pushNamed(context, 'detail',
            arguments: widget.assessements[widget.index]);

        setState(() {
          widget.assessements[widget.index] = a;
        });
      },
    );
  }
}
