import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sosial/models/user.dart';
import 'package:sosial/models/usersosial.dart';
class DatabaseService{

final String uid;
DatabaseService({this.uid});

//collection reference
final CollectionReference bpskoleksi  = Firestore.instance.collection('users');

Future updateUserData (String sugars, String name, int strength) async {
  return await bpskoleksi.document(uid).setData({
    'sugars':sugars,
    'name':name,
    'strength':strength,
  });
}

//list user from snapshot

List<User> _userFromSnapshot(QuerySnapshot snapshot){
 return snapshot.documents.map((doc){
   return User(
     name: doc.data['name']??'',
     jabatan: doc.data['jabatan']??'',
     jeniskelamin: doc.data['jeniskelamin'],
   );
 }).toList();
}

// userdata form snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return  UserData(
      uid: uid,
      name: snapshot.data['name'],
      jeniskelamin: snapshot.data['jeniskelamin'],
      jabatan: snapshot.data['jabatan'],
    );
  }


// get sosial stream
Stream<List<User>> get sosial{
  return bpskoleksi.snapshots()
  .map(_userFromSnapshot);
}


//get user doc stream

Stream<UserData> get userData {
  return bpskoleksi.document(uid).snapshots()
  .map(_userDataFromSnapshot);
}



}