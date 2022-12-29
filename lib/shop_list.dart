// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class _Product {
  _Product({required this.name, required this.qty});
  String name;
  int qty;
  bool inCart = false;

  int firstqty = 0;

  void decrement() {
    firstqty += 1;
    if (this.qty != 0) {
      this.qty -= 1;
    } else {
      this.qty = firstqty - 1;
      this.firstqty = 0;
    }
    this.inCart = (qty == 0) ? true : false;
  }
}

List<_Product> productData = [
  _Product(name: "Telur", qty: 3),
  _Product(name: "Gula", qty: 2),
  _Product(name: "Tepung", qty: 2)
];

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop List"),
      ),
      body: _ProductList(),
    );
  }
}

class _ProductList extends StatefulWidget {
  _ProductList({super.key});

  @override
  State<_ProductList> createState() => __ProductListState();
}

class __ProductListState extends State<_ProductList> {
  @override
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  onTap: () {
                    setState(() {
                      productData[index].decrement();
                    });
                  },
                  leading: CircleAvatar(
                    backgroundColor:
                        productData[index].inCart ? Colors.grey : Colors.amber,
                    radius: 20,
                    child: Text(
                      productData[index].name[0],
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  title: Text(
                    "${productData[index].name} x${productData[index].qty}",
                    style: productData[index].inCart
                        ? TextStyle(
                            color: Colors.black38,
                            fontSize: 24,
                            decoration: TextDecoration.lineThrough)
                        : TextStyle(
                            fontSize: 24,
                          ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        productData.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        content: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Nama Item",
                                    icon: Icon(Icons.add),
                                  ),
                                  controller: _textController1,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Quantity",
                                    icon: Icon(Icons.add_box_outlined),
                                  ),
                                  controller: _textController2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                int qtyInput = int.parse(_textController2.text);
                                productData.add(_Product(
                                    name: _textController1.text,
                                    qty: qtyInput));
                              });
                            },
                            child: Text("Tambah"),
                          )
                        ],
                      );
                    });

                // setState(() {
                //   int qtyInput = int.parse(_textController2.text);
                //   productData.add(
                //       _Product(name: _textController1.text, qty: qtyInput));
                // });
              })
        ],
      ),
    );
  }
}
