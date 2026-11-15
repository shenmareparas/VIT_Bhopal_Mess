class MenuItem {
  final String name;
  final int price;
  final String? category;
  int quantity;

  MenuItem({
    required this.name,
    required this.price,
    this.category,
    this.quantity = 0,
  });

  MenuItem copyWith({
    String? name,
    int? price,
    String? category,
    int? quantity,
  }) {
    return MenuItem(
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
    );
  }
}
