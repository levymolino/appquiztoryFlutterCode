import 'package:appquiztory/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  UserModel? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserModel( email: '', uid: '', name: '', profileImage: '');
  }

  Stream<UserModel?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserModel?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<UserModel?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
        postDetailsToFirestore();
    return _userFromFirebase(credential.user);
  }
postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    auth.User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel(email: '', name: '', profileImage: '', uid: '');
    userModel.uid = user!.uid;
    // narimetisaigopi@gmail.com
    userModel.email = user.email!;
    userModel.name = user.email!.split("@")[0];
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
