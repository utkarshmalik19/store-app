import 'package:flutter/material.dart';
import 'package:store_app/presentation/widgets/bottom_navbar.dart';
import 'package:store_app/presentation/widgets/custom_button.dart';
import 'package:store_app/utils/consts.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class CartItem {
  String itemName;
  String description;
  double price;
  int quantity;
  String imageUrl;

  CartItem({
    required this.itemName,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      itemName: 'Product 1',
      description: 'Description for Product 1',
      price: 20.0,
      quantity: 2,
      imageUrl: 'https://imgs.search.brave.com/s-uyf-jNUNE-cMW_yKKnlc7B4PocxCvTpDIiFZzbOfs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNDU4/Njc4MDQ1L3Bob3Rv/L2xheXMtcG90YXRv/LWNoaXBzLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz12bTJH/eTZPN3dyN1BUSWtk/SW50SWlCWlZVSmlp/c0h3eXhjSzZoWWJy/TlQ4PQ',
    ),
    CartItem(
      itemName: 'Product 2',
      description: 'Description for Product 2',
      price: 30.0,
      quantity: 1,
      imageUrl: 'https://imgs.search.brave.com/s-uyf-jNUNE-cMW_yKKnlc7B4PocxCvTpDIiFZzbOfs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNDU4/Njc4MDQ1L3Bob3Rv/L2xheXMtcG90YXRv/LWNoaXBzLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz12bTJH/eTZPN3dyN1BUSWtk/SW50SWlCWlZVSmlp/c0h3eXhjSzZoWWJy/TlQ4PQ',
    ),
     CartItem(
      itemName: 'Product 3',
      description: 'Description for Product 2',
      price: 30.0,
      quantity: 1,
      imageUrl: 'https://imgs.search.brave.com/s-uyf-jNUNE-cMW_yKKnlc7B4PocxCvTpDIiFZzbOfs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNDU4/Njc4MDQ1L3Bob3Rv/L2xheXMtcG90YXRv/LWNoaXBzLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz12bTJH/eTZPN3dyN1BUSWtk/SW50SWlCWlZVSmlp/c0h3eXhjSzZoWWJy/TlQ4PQ',
    ),
     CartItem(
      itemName: 'Product 4',
      description: 'Description for Product 2',
      price: 30.0,
      quantity: 1,
      imageUrl: 'https://imgs.search.brave.com/s-uyf-jNUNE-cMW_yKKnlc7B4PocxCvTpDIiFZzbOfs/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNDU4/Njc4MDQ1L3Bob3Rv/L2xheXMtcG90YXRv/LWNoaXBzLmpwZz9z/PTYxMng2MTImdz0w/Jms9MjAmYz12bTJH/eTZPN3dyN1BUSWtk/SW50SWlCWlZVSmlp/c0h3eXhjSzZoWWJy/TlQ4PQ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.bgColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        backgroundColor: AppConstants.bgColor,
        title: Text("Shopping Cart", style: AppConstants.headerTextStyle,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    color: Colors.purple.shade100,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.network(
                        item.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.itemName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.description),
                          Text('Price: \$${item.price.toString()}'),
                          Text('Quantity: ${item.quantity.toString()}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Remove the item from the list
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 50),
                child: CustomButton(buttonText: 'Add to Cart', onPressed: (){},),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
