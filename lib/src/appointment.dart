import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointment extends StatefulWidget {
  Appointment();
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name, add, date;
  BorderSide optionborder = BorderSide(color: Colors.green, width: 1);
  TextStyle optionStyle = TextStyle(color: Colors.green, fontSize: 20.0);
  final format = DateFormat("yyyy-MM-dd-HH:mm");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/7046.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 70.0)),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Enter The Name";
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelStyle: optionStyle,
                                labelText: "Name",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: optionborder)),
                            onSaved: (input) => name = input,
                          ),
                        ),
                        Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.green,
                            ),
                            child: Text("")),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Enter The Address";
                              }
                            },
                            maxLines: 5,
                            decoration: InputDecoration(
                                labelText: "adderess",
                                prefixIcon: Icon(Icons.location_on),
                                labelStyle: optionStyle,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: optionborder,
                                )),
                            onSaved: (input) => add = input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: <Widget>[
                              DateTimeField(
                                validator: (inout) {
                                  if (inout.isUtc) {
                                    return "inout.toUtc()";
                                  }
                                },
                                format: format,
                                onShowPicker: (context, currentValue) async {
                                  final date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2020),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2200));
                                  if (date != null) {
                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(
                                          currentValue ?? DateTime.now()),
                                    );
                                    return DateTimeField.combine(date, time);
                                  } else {
                                    return currentValue;
                                  }
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.date_range,
                                    ),
                                    labelText: 'Date & Time',
                                    labelStyle: optionStyle,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: optionborder,
                                    )),
                                onSaved: (input) => date = input as String,
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Container(
                          child: MaterialButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(10),
                            height: 40,
                            minWidth: 150.0,
                            child: Text(
                              "Confirm",
                              style: TextStyle(fontSize: 25),
                            ),
                            color: Colors.green,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            splashColor: Colors.lightGreen,
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
