import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_model.dart';

abstract class ProductsRepo {
  Future<void> addProduct(AddProductInputModel addProductInputModel);
}