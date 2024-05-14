import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_crud/fire_crud.dart';
import 'package:utility_master/data/user/app_user.dart';

import 'admin/app_user_restricted.dart';

class Crud {
  // static FireCrud<MTGDeck> deck(String userId) => FireCrud(
  //   collection: FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(userId)
  //       .collection('decks'),
  //   toMap: (d) => d.toMap(),
  //   fromMap: (id, data) => MTGDeckMapper.fromMap(data)..id = id,
  // );
  //
  // static FireCrud<MTGCard> card(String userId) => FireCrud(
  //   collection: FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(userId)
  //       .collection('cards'),
  //   toMap: (d) => d.toMap(),
  //   fromMap: (id, data) => MTGCardMapper.fromMap(data)..id = id,
  // );

  static FireCrud<AppUser> user() => FireCrud(
        collection: FirebaseFirestore.instance.collection('user'),
        toMap: (d) => d.toMap(),
        fromMap: (id, data) => AppUserMapper.fromMap(data)..id = id,
      );

  static FireCrud<AppUserRestricted> userRestricted(String uid) => FireCrud(
        collection: FirebaseFirestore.instance.collection('user').doc(uid).collection("restricted"),
        toMap: (d) => d.toMap(),
        fromMap: (id, data) => AppUserRestrictedMapper.fromMap(data)..id = id,
      );
}
