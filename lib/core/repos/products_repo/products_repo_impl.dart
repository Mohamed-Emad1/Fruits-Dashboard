import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/errors/failure.dart';
import 'package:fruits_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_dashboard/core/services/database_service.dart';
import 'package:fruits_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruits_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_model.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInputEntity addProductInputModel) async {
    try {
      await databaseService.addData(
          path: BackendEndpoints.addProduct,
          data: AddProductInputModel.fromEntity(addProductInputModel).toJson());

      return const Right(null);
    } catch (e) {
     return const Left(ServerFailure("Failed to add product"));
    }
  }
}
