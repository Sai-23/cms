
import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';
import 'package:cms/pages/Sections/Student/Add/add_MongoDBModel.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }
  //                          TODO:INSERT FUNCTION
  static Future<String> insert(add_MongoDBModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted";
      } else {
        return "Something's Wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }
  //                          TODO:DISPLAY FUNCTION
static Future<List<Map<String,dynamic>>> getData()async{
    final arrData = await userCollection.find().toList();
    return arrData;
}
//                            TODO: UPDATE FUNCTION

static Future<void> update(add_MongoDBModel data)
async{
    var result = await userCollection.findOne({
      "_id":data.id
    });
    result['firstName'] = data.firstName;
    result['middleName'] = data.middleName;
    result['lastName'] = data.lastName;
    result['date'] = data.date;
    result['gender'] = data.gender;
    result['aadhar'] = data.aadhar;
    result['religion'] = data.religion;
    result['caste'] = data.caste;
    result['fatherOccupation'] = data.fatherOccupation;
    result['motherName'] = data.motherName;
    result['motherTongue'] = data.motherTongue;
    result['studentPhone1'] = data.studentPhone1;
    result['studentPhone2'] = data.studentPhone2;
    result['parentPhone'] = data.parentPhone;
    result['studentEmail'] = data.studentEmail;
    result['address'] = data.address;
    result['qualification'] = data.qualification;
    result['schoolOrCollegeName'] = data.schoolOrCollegeName;
    result['classOrTuitionName'] = data.classOrTuitionName;

     var response = await userCollection.save(result);
     inspect(response);

} }
