import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._();
  factory FirebaseService() => _instance;
  FirebaseService._();

  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  Future<User?> signInWithEmail(String email, String password) async {
    final result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    final result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return null;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: '',
        idToken: googleAuth.idToken,
      );
      final result = await auth.signInWithCredential(credential);
      return result.user;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    await _googleSignIn.disconnect();
  }

  User? get currentUser => auth.currentUser;

  CollectionReference get usersCollection => firestore.collection('users');
  CollectionReference get adhkarCollection => firestore.collection('adhkar');
  CollectionReference get charityCollection =>
      firestore.collection('charity_items');
  CollectionReference get projectsCollection =>
      firestore.collection('projects');
  CollectionReference get donationsCollection =>
      firestore.collection('donations');
  CollectionReference get reportsCollection =>
      firestore.collection('financial_reports');
}
