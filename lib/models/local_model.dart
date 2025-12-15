import 'package:hive_flutter/hive_flutter.dart';

class Data{
  static final _localDB = Hive.box('localDB');

  static void writeData(String id, String domain){
    _localDB.put(1, id);
    _localDB.put(2, domain);
  }

  static bool readData(){
    return _localDB.get(1) != null;
  }
}