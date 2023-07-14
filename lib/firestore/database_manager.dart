import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference productsList =
      FirebaseFirestore.instance.collection("products");

  Future<void> createProductData(
      String name, String category, int id, List<String> imageUrls) async {
    return await productsList.doc('products').set(
        {'name': name, "category": category, "id": id, 'imageUrls': imageUrls});
  }

  Future updateProductList(
      String name, String category, int id, List<String> imageUrls) async {
    return await productsList.doc('products').update(
        {'name': name, 'category': category, 'id': id, 'imageUrls': imageUrls});
  }

  Future<List<Map<String, dynamic>>> getProductsList() async {
    List<Map<String, dynamic>> itemsList = [];

    try {
      final querySnapshot = await productsList.orderBy('id').get();
      // ignore: avoid_function_literals_in_foreach_calls
      querySnapshot.docs.forEach((element) {
        final data = (element.data() as Map<String, dynamic>);
        final imageUrlList =
            (data['imageUrls'] as List<dynamic>).cast<String>().toList();
        final updatedData = Map<String, dynamic>.from(data);
        updatedData['imageUrls'] = imageUrlList;
        itemsList.add(updatedData);
      });
      return itemsList;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }
}
