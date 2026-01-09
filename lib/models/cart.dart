import 'package:ecommerce_app_flutter/models/shoe.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air MAX',
      price: 236.00,
      imagePath: 'lib/images/1.avif',
      description:
          'The forward-thinking design of his latest signature shoe.',
    ),
    Shoe(
      name: 'Air Jordans',
      price: 220.00,
      imagePath: 'lib/images/2.avif',
      description:
          'You\'ve got the hops and the speed-lace up in shoes that enhance your style.',
    ),
    Shoe(
      name: 'KD Treys',
      price: 240.00,
      imagePath: 'lib/images/3.avif',
      description:
          'A secure midfoot strap is suited for scoring binges and defensive walking.',
    ),
    Shoe(
      name: 'Kyrie 6',
      price: 199.00,
      imagePath: 'lib/images/4.avif',
      description:
          'Bouncy cushioning is paired with soft yet supportive foam.',
    ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list os shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from user cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  String _searchQuery = '';

  void updateSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  List<Shoe> getFilteredShoeList() {
    if (_searchQuery.isEmpty) {
      return shoeShop;
    }

    return shoeShop
        .where(
          (element) =>
              element.name.toLowerCase().contains(_searchQuery),
        )
        .toList();
  }
}
