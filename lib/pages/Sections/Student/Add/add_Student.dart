import 'package:cms/dbHelper/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as m;
import 'add_MongoDBModel.dart';
import 'package:intl/intl.dart';
import 'input_controllers.dart';
import 'package:quickalert/quickalert.dart';

//                      GENDER FIELD
const List<String> list = <String>['Male', 'Female', 'Other'];

class addStudent extends StatefulWidget {
  const addStudent({Key? key}) : super(key: key);

  @override
  State<addStudent> createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {
  final formKey = GlobalKey<FormState>();
  String dropdownValue = list.first;

  //                       TODO:STEPPER FUNCTIONS
  int currentStep = 0;

  //                      WHEN USER CLICK ON NEXT BUTTON

  void onStepContinue() {
    if (currentStep < getSteps().length - 1) {
      setState(() {
        currentStep++;
      });
    } else {
       QuickAlert.show(
           context: context,
           type: QuickAlertType.success,
           text: "Student Created Successfully",
           onConfirmBtnTap: () {
             Navigator.pop(context);
             Navigator.pop(context);
           });






        //                  TODO:INSERT THE DATA TO THE SERVER
        _insertdata(
          fNameController.text,
          mNameController.text,
          lNameController.text,
          dateController.text,
          dropdownValue,
          aadharController.text,
          religionController.text,
          casteController.text,
          fOccupationController.text,
          motherNameController.text,
          motherTongueController.text,
          sPhone1Controller.text,
          sPhone2Controller.text,
          pPhoneController.text,
          sEmailController.text,
          addressController.text,
          qualificationController.text,
          scNameController.text,
          ctNameController.text,
        );

    }
  }

//                        WHEN USER CLICK ON BACK BUTTON
  void onStepCancel() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

//                       WHEN USER TAP DIRECTLY ON DESIRED STEPPER
  tapped(int step) {
    setState(() => currentStep = step);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("SmartByte"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
            primary: Color(0xff91c443),
          )),
          child: Stepper(
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xff91c443)),
                          onPressed: details.onStepContinue,
                          child: const Text("NEXT"),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      if (currentStep != 0)
                        Expanded(
                          child: TextButton(
                            onPressed: details.onStepCancel,
                            child: const Text('BACK'),
                          ),
                        ),
                    ],
                  ),
                );
              },
              type: StepperType.vertical,
              physics: const ClampingScrollPhysics(),
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: onStepContinue,
              onStepTapped: (step) => tapped(step),
              onStepCancel: onStepCancel),
        ),
      ),
    );
  }

  //            FUNCTION FOR INSERTING DATA INTO THE DATABASE

  Future<void> _insertdata(
    String firstname,
    String middleName,
    String lastName,
    String date,
    String gender,
    String aadhar,
    String religion,
    String caste,
    String fatherOccupation,
    String motherName,
    String motherTongue,
    String studentPhone1,
    String studentPhone2,
    String parentPhone,
    String studentEmail,
    String address,
    String qualification,
    String SchoolOrCollegeName,
    String ClassOrTuitionName,
  ) async {
    var _id = m.ObjectId();
    final data = add_MongoDBModel(
        id: _id,
        firstName: firstname,
        middleName: middleName,
        lastName: lastName,
        date: date,
        gender: gender,
        aadhar: aadhar,
        religion: religion,
        caste: caste,
        fatherOccupation: fatherOccupation,
        motherName: motherName,
        motherTongue: motherTongue,
        studentPhone1: studentPhone1,
        studentPhone2: studentPhone2,
        parentPhone: parentPhone,
        studentEmail: studentEmail,
        address: address,
        qualification: qualification,
        schoolOrCollegeName: SchoolOrCollegeName,
        classOrTuitionName: ClassOrTuitionName);
    var result = await MongoDatabase.insert(data);
    _clearAll();
  }
//                 CLEARING THE INPUT FIELDS AFTER USER CLICKS SUBMIT

  void _clearAll() {
    fNameController.text = "";
    mNameController.text = "";
    lNameController.text = "";
    dateController.text = "";
    aadharController.text = "";
    religionController.text = "";
    casteController.text = "";
    fOccupationController.text = "";
    motherNameController.text = "";
    motherTongueController.text = "";
    sPhone1Controller.text = "";
    sPhone2Controller.text = "";
    pPhoneController.text = "";
    sEmailController.text = "";
    addressController.text = "";
    qualificationController.text = "";
    scNameController.text = "";
    ctNameController.text = "";
  }

  List<Step> getSteps() => [
        //                                 TODO:PERSONAL
        Step(
          isActive: currentStep >= 0,
          state: currentStep > 0 ? StepState.complete : StepState.disabled,
          title: const Text("PERSONAL DETAILS"),
          content: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: fNameController,
                  decoration: InputDecoration(
                      label: Text("First Name"), border: roundBorder()),
                ),
                TextFormField(
                  controller: mNameController,
                  decoration: InputDecoration(
                      label: Text("Middle Name"), border: roundBorder()),
                ),
                TextFormField(
                  controller: lNameController,
                  decoration: InputDecoration(
                      label: Text("Last Name"), border: roundBorder()),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.none,
                      controller: dateController,
                      decoration: InputDecoration(
                          border: roundBorder(),
                          prefixIcon: const Icon(Icons.calendar_month_rounded),
                          labelText: "DOB"),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2200));
                        if (pickedDate != null) {
                          setState(() {
                            dateController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      },
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: DropdownButton(
                      value: dropdownValue,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: aadharController,
                  decoration: InputDecoration(
                      label: Text("Aadhar Card no"), border: roundBorder()),
                ),
                TextFormField(
                  controller: religionController,
                  decoration: InputDecoration(
                      label: Text("Religion"), border: roundBorder()),
                ),
                TextFormField(
                  controller: casteController,
                  decoration: InputDecoration(
                      label: Text("Caste"), border: roundBorder()),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        //                                 TODO:FAMILY
        Step(
          isActive: currentStep >= 1,
          state: currentStep > 1 ? StepState.complete : StepState.disabled,
          title: const Text("FAMILY DETAILS"),
          content: Column(
            children: [
              TextFormField(
                controller: fOccupationController,
                decoration: InputDecoration(
                    label: Text("Father's Occupation"), border: roundBorder()),
              ),
              TextFormField(
                controller: motherNameController,
                decoration: InputDecoration(
                    label: Text("Mother's Name"), border: roundBorder()),
              ),
              TextFormField(
                controller: motherTongueController,
                decoration: InputDecoration(
                    label: Text("Mother Tongue"), border: roundBorder()),
              )
            ],
          ),
        ),
        //                                 TODO:CONTACT
        Step(
          isActive: currentStep >= 2,
          state: currentStep > 2 ? StepState.complete : StepState.disabled,
          title: const Text("CONTACT DETAILS"),
          content: Column(
            children: [
              TextFormField(
                controller: sPhone1Controller,
                decoration: InputDecoration(
                    label: Text("Student Phone 1"), border: roundBorder()),
              ),
              TextFormField(
                controller: sPhone2Controller,
                decoration: InputDecoration(
                    label: Text("Student Phone 2"), border: roundBorder()),
              ),
              TextFormField(
                controller: pPhoneController,
                decoration: InputDecoration(
                    label: Text("Parent Phone"), border: roundBorder()),
              ),
              TextFormField(
                controller: sEmailController,
                decoration: InputDecoration(
                    label: Text("Student's Email"), border: roundBorder()),
              ),
              TextFormField(
                controller: addressController,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                    labelText: "Full Address", border: roundBorder()),
              ),
            ],
          ),
        ),
        //                                 TODO:EDUCATION
        Step(
          isActive: currentStep >= 3,
          state: currentStep > 3 ? StepState.complete : StepState.disabled,
          title: const Text("EDUCATION DETAILS"),
          content: Column(
            children: [
              TextFormField(
                controller: qualificationController,
                decoration: InputDecoration(
                    label: Text("Qualification"), border: roundBorder()),
              ),
              TextFormField(
                controller: scNameController,
                decoration: InputDecoration(
                    label: Text("School Or College Name"),
                    border: roundBorder()),
              ),
              TextFormField(
                controller: ctNameController,
                decoration: InputDecoration(
                    label: Text("Class Or Tuition Name"),
                    border: roundBorder()),
              )
            ],
          ),
        ),
        //                                 TODO:OTHER
        Step(
          isActive: currentStep >= 4,
          state: currentStep > 4 ? StepState.complete : StepState.disabled,
          title: const Text("OTHER DETAILS"),
          content: Container(
            child: const Text("Other"),
          ),
        ),
      ];


  // TextFormField Functions

  OutlineInputBorder roundBorder() {
    return
      OutlineInputBorder(borderRadius: BorderRadius.circular(20));
  }

}
