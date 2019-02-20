import 'package:flutter/material.dart';

import 'product_edit.dart';

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildIconButton(BuildContext context, int index) {
    return IconButton(
      icon:Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return ProductEditPage(product: products[index], updateProduct: updateProduct, productIndex: index,);
          }
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index]['title']),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            } else if (direction ==DismissDirection.startToEnd) {
              print('Swipe start to end');
            } else {
              print('Other swiping');
            }
          },
          background: Container(
            color: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index]['image']),
                ),
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price'].toString()}'),
                trailing: _buildIconButton(context, index),
              ),
              Divider(),
            ],
          )
        );
      },
    );
  }
}