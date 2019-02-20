import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_course/widgets/products/product_card.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/scoped-models/products.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget productCard;

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(
          products[index], index
        ),
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text('No products found, please add some'),
      );
    }

    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return _buildProductList(model.displayedProducts);
      }
    );
  }
}
