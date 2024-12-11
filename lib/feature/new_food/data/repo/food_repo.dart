import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/feature/new_food/data/model/food_item.dart';

class FoodRepository {
  final CollectionReference foodCollection = FirebaseFirestore.instance.collection('foods');

  Future<void> addFood(FoodItem food) {
    return foodCollection.add(food.toJson());
  }

  Stream<List<FoodItem>> getFoods() {
    return foodCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => FoodItem.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }
}
