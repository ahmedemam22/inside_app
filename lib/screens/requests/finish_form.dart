import 'package:cool_stepper/cool_stepper.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insideapp/models/finish_request_model.dart';
import 'package:insideapp/providers/request_submit_provider.dart';
import 'package:provider/provider.dart';


import '../home.dart';

class FinishingForm extends StatefulWidget {
  @override
  _FinishingFormState createState() => _FinishingFormState();
}

class _FinishingFormState extends State<FinishingForm> {
  final _formKey = GlobalKey<FormState>();

  bool fullFinishingCheckBoxValue = true;
  bool partialFinishingCheckBoxValue = false;
  String _buildingType = "";

  bool shops = false;
  bool others = false;

  List<Map> cities = [
    {"display": "Cairo", "value": "Cairo"},
    {"display": "Giza", "value": "Giza"},
    {"display": "Alexandria", "value": "Alexandria"},
    {"display": "Sinai", "value": "Sinai"}
  ];
  List<Map> cairoCities = [
    {"display": "Nasr City", "value": "Nasr City"},
    {"display": "Helwan", "value": "Helwan"},
    {"display": "6th of October", "value": "6th of October"},
  ];

  List<Map> alexCities = [
    {"display": "AbouKier City", "value": "AbouKier"},
    {"display": "Sedebeshr", "value": "Sedebeshr"},
    {"display": "Sporting", "value": "Sporting"},
  ];
  List<Map> sinaiCities = [
    {"display": "El-Toor", "value": "El-Toor"},
    {"display": "Saint Cathrine", "value": "Saint Cathrine"},
    {"display": "Sharm el Shiekh", "value": "Sharm el Shiekh"},
  ];
  List<Map> gizaCities = [
    {"display": "El-Hwamdya", "value": "El-Hwamdya"},
    {"display": "El-Badrsheen", "value": "El-Badrsheen"},
  ];

  var _location = "";
  var _subLocation = "";
  bool cairo = false;
  bool alex = false;
  bool sinai = false;
  bool giza = false;

  TextEditingController shopDetailsTextEditingController =
      TextEditingController();
  TextEditingController otherTextEditingController = TextEditingController();
  TextEditingController currentStatusTextEditingController =
      TextEditingController();
  TextEditingController budgetTextEditingController = TextEditingController();
  TextEditingController areaTextEditingController = TextEditingController();
  TextEditingController roomsTextEditingController = TextEditingController();
  TextEditingController bathroomsTextEditingController =
      TextEditingController();
  FinishRequestModel finishRequestModel=FinishRequestModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(
              FontAwesomeIcons.paintRoller,
              color: Colors.orangeAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Finishing',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: CoolStepper(
        config: CoolStepperConfig(
            headerColor: Colors.grey,
            backText: "Back",
            finalText: 'Submit',
            iconColor: Colors.orangeAccent),
        onCompleted: ()async {
          FocusScope.of(context).unfocus();

          await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => AlertDialog(
                title: Text("Confirmation"),
                content: Text('Request will be sent to Outside-in team'),
                actions: [
                  FlatButton(
                      onPressed: ()async {
                        await Provider.of<RequestSubmitProvider>(context,listen: false).make_request(finishRequestModel, 'finishing');

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return Home();
                            },
                          ),
                        );
                      },
                      child: Text('Confirm')),
                  FlatButton(
                      onPressed: () async{

                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'))
                ],
                elevation: 10,
              ));
        },
        steps: [
          CoolStep(
              title: 'Building Type',
              subtitle: 'Details about your building',
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownFormField(
                      titleText: 'Building Type',
                      hintText: 'Please choose one',
                      value: _buildingType,
                      onSaved: (value) {
                        setState(() {
                          _buildingType = value;
                          finishRequestModel.buildingType=value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _buildingType = value;
                          finishRequestModel.buildingType=value;
                          value == "Other" ? others = true : others = false;
                          value == "Shop" ? shops = true : shops = false;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Connected Villa",
                          "value": "Connected Villa",
                        },
                        {
                          "display": "Disconnected Villa",
                          "value": "Disconnected Villa",
                        },
                        {
                          "display": "Floor",
                          "value": "Floor",
                        },
                        {
                          "display": "Floor and Apartment",
                          "value": "Floor and Apartment",
                        },
                        {
                          "display": "Apartment and Building",
                          "value": "Apartment and Building",
                        },
                        {
                          "display": "Apartment, Building and Shops",
                          "value": "Apartment, Building and Shops",
                        },
                        {
                          "display": "Chalet",
                          "value": "Chalet",
                        },
                        {
                          "display": "Shop",
                          "value": "Shop",
                        },
                        {
                          "display": "Other",
                          "value": "Other",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                  shops
                      ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: shopDetailsTextEditingController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.orangeAccent, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Shop Details',
                        labelText: 'Shop Details',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  )
                      : Container(),
                  others
                      ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: otherTextEditingController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.orangeAccent, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Other building type',
                        labelText: 'Other building type',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  )
                      : Container(),
                ],
              ),
              validation: () {
                if (_buildingType == "") {
                  return "building type required";
                } else if (shops &&
                    shopDetailsTextEditingController.text == "") {
                  return "shop type is required";
                } else if (others && otherTextEditingController.text == "") {
                  return "Other type is missing";
                }
                return null;
              }),
          CoolStep(
              title: 'Finishing Type',
              subtitle: 'Full or Partial',
              content: Column(
                children: [
                  CheckboxListTile(
                    value: fullFinishingCheckBoxValue,
                    onChanged: (val) {
                      if (fullFinishingCheckBoxValue == false) {
                        setState(() {
                          fullFinishingCheckBoxValue = true;
                          partialFinishingCheckBoxValue = false;
                          finishRequestModel.full_finishing=true;
                          finishRequestModel.partial_finishing=false;

                        });
                      } else if (fullFinishingCheckBoxValue == true) {
                        setState(() {
                          fullFinishingCheckBoxValue = false;
                          partialFinishingCheckBoxValue = true;
                          finishRequestModel.full_finishing=false;
                          finishRequestModel.partial_finishing=true;
                        });
                      }
                    },
                    title: new Text(
                      'Full Finishing',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.orangeAccent,
                  ),
                  CheckboxListTile(
                    value: partialFinishingCheckBoxValue,
                    onChanged: (val) {
                      if (partialFinishingCheckBoxValue == false) {
                        setState(() {
                          partialFinishingCheckBoxValue = true;
                          fullFinishingCheckBoxValue = false;
                          finishRequestModel.full_finishing=false;
                          finishRequestModel.partial_finishing=true;
                        });
                      } else if (partialFinishingCheckBoxValue == true) {
                        setState(() {
                          partialFinishingCheckBoxValue = false;
                          fullFinishingCheckBoxValue = true;
                          finishRequestModel.full_finishing=true;
                          finishRequestModel.partial_finishing=false;
                        });
                      }
                    },
                    title: new Text(
                      'Partial Finishing',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.orangeAccent,
                  ),
                ],
              ),
              validation: () {}),
          CoolStep(
              title: 'Current status',
              subtitle: 'More information about current status of the unit',
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: currentStatusTextEditingController,
                      onChanged: (val){
                        finishRequestModel.current_status=val;

                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },

                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.orangeAccent, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Current Status',
                      ),
                      // The validator receives the text that the user has entered.
                    ),
                  )
                ],
              ),
              validation: () {
                if (currentStatusTextEditingController.text == "") {
                  return "Current status is required";
                }
                return null;
              }),
          CoolStep(
              title: 'Area and building ',
              subtitle: 'More required information',
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: areaTextEditingController,
                      onChanged: (val){
                        finishRequestModel.area=val;

                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },

                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.orangeAccent, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Area m2',
                      ),
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: roomsTextEditingController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (val){
                        finishRequestModel.room_num=val;

                      },

                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.orangeAccent, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Number of rooms',
                      ),
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: bathroomsTextEditingController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (val){
                        finishRequestModel.bathroom_num=val;

                      },
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.orangeAccent, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Number of Bathrooms',
                      ),
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                ],
              ),
              validation: () {
                if (areaTextEditingController.text == "") {
                  return "Current status is required";
                }
                if (roomsTextEditingController.text == "") {
                  return "number of rooms are required";
                }
                if (bathroomsTextEditingController.text == "") {
                  return "number of bathrooms are required";
                }
                return null;
              }),
          CoolStep(
              title: 'Location',
              subtitle: 'Information About the location',
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownFormField(
                      titleText: 'Location',
                      hintText: 'Please choose one',
                      value: _location,
                      onSaved: (value) {
                        setState(() {
                          _location = value;

                            finishRequestModel.location=value;


                        });
                      },
                      onChanged: (value) {
                        _location = value;
                        finishRequestModel.location=value;

                        if (value == "Cairo") {
                          cairo = true;
                          alex = false;
                          sinai = false;
                          giza = false;
                          _subLocation = "";
                          finishRequestModel.city_location="";


                        } else if (value == "Alexandria") {
                          cairo = false;
                          sinai = false;
                          giza = false;
                          alex = true;
                          _subLocation = "";

                          finishRequestModel.city_location="";
                        } else if (value == "Sinai") {
                          cairo = false;
                          alex = false;
                          giza = false;
                          sinai = true;
                          _subLocation = "";

                          finishRequestModel.city_location="";
                        } else if (value == "Giza") {
                          cairo = false;
                          alex = false;
                          sinai = false;
                          giza = true;
                          _subLocation = "";
                          finishRequestModel.city_location="";

                        }
                        setState(() {});
                      },
                      dataSource: cities,
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                  if (cairo)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownFormField(
                        titleText: 'City',
                        hintText: 'Please choose one',
                        value: _subLocation,
                        onSaved: (value) {
                          setState(() {
                            _subLocation = value;
                            finishRequestModel.city_location=value;



                          });
                        },
                        onChanged: (value) {
                          _subLocation = value;
                          finishRequestModel.city_location=value;

                          setState(() {});
                        },
                        dataSource: cairoCities,
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
                  if (alex)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownFormField(
                        titleText: 'City',
                        hintText: 'Please choose one',
                        value: _subLocation,
                        onSaved: (value) {
                          setState(() {
                            _subLocation = value;
                            finishRequestModel.city_location=value;

                          });
                        },
                        onChanged: (value) {
                          _subLocation = value;
                          finishRequestModel.city_location=value;

                          setState(() {});
                        },
                        dataSource: alexCities,
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
                  if (sinai)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownFormField(
                        titleText: 'City',
                        hintText: 'Please choose one',
                        value: _subLocation,

                        onSaved: (value) {
                          setState(() {
                            _subLocation = value;
                            finishRequestModel.city_location=value;

                          });
                        },
                        onChanged: (value) {
                          _subLocation = value;
                          finishRequestModel.city_location=value;

                          setState(() {});
                        },
                        dataSource: sinaiCities,
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
                  if (giza)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropDownFormField(
                        titleText: 'City',
                        hintText: 'Please choose one',
                        value: _subLocation,
                        onSaved: (value) {
                          setState(() {
                            _subLocation = value;
                            finishRequestModel.city_location=value;

                          });
                        },
                        onChanged: (value) {
                          _subLocation = value;
                          finishRequestModel.city_location=value;

                          setState(() {});
                        },
                        dataSource: gizaCities,
                        textField: 'display',
                        valueField: 'value',
                      ),
                    )
                ],
              ),
              validation: () {
                if (_location == "" || _subLocation == "") {
                  return "location details required";
                }
                return null;
              }),
          CoolStep(
              title: 'Budget',
              subtitle: 'Budged and extra information',
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (val){
                        finishRequestModel.budget=val;

                      },
                      controller: budgetTextEditingController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.numberWithOptions(),
                      autofocus: false,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.orangeAccent, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Proposed Budget / EGP',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (val){
                        finishRequestModel.request_finishing=val;

                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: 4000,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.orangeAccent, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Requested finishing',
                          helperText: "Requesting finishing in details."),
                    ),
                  ),
                ],
              ),
              validation: () {
                if (budgetTextEditingController.text == "") {
                  return "budged are required";
                }
                return null;
              }),
        ],
      )

      /*SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Fill the form',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2,
                color: Colors.orangeAccent,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [






                    RaisedButton(
                      color: Colors.orangeAccent,
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                        }
                      },
                      child: Text('Submit'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )*/,
    );
  }
}
