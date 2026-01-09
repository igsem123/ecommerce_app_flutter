import 'package:ecommerce_app_flutter/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:intl/intl.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final _formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );
  final void Function()? addToCart;

  ShoeTile({super.key, required this.shoe, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.0),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // image of the product
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: AvifImage.asset(
              shoe.imagePath,
              fit: BoxFit.fitWidth,
            ),
          ),

          // description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              shoe.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // price + details
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 3,
                  children: [
                    // shoe name
                    Text(
                      shoe.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // price
                    Text(
                      _formatter.format(shoe.price),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                // add to cart button
                IconButton(
                  onPressed: addToCart,
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  highlightColor: Colors.white,
                  padding: EdgeInsets.all(19),
                  constraints: BoxConstraints(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.black,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
