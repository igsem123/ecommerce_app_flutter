import 'package:ecommerce_app_flutter/models/cart.dart';
import 'package:ecommerce_app_flutter/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  final _formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(
      context,
      listen: false,
    ).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 25.0),
      child: ListTile(
        leading: AvifImage.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget._formatter.format(widget.shoe.price)),
        trailing: IconButton(
          onPressed: removeItemFromCart,
          icon: Icon(Icons.delete_rounded),
        ),
      ),
    );
  }
}
