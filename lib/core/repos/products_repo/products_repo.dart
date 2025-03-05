import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failure.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure,void >> addProduct(AddProductInputEntity addProductInputModel);
}
