class BagItem {
  final String itemImage;
  final String itemTitle;
  final String itemColor;
  final String itemSize;
  final double itemPrice;
  int itemQuantity;

  BagItem({
    required this.itemImage,
    required this.itemTitle,
    required this.itemColor,
    required this.itemPrice,
    required this.itemSize,
    this.itemQuantity = 1,
  });
}
