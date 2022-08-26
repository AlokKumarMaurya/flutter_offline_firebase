import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Write extends StatefulWidget {
  const Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final TextEditingController textEditingController = TextEditingController();
  var data;
  final database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    final dailySpecialRef = database.child("AAA");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.amber,
          ),
          ElevatedButton(
              onPressed: () async {
                print(data);
                try {
                  await dailySpecialRef.set(data);
                } catch (e) {
                  print(e);
                }
              },
              child: Text("write")),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: TextField(
              controller: textEditingController,
              onChanged: ((value) => setState(() {
                    data = value;
                  })),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Set Text"))
        ],
      )),
    );
  }
}
