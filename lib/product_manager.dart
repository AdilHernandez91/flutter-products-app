import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, dynamic> startingProduct;

  ProductManager({this.startingProduct}) {
    print('[Product Manager] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[Product Manager] createState');
    return _ProductManagerState();
  }
}

class _ProductManagerState  extends State<ProductManager> {
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    print('[Product Manager] initState');
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[Product Manager] didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[Product Manager] Build');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(child: Products(_products, deleteProduct: _deleteProduct),),
      ],
    );
  }
}
