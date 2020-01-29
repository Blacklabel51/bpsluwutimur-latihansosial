import 'package:firebase_auth/firebase_auth.dart';
import 'package:sosial/models/user.dart';
import 'package:sosial/services/database.dart';

class AuthService {

final FirebaseAuth _auth = FirebaseAuth.instance;

// create user obj based on firebaseuser

Userprofile _userFromfirebaseUser(FirebaseUser user) {
  return user != null ? Userprofile(uid: user.uid) : null;
}
//auth changed user auth
Stream<Userprofile>get user{
  return _auth.onAuthStateChanged
    .map(_userFromfirebaseUser); 
}

// sign in anon
Future signInAnon() async {
  try {
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromfirebaseUser(user);
      }catch(e){
          print(e.toString());
          return null;
      }
}


// sign in with email & password
Future signinEmail(String email, String password)async{
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user  = result.user;
    return _userFromfirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}

// register with email & password
Future registerEmail(String email, String password)async{
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user  = result.user;

    //create a new document for user with uid
    await DatabaseService(uid: user.uid).updateUserData('Nama Anda','Laki-laki','Mitra BPS');
    return _userFromfirebaseUser(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}
// sign out
Future signout()async{
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }
}
}