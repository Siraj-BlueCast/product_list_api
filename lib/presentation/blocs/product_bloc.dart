import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_list/presentation/blocs/product_event.dart';
import 'package:flutter_product_list/presentation/blocs/product_state.dart';
import 'package:flutter_product_list/domain/models/product_model.dart';
import 'package:flutter_product_list/data/repo/api_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiRepo apiRepo;
  ProductBloc(this.apiRepo) : super(ProductInitial()) {
    on<GetProductList>(
      (event, emit) async {
        try {
          emit(ProductLoading());
          final List<ProductModel> mList = await apiRepo.fetchProductList();
          emit(ProductLoaded(mList));
        } catch (e) {
          emit(ProductError(e.toString()));
        }
      },
    );
  }
}
