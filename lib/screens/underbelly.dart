import 'package:animate_do/animate_do.dart';
import 'package:material_ui/material_ui.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';
import '/models/map.dart';
import 'cartUB.dart';

class UnderBelly extends StatefulWidget {
  const UnderBelly({super.key});

  @override
  State<UnderBelly> createState() => UnderBellyState();
}

class UnderBellyState extends State<UnderBelly> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();

  String searchQueryUB = '';
  final List<MenuItem> _originalItemsUB = itemsUB.toList();

  List<MenuItem> get filteredItems {
    if (searchQueryUB.isEmpty) {
      return itemsUB;
    } else {
      return itemsUB
          .where((item) =>
              item.name.toLowerCase().contains(searchQueryUB.toLowerCase()))
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
                          searchQueryUB = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search UnderBelly menu...',
                        prefixIcon: const Icon(Icons.search_rounded),
                        suffixIcon: searchQueryUB.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear_rounded),
                                onPressed: () {
                                  setState(() {
                                    searchQueryUB = '';
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
                          final bool showCategoryHeader = index == 0 ||
                              item.category !=
                                  filteredItems[index - 1].category;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (showCategoryHeader && item.category != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 4),
                                  child: ActionChip(
                                    avatar: Icon(Icons.category_rounded,
                                        size: 16, color: colorScheme.primary),
                                    label: Text(
                                      item.category!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                                    backgroundColor:
                                        colorScheme.surfaceContainerHigh,
                                    side: BorderSide(
                                      color: colorScheme.outlineVariant
                                          .withValues(alpha: 0.4),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    onPressed: () =>
                                        showHeaderOptionsDialog(context),
                                  ),
                                ),
                              FadeInUp(
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
                                              color: colorScheme
                                                  .surfaceContainerHigh,
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
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  child: Text(
                                                    '${item.quantity}',
                                                    style: TextStyle(
                                                      color:
                                                          colorScheme.primary,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  iconSize: 18,
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  icon: const Icon(
                                                      Icons.add_rounded),
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
                                            icon: const Icon(Icons
                                                .add_shopping_cart_rounded),
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
                              ),
                            ],
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
                        itemsUB.where((item) => item.quantity > 0).toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CartUB(selectedItemsUB: selectedItems),
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

  void showHeaderOptionsDialog(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Set<String> uniqueCategories = Set<String>.from(
      _originalItemsUB.map((item) => item.category ?? ''),
    )..remove('');
    final List<String> categoriesList = uniqueCategories.toList();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Categories', textAlign: TextAlign.center),
          content: SizedBox(
            width: double.maxFinite,
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(categoriesList.length, (index) {
                    final category = categoriesList[index];
                    return FadeInUp(
                      duration: const Duration(milliseconds: 250),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        leading: Icon(Icons.restaurant_menu_rounded,
                            color: colorScheme.primary),
                        title: Text(
                          category,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Navigator.pop(dialogContext);
                          final categoryIndex = filteredItems
                              .indexWhere((item) => item.category == category);
                          if (categoryIndex != -1 &&
                              _scrollController.hasClients) {
                            int precedingHeaders = 0;
                            String? lastSeenCategory;
                            for (int i = 0; i < categoryIndex; i++) {
                              final cat = filteredItems[i].category;
                              if (cat != null && cat != lastSeenCategory) {
                                precedingHeaders++;
                                lastSeenCategory = cat;
                              }
                            }

                            // Calculate exact height of all preceding items + headers + list padding
                            // List padding top: 8.0, Card height: 68.0, separation: 8.0 (total 76.0 per item)
                            // Category header padding: top 8 + bottom 8 + chip height 36 + separation 8 = 60.0
                            final double calculatedOffset = 8.0 +
                                (categoryIndex * 76.0) +
                                (precedingHeaders * 60.0);

                            final clampedOffset = calculatedOffset.clamp(
                              0.0,
                              _scrollController.position.maxScrollExtent,
                            );
                            _scrollController.animateTo(
                              clampedOffset,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutCubic,
                            );
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void sortByAscending() {
    List<MenuItem> sortedItemsUB = List.from(itemsUB);
    sortedItemsUB.sort((a, b) => a.price.compareTo(b.price));
    setState(() {
      itemsUB = sortedItemsUB;
    });
  }

  void sortByDescending() {
    List<MenuItem> sortedItemsUB = List.from(itemsUB);
    sortedItemsUB.sort((a, b) => b.price.compareTo(a.price));
    setState(() {
      itemsUB = sortedItemsUB;
    });
  }

  void sortByCategory() {
    setState(() {
      itemsUB = _originalItemsUB.toList();
    });
  }

  int getSelectedItemsCount() {
    return itemsUB.where((item) => item.quantity > 0).length;
  }

  double getTotalPrice() {
    return itemsUB.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}
