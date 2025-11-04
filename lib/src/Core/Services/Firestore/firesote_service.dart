// part of 'imports_fire_store.dart';

// class FireStoreService<T> {
//   FireStoreService._();

//   static final FireStoreService instance = FireStoreService._();

//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//   Future<void> addData(
//       {required String collection,
//       required documentId,
//       required Map<String, dynamic> data}) async {
//     _fireStore.collection(collection).doc(documentId.toString()).set(data);
//   }

//   Future<Map<String, dynamic>> getData({
//     required String collection,
//     required documentId,
//   }) async {
//     var value = await _fireStore
//         .collection(collection)
//         .doc(documentId.toString())
//         .get();
//     Map<String, dynamic> data = value.data() ?? {};
//     return data;
//   }

//   Future<void> deleteData({
//     required String collection,
//     required documentId,
//   }) async {
//     await _fireStore.collection(collection).doc(documentId.toString()).delete();
//   }

//   Future<void> updateData(
//       {required String collection,
//       required documentId,
//       required Map<String, dynamic> data}) async {
//     printDM("updateData start  $collection $documentId");
//     await _fireStore
//         .collection(collection)
//         .doc(documentId.toString())
//         .update(data);
//   }

//   Future<void> getStreamData(
//       {required String collection,
//       required documentId,
//       Function(Map<String, dynamic>)? onUpdate}) async {
//     _fireStore
//         .collection(collection)
//         .doc(documentId.toString())
//         .snapshots(
//             includeMetadataChanges: true, source: ListenSource.defaultSource)
//         .listen(
//       (event) {
//         {
//           try {
//             if (onUpdate != null) {
//               printDM("getStreamData start  $collection $documentId");
//               onUpdate(event.data() ?? {});
//             }
//           } catch (e) {
//             printDM("error in getStreamData $e");
//           }
//         }
//       },
//     );
//   }

//   Stream<DocumentSnapshot<Map<String, dynamic>>> streamValue(
//       {required String collection, required documentId}) {
//     return _fireStore
//         .collection(collection)
//         .doc(documentId.toString())
//         .snapshots();
//   }

//   Future<void> updateArray(
//       {required String collection,
//       required documentId,
//       required Map<String, dynamic> data,
//       required String arrayName,
//       required UpdateArrayEnum type}) async {
//     switch (type) {
//       case UpdateArrayEnum.delete:
//         _fireStore.collection(collection).doc(documentId.toString()).update({
//           arrayName: FieldValue.arrayRemove([data])
//         });
//         break;
//       case UpdateArrayEnum.clear:
//         _fireStore
//             .collection(collection)
//             .doc(documentId.toString())
//             .update({arrayName: FieldValue.delete()});
//         break;
//       case UpdateArrayEnum.update:
//         _fireStore.collection(collection).doc(documentId.toString()).update({
//           arrayName: FieldValue.arrayUnion([data])
//         });
//         break;
//       case UpdateArrayEnum.add:
//         _fireStore.collection(collection).doc(documentId.toString()).update({
//           arrayName: FieldValue.arrayUnion([data])
//         });
//         break;
//     }
//   }
// }

// enum UpdateArrayEnum {
//   delete,
//   clear,
//   update,
//   add,
// }
