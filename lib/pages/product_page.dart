import 'package:flutter/material.dart';
import 'package:flutter_product_list/models/product_model.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView.builder(
                itemCount: product.images?.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    product.images![index],
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            const Divider(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Color: Black',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(product.thumbnail ?? ''),
                    radius: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(product.thumbnail ?? ''),
                      radius: 35),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(product.thumbnail ?? ''),
                      radius: 35),
                ),
              ],
            ),
            Text(product.brand??''),
            Text(product.title??''),
            Text(product.description??'')
          ],
        ),
      ),
    );
  }
}
