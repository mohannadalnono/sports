import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

const d_green = const Color(0xFF4CAF50);

class FootbScreen extends StatefulWidget {
  String username;

  FootbScreen(this.username);

  @override
  State<FootbScreen> createState() => _FootbScreenState();
}

class _FootbScreenState extends State<FootbScreen> {
  String? periodDate;
  bool isReserved = false;
  late DateTime finRes;

  @override
  Widget build(BuildContext context) {
    List<String> instnc;
    List<List<String>> reserve = [];
    String finDate = "0";

    return Scaffold(
      appBar: AppBar(
        title: Text("Football"),
      ),
      body: Column(children: [
        Center(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  'Select Date',
                  style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  primary: d_green,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  // if (periodDate == null) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text("period is null!"),
                  //     ),
                  //   );
                  // } else {
                  //   instnc = [widget.username, periodDate!];
                  //   reserve.add(instnc);
                  //   setState(() {
                  //     isReserved = true;
                  //   });
                  // }

                  DatePicker.showDatePicker(
                    context,
                    onChanged: (time) {
                      finRes = time;
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  'Apply',
                  style: TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  primary: d_green,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  if (finDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("period is null!"),
                      ),
                    );
                  } else {
                    instnc = [widget.username, finRes.toString()];
                    reserve.add(instnc);
                  }
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  print(reserve);
                },
                child: Icon(Icons.abc))
          ],
        ))
      ]),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
