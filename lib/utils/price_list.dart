class PriceList {
  int totalPrice = 0;
  int pulloverQuantity = 1;
  final int pulloverPrice = 51;

  int blackTshirtQuantity = 1;
  final int blackTshirtPrice = 30;

  int sportDressQuantity = 1;
  final int sportDressPrice = 43;

  PriceList() {
    totalPrice = (pulloverQuantity * pulloverPrice) +
        (blackTshirtQuantity * blackTshirtPrice) +
        (sportDressQuantity + sportDressPrice);
  }
}
