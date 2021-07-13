import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class FirebaseMethods {
  // C R U D methods create Read Update Delete

  static void saveUserToFirebase({String uid, String name, String email}) {
    db.collection('users').doc(uid).set({
      'name': name,
      'email': email,
    });
  }

  static void getDataFromFirebase(String uid) async {
    await db.collection('users').doc(uid).delete();


    print('XXXXXXXXXX');


    // snapshot.docs.forEach((element) {
    //   print(element.data()['email']);
    //
    //
    //
    // });

    // print(snapshot.data()['email']);

    print('XXXXXXXXXX');
  }

// static addProductToCartOnFirebase(String uid){
//   db.collection('users').doc(uid).set({
//
//     'cart':
//
//   });
// }

}
