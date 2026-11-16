import 'package:animate_do/animate_do.dart';
import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';
import 'package:vit_bhopal_mess/widgets/desktop_cart_panel.dart';
import 'package:vit_bhopal_mess/widgets/menu_item_card.dart';
import 'package:vit_bhopal_mess/widgets/responsive_layout.dart';
import '/models/map.dart';
import 'cartM.dart';

class Mayuri extends StatefulWidget {
  const Mayuri({super.key});

  @override
  State<Mayuri> createState() => MayuriState();
}

class MayuriState extends State<Mayuri> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();

  String searchQueryM = '';
  String selectedCategory = 'All';
  final List<MenuItem> _originalItemsM = itemsM.toList();

  List<String> get categoriesList {
    final cats = itemsM
        .map((item) => item.category)
        .where((cat) => cat != null && cat.isNotEmpty)
        .cast<String>()
        .toSet()
        .toList();
    cats.sort();
    return ['All', ...cats];
  }

  List<MenuItem> get filteredItems {
    return itemsM.where((item) {
      final matchesSearch = searchQueryM.isEmpty ||
          item.name.toLowerCase().contains(searchQueryM.toLowerCase());
      final matchesCategory =
          selectedCategory == 'All' || item.category == selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  List<MenuItem> get selectedItems =>
      itemsM.where((item) => item.quantity > 0).toList();

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

  void _clearCart() {
    setState(() {
      for (final item in itemsM) {
        item.quantity = 0;
      }
    });
  }

  void _openFullCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartM(selectedItemsM: selectedItems),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDesktop = Breakpoints.isDesktop(context);
    final isWide = Breakpoints.isWide(context);
    final selectedCount = getSelectedItemsCount();
    final totalPrice = getTotalPrice();

    final searchAndFilterBar = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                onChanged: (value) {
                  setState(() {
                    searchQueryM = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search Mayuri's menu...",
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: searchQueryM.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear_rounded),
                          onPressed: () {
                            setState(() {
                              searchQueryM = '';
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
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
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
                      Text('Default Order'),
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
                    color: colorScheme.outlineVariant.withValues(alpha: 0.4),
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
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categoriesList.map((category) {
              final isSelected = category == selectedCategory;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  showCheckmark: false,
                  backgroundColor: isSelected
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHigh,
                  selectedColor: colorScheme.primary,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurface,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 14,
                  ),
                  side: BorderSide(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.outlineVariant.withValues(alpha: 0.35),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );

    final emptyView = FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Icon(Icons.search_off_rounded,
                size: 56, color: colorScheme.onSurfaceVariant),
            const SizedBox(height: 12),
            Text(
              'No food items match your search or filter',
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

    Widget itemsView;
    if (filteredItems.isEmpty) {
      itemsView = emptyView;
    } else if (isWide) {
      itemsView = GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: isDesktop ? 320 : 360,
          mainAxisExtent: 145,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return MenuItemCard(
            item: item,
            onQuantityChanged: () => setState(() {}),
          );
        },
      );
    } else {
      itemsView = ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: filteredItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return MenuItemCard(
            item: item,
            onQuantityChanged: () => setState(() {}),
          );
        },
      );
    }

    final catalogContent = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: searchAndFilterBar,
        ),
        Expanded(
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: isDesktop,
            child: itemsView,
          ),
        ),
      ],
    );

    return GestureDetector(
      onTap: () => unfocusSearchField(),
      child: Scaffold(
        body: ResponsiveContentWrapper(
          maxWidth: 1240,
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: catalogContent),
                    const SizedBox(width: 20),
                    DesktopCartPanel(
                      title: "Mayuri's Order",
                      selectedItems: selectedItems,
                      totalPrice: totalPrice,
                      selectedCount: selectedCount,
                      onClearCart: _clearCart,
                      onCartUpdated: () => setState(() {}),
                      onOpenFullCart: _openFullCart,
                    ),
                  ],
                )
              : catalogContent,
        ),
        bottomNavigationBar: (!isDesktop && selectedCount > 0)
            ? Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  border: Border(
                    top: BorderSide(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                        onPressed: _openFullCart,
                        icon:
                            const Icon(Icons.shopping_cart_outlined, size: 18),
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
              )
            : null,
      ),
    );
  }

  void sortByAscending() {
    List<MenuItem> sortedItemsM = List.from(itemsM);
    sortedItemsM.sort((a, b) => a.price.compareTo(b.price));
    setState(() {
      itemsM = sortedItemsM;
    });
  }

  void sortByDescending() {
    List<MenuItem> sortedItemsM = List.from(itemsM);
    sortedItemsM.sort((a, b) => b.price.compareTo(a.price));
    setState(() {
      itemsM = sortedItemsM;
    });
  }

  void sortByCategory() {
    setState(() {
      itemsM = _originalItemsM.toList();
      selectedCategory = 'All';
    });
  }

  int getSelectedItemsCount() {
    return itemsM.where((item) => item.quantity > 0).length;
  }

  double getTotalPrice() {
    return itemsM.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}
