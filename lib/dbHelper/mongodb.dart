
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
}
