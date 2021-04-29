import 'package:flutter/material.dart';

import '../models/assessment.dart';
import '../models/form.dart';

class DetailsScreen extends StatelessWidget {
  final Assessment _assessment;

  DetailsScreen({assessment}) : _assessment = assessment;

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text(_assessment.member.shortName),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemCount: criteria.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(criteria[index].title),
              subtitle: Text(criteria[index].description),
              trailing:
                  _DropdownButton(index: index, points: _assessment.points),
            ),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('Save'),
            icon: const Icon(Icons.check_circle),
            heroTag: null,
            //TODO: Route back to the summary page.
            onPressed: () {
              Navigator.pop(context, _assessment);
            },
          ),
        ),
      ),
    );
  }
}

class _DropdownButton extends StatefulWidget {
  final int index;
  final List<int> points;

  _DropdownButton({this.index, this.points});

  @override
  __DropdownButtonState createState() => __DropdownButtonState();
}

class __DropdownButtonState extends State<_DropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: widget.points[widget.index],
      items: scales
          .map(
            (scale) => DropdownMenuItem(
              value: scale.value,
              child: Text(scale.title),
            ),
          )
          .toList(),
      onChanged: (newValue) =>
          setState(() => widget.points[widget.index] = newValue),
    );
  }
}
