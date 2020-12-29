import 'package:cool_stepper/cool_stepper.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:insideapp/screens/home.dart';
import 'package:insideapp/models/request_submit_model.dart';
import 'package:provider/provider.dart';
import 'package:insideapp/providers/request_submit_provider.dart';

class ContractorsForm extends StatefulWidget {
  final String materialType;
  final String contractType;

  ContractorsForm(
      {Key key, @required this.materialType, @required this.contractType})
      : super(key: key);

  @override
  _ContractorsFormState createState() => _ContractorsFormState();
}

class _ContractorsFormState extends State<ContractorsForm> {
  final _formKey = GlobalKey<FormState>();
  bool others = false;
  String _buildingType = "";
  bool ownerShipCheckBoxValue = true;
  bool buildingPermitCheckBoxValue = true;
  bool geometryCheckBoxValue = true;
  bool supportCheckBoxValue = true;
  bool internalFinishingCheckBoxValue = true;
  bool externalFinishingCheckBoxValue = true;
  ConstructorRequest requestSubmitModel=ConstructorRequest();


  List<String> buildingList = [
    'Connected Villa',
    'Disconnected Villa',
    'Floor',
    'Floor and Apartment',
    'Apartment & Building',
    'Apartment, building and shops'
  ];

  TextEditingController landAreaTextEditingController = TextEditingController();
  TextEditingController shopDetailsTextEditingController =
      TextEditingController();
  TextEditingController otherDetailsTextEditingController =
      TextEditingController();
  TextEditingController floorsTextController = TextEditingController();
  TextEditingController landAddressTextEditingController =
      TextEditingController();
  TextEditingController buildingAreaTextEditingController =
      TextEditingController();
  TextEditingController requiredFinishingTextEditingController =
      TextEditingController();
  TextEditingController budgetTextEditingController = TextEditingController();

  bool shops = false;

  List<CoolStep> steps = [
    CoolStep(
        title: 'Building Details',
        subtitle: 'Information about the building',
        validation: () {},
        content: Column(
          children: [],
        ))
  ];

  bool areaError = false;
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
  String _location = "";
  String _subLocation = "";

  bool cairo = false;
  bool alex = false;
  bool sinai = false;
  bool giza = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    requestSubmitModel.material_on_client=widget.materialType=="Material On Client"?true:false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.black,
        title: Text(
          '${widget.contractType}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: CoolStepper(
        config: CoolStepperConfig(
            headerColor: Colors.black12,
            backText: "Back",
            finalText: 'Submit',
            iconColor: Colors.orangeAccent),
        onCompleted: () async{

          FocusScope.of(context).unfocus();
         showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => AlertDialog(
                title: Text("Confirmation"),
                content: Text('Request will be sent to Outside-in team'),
                actions: [
                  FlatButton(
                      onPressed: () async{
                        await Provider.of<RequestSubmitProvider>(context,listen: false).make_request(requestSubmitModel, 'construction');

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

                       // Navigator.of(context).pop();
                      },
                      child: Text('Cancel'))
                ],
                elevation: 10,
              ));
        },
        steps: [
          CoolStep(
            content: Column(
              children: [
                CheckboxListTile(
                  value: ownerShipCheckBoxValue,
                  onChanged: (val) {
                    if (ownerShipCheckBoxValue == false) {
                      setState(() {
                        ownerShipCheckBoxValue = true;
                       requestSubmitModel.owner_ship=true;
                      });
                    } else if (ownerShipCheckBoxValue == true) {
                      setState(() {
                        ownerShipCheckBoxValue = false;
                        requestSubmitModel.owner_ship=false;

                      });
                    }
                  },
                  title: new Text(
                    'Ownership of land / instrument',
                    style: TextStyle(fontSize: 14.0,
                        color: Colors.black
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.orangeAccent,
                ),
                CheckboxListTile(
                  value: buildingPermitCheckBoxValue,
                  onChanged: (val) {
                    if (buildingPermitCheckBoxValue == false) {
                      setState(() {
                        buildingPermitCheckBoxValue = true;
                        requestSubmitModel.building_permit=true;

                      });
                    } else if (buildingPermitCheckBoxValue == true) {
                      setState(() {
                        buildingPermitCheckBoxValue = false;
                       requestSubmitModel.building_permit=false;

                      });
                    }
                  },
                  title: new Text(
                    'Do you have a building permit',
                    style: TextStyle(fontSize: 14.0,
                        color: Colors.black
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.orangeAccent,
                ),
                CheckboxListTile(
                  value: geometryCheckBoxValue,
                  onChanged: (val) {
                    if (geometryCheckBoxValue == false) {
                      setState(() {
                        geometryCheckBoxValue = true;
                      requestSubmitModel.geometry_diagram=true;

                      });
                    } else if (geometryCheckBoxValue == true) {
                      setState(() {
                        geometryCheckBoxValue = false;
                       requestSubmitModel.geometry_diagram=false;

                      });
                    }
                  },
                  title: new Text(
                    'Do you have a supported geometry diagram',
                    style: TextStyle(fontSize: 14.0,
                        color: Colors.black
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.orangeAccent,
                ),
              ],
            ),
            title: 'Essential Information',
            subtitle: 'Things we need to know',
            validation: () {},
          ),
          CoolStep(
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
                     requestSubmitModel.buildingType=value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _buildingType = value;
                      requestSubmitModel.buildingType=value;

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
                    ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: shopDetailsTextEditingController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        decoration: new InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Shop Details",
                        ),
                        onChanged: (val){
                          requestSubmitModel.building_details=val;
                        },
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )
                    : Container(),
                others
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: otherDetailsTextEditingController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onChanged: (val){
                      requestSubmitModel.building_details=val;
                    },
                    autofocus: false,
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Colors.orangeAccent, width: 2.0),
                      ),
                      border: OutlineInputBorder(),
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
            title: 'Building Information',
            subtitle: 'Details about the building',
            validation: () {
              if (_buildingType == "") {
                return 'select building type';
              } else if (shops && shopDetailsTextEditingController.text == "") {
                return 'Define shop';
              } else if (others &&
                  otherDetailsTextEditingController.text == "") {
                return 'Define others';
              }
              return null;
            },
          ),
          CoolStep(
            content: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Floors '),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 80,
                        child: TextFormField(
                          controller: floorsTextController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          onChanged: (val){
                           requestSubmitModel.floor_num=val;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                            hintText: '0',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.orangeAccent, width: 2.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Apartment per floor '),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 80,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onChanged: (val){
                          requestSubmitModel.floor_apartment=val;

                          },
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(8, 1, 1, 8),
                            hintText: '0',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.orangeAccent, width: 2.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            title: 'Floor Information',
            subtitle: 'Details about floor and apartments',
            validation: () {
              if (floorsTextController.text == "") {
                return "Define floors";
              }
              return null;
            },
          ),
          CoolStep(
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
                      requestSubmitModel.location=value;
                      });
                    },
                    onChanged: (value) {
                      _location = value;
                      requestSubmitModel.location=value;

                      if (value == "Cairo") {
                        cairo = true;
                        alex = false;
                        sinai = false;
                        giza = false;
                        _subLocation = "";
                      } else if (value == "Alexandria") {
                        cairo = false;
                        sinai = false;
                        giza = false;
                        alex = true;
                        _subLocation = "";
                      } else if (value == "Sinai") {
                        cairo = false;
                        alex = false;
                        giza = false;
                        sinai = true;
                        _subLocation = "";
                      } else if (value == "Giza") {
                        cairo = false;
                        alex = false;
                        sinai = false;
                        giza = true;
                        _subLocation = "";
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
                          requestSubmitModel.sub_location=value;

                        });
                      },
                      onChanged: (value) {
                        _subLocation = value;
                       requestSubmitModel.sub_location=value;

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
                         requestSubmitModel.sub_location=value;

                        });
                      },
                      onChanged: (value) {
                        _subLocation = value;
                       requestSubmitModel.sub_location=value;

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
                        requestSubmitModel.sub_location=value;

                        });
                      },
                      onChanged: (value) {
                        _subLocation = value;
                       requestSubmitModel.sub_location=value;

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
                         requestSubmitModel.sub_location=value;

                        });
                      },
                      onChanged: (value) {
                        _subLocation = value;
                        requestSubmitModel.sub_location=value;

                        setState(() {});
                      },
                      dataSource: gizaCities,
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: landAreaTextEditingController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    onChanged: (val){
                  requestSubmitModel.land_area=val;

                    },

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
                      hintText: 'Land Area m2',
                      labelText: 'Land Area m2',
                    ),
                    // The validator receives the text that the user has entered.
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: buildingAreaTextEditingController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.numberWithOptions(),
                    onChanged: (val){
                     requestSubmitModel.building_area=val;

                    },
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
                      hintText: 'Building Area m2',
                      labelText: 'Building Area m2',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Required';
                      } else if (double.parse(value) >
                          double.parse(landAreaTextEditingController.text)) {
                        return 'Building can never be bigger than land';
                      }
                      return null;
                    },
                  ),
                ),
                areaError
                    ? Text(
                  'Building area can never be bigger than land area.',
                  style: TextStyle(color: Colors.red),
                )
                    : Container(),
              ],
            ),
            title: 'Land Information',
            subtitle: 'Details about the land',
            validation: () {
              if (_location == "") {
                return "Location is missing";
              }
              if (landAreaTextEditingController.text == "") {
                return "Land Area is missing";
              }
              if (buildingAreaTextEditingController.text == "") {
                return "Building Area is missing";
              }
              if (double.parse(landAreaTextEditingController.text) <
                  double.parse(buildingAreaTextEditingController.text)) {
                areaError = true;
                setState(() {});
                return 'error';
              } else {
                areaError = false;
                setState(() {});
              }
              return null;
            },
          ),
          if (widget.contractType == "With Finishing")CoolStep(
            content: Column(
              children: [
                CheckboxListTile(
                  value: internalFinishingCheckBoxValue,
                  onChanged: (val) {
                    if (internalFinishingCheckBoxValue == false) {
                      setState(() {
                        internalFinishingCheckBoxValue = true;
                       requestSubmitModel.internal=true;

                      });
                    } else if (internalFinishingCheckBoxValue == true) {
                      setState(() {
                        internalFinishingCheckBoxValue = false;
                       requestSubmitModel.internal=false;

                      });
                    }
                  },
                  title: new Text(
                    'Internal Finishing.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.orangeAccent,
                ),
                CheckboxListTile(
                  value: externalFinishingCheckBoxValue,
                  onChanged: (val) {
                    if (externalFinishingCheckBoxValue == false) {
                      setState(() {
                        externalFinishingCheckBoxValue = true;
                      requestSubmitModel.external=true;


                      });
                    } else if (externalFinishingCheckBoxValue == true) {
                      setState(() {
                        externalFinishingCheckBoxValue = false;
                      requestSubmitModel.external=false;

                      });
                    }
                  },
                  title: new Text(
                    'External Finishing.',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.orangeAccent,
                ),

              ],
            ),
            title: 'Finishing',
            subtitle: 'Define Required Finishing',
            validation: () {
              if (!internalFinishingCheckBoxValue &&
                  !externalFinishingCheckBoxValue) {
                return 'Finishing required';
              }
              return null;
            },
          ),
          CoolStep(
            content: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: budgetTextEditingController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.numberWithOptions(),
                    autofocus: false,
                    onChanged: (val){
                   requestSubmitModel.budget=val;
                    },
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
                      labelText: 'Proposed Budget / EGP',
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
                       requestSubmitModel.notes=val;
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
                          hintText: 'Notes',
                          labelText: 'Notes',
                          helperText: "Further information about your request. "
                      ),
                    )),
              ],
            ),
            title: 'Other Information',
            subtitle: 'Budget and message',
            validation: () {
              if (budgetTextEditingController.text == "") {
                return "Budget is empty";
              }
              return null;
            },
          ),
        ],
      ),
    );
    /*Scaffold(
      body: SingleChildScrollView(
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
              Row(
                children: [
                  Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.materialType}',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04),
                  ),
                ],
              ),

*/ /*
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // CheckboxListTile(
                    //   value: supportCheckBoxValue,
                    //   onChanged: (val) {
                    //     if (supportCheckBoxValue == false) {
                    //       setState(() {
                    //         supportCheckBoxValue = true;
                    //       });
                    //     } else if (supportCheckBoxValue == true) {
                    //       setState(() {
                    //         supportCheckBoxValue = false;
                    //       });
                    //     }
                    //   },
                    //   title: new Text(
                    //     'Support receivable by the ministry of housing and real estate fund',
                    //     style: TextStyle(fontSize: 14.0),
                    //   ),
                    //   controlAffinity: ListTileControlAffinity.leading,
                    //   activeColor: Colors.orangeAccent,
                    // ),

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
*/ /*
            ],
          ),
        ),
      ),
    );*/
  }
}
