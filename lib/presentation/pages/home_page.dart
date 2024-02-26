import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_list/presentation/blocs/product_bloc.dart';
import 'package:flutter_product_list/presentation/blocs/product_event.dart';
import 'package:flutter_product_list/presentation/blocs/product_state.dart';
import 'package:flutter_product_list/dependency_injection/dependency_injection.dart';
import 'package:flutter_product_list/domain/models/product_model.dart';
import 'package:flutter_product_list/presentation/pages/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // final ProductBloc _newBloc = ProductBloc(getIt());

  @override
  void initState() {
    getIt<ProductBloc>().add(GetProductList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchBar(
            leading: Icon(Icons.search),
            hintText: 'Search...',
          ),
        ),
        leadingWidth: 250,
        actions: const [
          //Spacer(flex: 15,),
          Icon(
            Icons.local_mall_outlined,
            size: 35,
          ),
          SizedBox(
            width: 25,
          ),
          //Spacer(flex: 2,),
          Icon(
            Icons.message_outlined,
            size: 35,
          ),
          SizedBox(
            width: 25,
          )
          //Spacer(flex: 1,),
        ],
      ),
      body: BlocProvider(
        create: (context) => getIt<ProductBloc>(),
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoaded) {
                List<ProductModel> model = state.productModel;
                return _buildView(context, model);
              } else if (state is ProductError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildView(BuildContext context, List<ProductModel> model) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: (6 / 10)),
      padding: const EdgeInsets.all(8),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(product: model[index]),));
          },
          child: GridTile(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.5,
                      //height: 250, //MediaQuery.of(context).size.height * 0.5,
                      child: Image(
                    image: NetworkImage(model[index].thumbnail.toString()),
                    fit: BoxFit.fill,
                  ))),
              //Image.network(model[index].thumbnail.toString()),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model[index].title}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      '${model[index].description}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${model[index].discountPercentage}%',style: const TextStyle(fontSize: 20,color: Colors.green
                        ),),
                        Text('\$ ${model[index].price}',style: const TextStyle(fontSize: 20,),),
                      ],
                    ),
                    Text('Only ${model[index].stock} left')
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
