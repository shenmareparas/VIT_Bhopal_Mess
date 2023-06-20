import 'package:flutter/material.dart';
import '/models/map.dart';

class MenuUB {
  final String name;
  int price;
  String category;

  MenuUB({required this.name, required this.price, required this.category});
}

class UnderBelly extends StatefulWidget {
  const UnderBelly({super.key});

  @override
  State<UnderBelly> createState() => UnderBellyState();
}

class UnderBellyState extends State<UnderBelly> {
  final TextEditingController _searchController = TextEditingController();

  String searchQueryUB = '';
  final List<MenuUB> _originalItemsUB = itemsUB.toList();
  final ScrollController _scrollController = ScrollController();

  List<MenuUB> get filteredItems {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          searchQueryUB = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        labelText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: searchQueryUB.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    searchQueryUB = '';
                                  });
                                  _searchController.clear();
                                },
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        onTap: sortByAscending,
                        child: const Text('Sort by Price: Low to High'),
                      ),
                      PopupMenuItem(
                        onTap: sortByDescending,
                        child: const Text('Sort by Price: High to Low'),
                      ),
                      PopupMenuItem(
                        onTap: sortByCategory,
                        child: const Text('Sort by Category'),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tooltip: 'Sort',
                    child: const FloatingActionButton(
                      elevation: 5,
                      onPressed: null,
                      child: Icon(Icons.filter_list),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Scrollbar(
                radius: const Radius.circular(10),
                thickness: 12,
                interactive: true,
                trackVisibility: true,
                child: ListView.separated(
                  controller: _scrollController,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(thickness: 1, height: 1),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    // Check if the current item's category is different from the previous item's category
                    final bool showCategoryHeader = index == 0 ||
                        item.category != filteredItems[index - 1].category;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showCategoryHeader)
                          Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16),
                            child: GestureDetector(
                              onTap: () => showHeaderOptionsDialog(context),
                              child: Text(
                                item.category,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? const Color(0xFF4E6700)
                                      : const Color(0xFFD0EE82),
                                ),
                              ),
                            ),
                          ),
                        ListTile(
                          title: Text(
                            item.name,
                            style: const TextStyle(fontSize: 17),
                          ),
                          trailing: Text(
                            '₹${item.price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? const Color(0xFF4E6700)
                                  : const Color(0xFFD0EE82),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showHeaderOptionsDialog(BuildContext context) {
    final Set<String> uniqueCategories =
        Set<String>.from(_originalItemsUB.map((item) => item.category));
    final List<String> categoriesList = uniqueCategories.toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Categories', textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: Column(
              children: List.generate(categoriesList.length, (index) {
                final category = categoriesList[index];
                return ListTile(
                  title: Text(category),
                  onTap: () {
                    Navigator.pop(context);
                    // Scroll to the selected category
                    final categoryIndex = filteredItems
                        .indexWhere((item) => item.category == category);
                    if (categoryIndex != -1) {
                      final headerIndex = _originalItemsUB
                          .indexWhere((item) => item.category == category);
                      if (headerIndex != -1) {
                        _scrollController.animateTo(
                          headerIndex * 60,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    }
                  },
                );
              }),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void sortByAscending() {
    List<MenuUB> sortedItemsUB = List.from(itemsUB);
    sortedItemsUB.sort((a, b) => a.price.compareTo(b.price));
    setState(() {
      itemsUB = sortedItemsUB;
    });
  }

  void sortByDescending() {
    List<MenuUB> sortedItemsUB = List.from(itemsUB);
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
}
