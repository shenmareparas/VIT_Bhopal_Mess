import 'package:material_ui/material_ui.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';

class CanteenViewModel with ChangeNotifier {
  final List<MenuItem> _allCatalogItems;
  late final List<MenuItem> _initialTemplateItems;
  List<MenuItem> _workingItems = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';

  CanteenViewModel({required List<MenuItem> catalogItems})
      : _allCatalogItems = catalogItems {
    _initialTemplateItems = _allCatalogItems
        .map((item) => MenuItem(
              name: item.name,
              price: item.price,
              category: item.category,
              quantity: item.quantity,
            ))
        .toList();
    _workingItems = List.from(_allCatalogItems);
  }

  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  List<MenuItem> get allItems => _workingItems;

  List<MenuItem> get selectedItems =>
      _workingItems.where((item) => item.quantity > 0).toList();

  int get selectedItemsCount =>
      _workingItems.where((item) => item.quantity > 0).length;

  double get totalPrice => _workingItems.fold(
      0.0, (sum, item) => sum + (item.price * item.quantity));

  List<MenuItem> get filteredItems {
    return _workingItems.where((item) {
      final matchesSearch = _searchQuery.isEmpty ||
          item.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory =
          _selectedCategory == 'All' || item.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  void setSearchQuery(String query) {
    if (_searchQuery != query) {
      _searchQuery = query;
      notifyListeners();
    }
  }

  void setCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }

  void incrementQuantity(MenuItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(MenuItem item) {
    if (item.quantity > 0) {
      item.quantity--;
      notifyListeners();
    }
  }

  void removeItem(MenuItem item) {
    item.quantity = 0;
    notifyListeners();
  }

  void sortByPriceAscending() {
    _workingItems.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  void sortByPriceDescending() {
    _workingItems.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  void resetSort() {
    final Map<String, int> quantityMap = {
      for (var item in _workingItems) item.name: item.quantity
    };
    _workingItems = _initialTemplateItems.map((item) {
      return MenuItem(
        name: item.name,
        price: item.price,
        category: item.category,
        quantity: quantityMap[item.name] ?? 0,
      );
    }).toList();
    notifyListeners();
  }

  void clearAllQuantities() {
    for (var item in _workingItems) {
      item.quantity = 0;
    }
    notifyListeners();
  }
}
