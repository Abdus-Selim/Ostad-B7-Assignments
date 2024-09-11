import 'package:module_12_assignment_app/utils/bag_item.dart';

class TotalPrice {
  double calculateTotalPrice(List<BagItem> myBagItems) {
    double totalPrice = 0;
    int len = myBagItems.length;

    for (int i = 0; i < len; i++) {
      totalPrice += (myBagItems[i].itemQuantity * myBagItems[i].itemPrice);
    }
    return totalPrice;
  }
}
