import 'package:animate_do/animate_do.dart';
import 'package:material_ui/material_ui.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';
import 'cart.dart';
import '/models/map.dart';

class Canteen extends StatefulWidget {
  const Canteen({super.key});

  @override
  State<Canteen> createState() => CanteenState();
}

class CanteenState extends State<Canteen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();

  String searchQuery = '';
  final List<MenuItem> _originalItems = items.toList();

  List<MenuItem> get filteredItems {
    if (searchQuery.isEmpty) {
      return items;
    } else {
      return items
          .where((item) =>
              item.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void unfocusSearchField() {
    _searchFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedCount = getSelectedItemsCount();
    final totalPrice = getTotalPrice();

    return GestureDetector(
      onTap: () => unfocusSearchField(),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Canteen menu...',
                        prefixIcon: const Icon(Icons.search_rounded),
                        suffixIcon: searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear_rounded),
                                onPressed: () {
                                  setState(() {
                                    searchQuery = '';
                                  });
                                  _searchController.clear();
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  PopupMenuButton<int>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color:
                            colorScheme.outlineVariant.withValues(alpha: 0.4),
                      ),
                    ),
                    tooltip: 'Sort items',
                    onSelected: (val) {
                      if (val == 1) sortByAscending();
                      if (val == 2) sortByDescending();
                      if (val == 3) sortByCategory();
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(Icons.arrow_upward_rounded, size: 20),
                            SizedBox(width: 10),
                            Text('Price: Low to High'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(Icons.arrow_downward_rounded, size: 20),
                            SizedBox(width: 10),
                            Text('Price: High to Low'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Row(
                          children: [
                            Icon(Icons.category_rounded, size: 20),
                            SizedBox(width: 10),
                            Text('Default Category'),
                          ],
                        ),
                      ),
                    ],
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          color:
                              colorScheme.outlineVariant.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.arrowDownShortWide,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  unfocusSearchField();
                  return true;
                },
                child: GestureDetector(
                  onTap: () => unfocusSearchField(),
                  child: DraggableScrollbar.semicircle(
                    controller: _scrollController,
                    scrollbarTimeToFade: const Duration(milliseconds: 1300),
                    backgroundColor: colorScheme.primary,
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      itemCount:
                          filteredItems.isEmpty ? 1 : filteredItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        if (filteredItems.isEmpty) {
                          return FadeInUp(
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Column(
                                children: [
                                  Icon(Icons.search_off_rounded,
                                      size: 56,
                                      color: colorScheme.onSurfaceVariant),
                                  const SizedBox(height: 12),
                                  Text(
                                    'No food items match your search',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          final item = filteredItems[index];
                          final hasQuantity = item.quantity > 0;
                          return FadeInUp(
                            duration: const Duration(milliseconds: 250),
                            child: Card(
                              elevation: 0,
                              color: hasQuantity
                                  ? colorScheme.primaryContainer
                                      .withValues(alpha: 0.35)
                                  : colorScheme.surfaceContainerLow,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: hasQuantity
                                      ? colorScheme.primary
                                          .withValues(alpha: 0.5)
                                      : colorScheme.outlineVariant
                                          .withValues(alpha: 0.35),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: colorScheme.onSurface,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '₹${item.price.toStringAsFixed(0)}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: colorScheme.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (hasQuantity)
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              colorScheme.surfaceContainerHigh,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              iconSize: 18,
                                              visualDensity:
                                                  VisualDensity.compact,
                                              icon: const Icon(
                                                  Icons.remove_rounded),
                                              tooltip: 'Remove',
                                              onPressed: () {
                                                setState(() {
                                                  item.quantity--;
                                                });
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: Text(
                                                '${item.quantity}',
                                                style: TextStyle(
                                                  color: colorScheme.primary,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              iconSize: 18,
                                              visualDensity:
                                                  VisualDensity.compact,
                                              icon:
                                                  const Icon(Icons.add_rounded),
                                              tooltip: 'Add',
                                              onPressed: () {
                                                setState(() {
                                                  item.quantity++;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    else
                                      IconButton(
                                        icon: const Icon(
                                            Icons.add_shopping_cart_rounded),
                                        tooltip: 'Add to Cart',
                                        onPressed: () {
                                          setState(() {
                                            item.quantity++;
                                          });
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            border: Border(
              top: BorderSide(
                color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$selectedCount ${selectedCount == 1 ? "Item" : "Items"} selected',
                      style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '₹${totalPrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                FilledButton.icon(
                  onPressed: () {
                    List<MenuItem> selectedItems =
                        items.where((item) => item.quantity > 0).toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Cart(selectedItems: selectedItems),
                      ),
                    ).then((_) {
                      setState(() {});
                    });
                  },
                  icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                  label: const Text('View Cart'),
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sortByAscending() {
    List<MenuItem> sortedItems = List.from(items);
    sortedItems.sort((a, b) => a.price.compareTo(b.price));
    setState(() {
      items = sortedItems;
    });
  }

  void sortByDescending() {
    List<MenuItem> sortedItems = List.from(items);
    sortedItems.sort((a, b) => b.price.compareTo(a.price));
    setState(() {
      items = sortedItems;
    });
  }

  void sortByCategory() {
    setState(() {
      items = _originalItems.toList();
    });
  }

  int getSelectedItemsCount() {
    return items.where((item) => item.quantity > 0).length;
  }

  double getTotalPrice() {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}
