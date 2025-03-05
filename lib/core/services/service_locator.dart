import 'package:fruits_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_dashboard/core/repos/image_repo/image_repo_impl.dart';
import 'package:fruits_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_dashboard/core/services/database_service.dart';
import 'package:fruits_dashboard/core/services/fire_storage.dart';
import 'package:fruits_dashboard/core/services/fire_store_service.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<StorageService>(FireStorage());
  getIt.registerSingleton<ImageRepo>(ImageRepoImpl(getIt.get<FireStorage>()));

  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
    getIt.get<DatabaseService>(),
  ));
}
