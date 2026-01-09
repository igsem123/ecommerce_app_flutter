import 'package:ecommerce_app_flutter/components/shoe_tile.dart';
import 'package:ecommerce_app_flutter/models/cart.dart';
import 'package:ecommerce_app_flutter/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final _controllerForSearchBar = TextEditingController();

  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe sucessfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Succesfully added!'),
        content: Text('Check your cart!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              autoFocus: false,
              hintText: 'Search the product...',
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16),
              ),
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              elevation: WidgetStatePropertyAll(0),
              controller: _controllerForSearchBar,
              trailing: [
                IconButton(
                  onPressed: () {
                    _controllerForSearchBar.clear();
                    context.read<Cart>().updateSearchQuery('');
                  },
                  icon: Icon(Icons.clear),
                ),
              ],
              onChanged: (value) => {
                context.read<Cart>().updateSearchQuery(value),
              },
            ),
          ),

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'everyone flies.. some fly longer than others',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // list of shoes for sale
          Expanded(
            child: ListView.builder(
              itemCount: value.getFilteredShoeList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a shoe
                Shoe shoe = value.getFilteredShoeList()[index];

                // return the list of shoes
                return ShoeTile(
                  shoe: shoe,
                  addToCart: () => addShoeToCart(shoe),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsetsGeometry.only(
              top: 25.0,
              left: 25.0,
              right: 25.0,
            ),
            child: Divider(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
