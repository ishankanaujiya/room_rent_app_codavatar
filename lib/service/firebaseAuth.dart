import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication
{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  registerUser(String email, String password) async
  {
    try
    {
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return user;
    }
    on FirebaseAuthException catch(e)
    {
      if(e.code == 'weak-password')
      {
        throw e;
      }
      if(e.code == 'email-already-in-use')
      {
        throw e;
      }
    }
    catch(e)
    {
      print(e.toString());
    }
  }

  userSignIn(String email, String password) async
  {
    try
    {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    }
    on FirebaseAuthException catch(e)
    {
      if(e.code == 'weak-password')
      {
        throw e;
      }
      if(e.code == 'email-already-in-use')
      {
        throw e;
      }
    }
    catch(e)
    {
      print(e.toString());
    }
  }
}