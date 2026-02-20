import 'package:care_desk/src/core/network_structure/params/params.dart';
import 'package:care_desk/src/Core/params/pagination_params.dart';

abstract class BaseService<T> {
  //to get item by id
  Future<T?> getItem(Params? params);

  // to get all items
  Future<List<T>> getAll({Params? params, PaginationParams? pagination});

  // to create item with return item
  Future<T> createItem(T item);

  // to create item without return item
  Future<void> insert(T item);

  // to update item without return item
  Future<void> update(T item);

  // to delete item without return item
  Future<void> delete(int id);
}
