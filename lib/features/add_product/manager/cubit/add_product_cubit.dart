import 'package:bloc/bloc.dart';
import 'package:fruits_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_input_model.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this._imageRepo, this._productsRepo)
      : super(AddProductInitial());

  final ImageRepo _imageRepo;
  final ProductsRepo _productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await _imageRepo.uploadImage(addProductInputEntity.image);
    result.fold((failure) {
      emit(AddProductFailure(
        errMessage: failure.message,
      ));
    }, (url) async {
      addProductInputEntity.imageUrl = url;
      var result = await _productsRepo.addProduct(addProductInputEntity);
      result.fold((failure) {
        emit(AddProductFailure(errMessage: failure.message));
      }, (success) {
        emit(AddProductSuccess());
      });
    });
  }
}
