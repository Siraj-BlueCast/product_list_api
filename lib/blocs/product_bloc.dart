import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_list/blocs/product_event.dart';
import 'package:flutter_product_list/blocs/product_state.dart';
import 'package:flutter_product_list/models/product_model.dart';
import 'package:flutter_product_list/resources/api_repo.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()){
    final ApiRepo _apiRepo = ApiRepo();

    on<GetProductList>((event, emit) async {
     try {
        emit(ProductLoading());
        final List<ProductModel> mList = await _apiRepo.fetchProductList();
        emit(ProductLoaded(mList));
        }
      catch (e) {
      emit(ProductError(e.toString()));
     }
    },);
  }
}