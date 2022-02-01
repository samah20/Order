import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/providers/database_provider.dart';


class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Order'),
        backgroundColor: Colors.pink,

      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller:
                  Provider.of<DatabaseProvider>(context).taskTitleController,
              decoration: InputDecoration(
                  label: Text('Order Name') ,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            // CheckboxListTile(
            //   value: Provider.of<DatabaseProvider>(context).isComplete,
            //   onChanged: (value) {
            //     Provider.of<DatabaseProvider>(context, listen: false)
            //         .changeIsCompleteOnNewTaskScreen();
            //   },
            //   title: Text('I have done this order'),
            // ),
            InkWell(
              onTap: () async {
                await Provider.of<DatabaseProvider>(context, listen: false)
                    .insertNewTask();
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Add order',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
