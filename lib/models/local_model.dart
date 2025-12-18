import 'package:hive_flutter/hive_flutter.dart';

class LocalModel{
  static const String _keyId = 'userId';
  static const String _keyDomain = 'userDomain';
  static final _localDB = Hive.box('localDB');

  static void saveUser(String id, String domain){
    _localDB.put(_keyId, id);
    _localDB.put(_keyDomain, domain);
  }

  static Map<String, String>? readUser(){
    final id = _localDB.get(_keyId);
    final domain = _localDB.get(_keyDomain);

    return (id != null && domain != null) ? {'id': id, 'domain': domain} : null;
  }

  static void clearUser(){ //This function isn't used
    _localDB.delete(_keyId);
    _localDB.delete(_keyDomain);
  }

  static bool hasUser(){
    return _localDB.containsKey(_keyId) && _localDB.containsKey(_keyDomain);
  }
}