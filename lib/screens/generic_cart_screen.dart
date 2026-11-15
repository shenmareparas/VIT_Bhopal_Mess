import 'package:animate_do/animate_do.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';

class GenericCartScreen extends StatefulWidget {
  final String title;
  final List<MenuItem> selectedItems;
  final String? phoneNumber;
  final VoidCallback? onCartUpdated;

  const GenericCartScreen({
    super.key,
    required this.title,
    required this.selectedItems,
    this.phoneNumber,
    this.onCartUpdated,
  });

  @override
  State<GenericCartScreen> createState() => _GenericCartScreenState();
}

class _GenericCartScreenState extends State<GenericCartScreen> {
  late List<bool> _fadeOutList;

  @override
  void initState() {
    super.initState();
    _fadeOutList = List.generate(widget.selectedItems.length, (_) => false);
  }

  int get selectedItemsCount =>
      widget.selectedItems.where((item) => item.quantity > 0).length;

  double get totalPrice => widget.selectedItems
      .fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  List<String> get formattedOrderLines => widget.selectedItems
      .where((item) => item.quantity > 0)
      .map((item) => '${item.name} (${item.quantity})\n')
      .toList();

  @override
  Widget build(BuildContext context) {
    final hasPhone =
        widget.phoneNumber != null && widget.phoneNumber!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 25)),
        centerTitle: true,
        actions: hasPhone
            ? [
                IconButton(
                  tooltip: 'Call',
                  onPressed: () async {
                    final Uri call = Uri(
                      scheme: 'tel',
                      path: widget.phoneNumber,
                    );
                    await launchUrl(call);
                  },
                  icon: const Icon(Icons.call),
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            widget.selectedItems.isEmpty
                ? FadeInUp(
                    duration: const Duration(milliseconds: 400),
                    child: const Center(
                      child: Text(
                        'No items are selected',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : Scrollbar(
                    radius: const Radius.circular(10),
                    thickness: 10,
                    interactive: true,
                    trackVisibility: true,
                    child: ListView.builder(
                      itemCount: widget.selectedItems.length,
                      itemBuilder: (context, index) {
                        final item = widget.selectedItems[index];
                        return _fadeOutList[index]
                            ? FadeOutRight(
                                duration: const Duration(milliseconds: 400),
                                child: ListTile(
                                  title: Text(
                                    item.name,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  subtitle: Text(
                                    '₹${(item.price * item.quantity).toStringAsFixed(0)}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? const Color(0xFF4E6700)
                                          : const Color(0xFFD0EE82),
                                    ),
                                  ),
                                ),
                              )
                            : FadeInUp(
                                duration: const Duration(milliseconds: 400),
                                child: ListTile(
                                  title: Text(
                                    item.name,
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  subtitle: Text(
                                    '₹${(item.price * item.quantity).toStringAsFixed(0)}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? const Color(0xFF4E6700)
                                          : const Color(0xFFD0EE82),
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        tooltip: 'Remove',
                                        onPressed: () {
                                          setState(() {
                                            if (item.quantity > 0) {
                                              item.quantity--;
                                              widget.onCartUpdated?.call();
                                              if (item.quantity == 0) {
                                                _fadeOutList[index] = true;
                                                Future.delayed(
                                                  const Duration(
                                                      milliseconds: 400),
                                                  () {
                                                    setState(() {
                                                      widget.selectedItems
                                                          .removeAt(index);
                                                      _fadeOutList
                                                          .removeAt(index);
                                                    });
                                                  },
                                                );
                                              }
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        '${item.quantity}',
                                        style: TextStyle(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? const Color(0xFF4E6700)
                                              : const Color(0xFFD0EE82),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        tooltip: 'Add',
                                        onPressed: () {
                                          setState(() {
                                            item.quantity++;
                                            widget.onCartUpdated?.call();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).brightness == Brightness.light
                  ? const Color(0xFF4E6700)
                  : const Color(0xFFD0EE82),
              width: 3,
            ),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$selectedItemsCount Item  |  ₹${totalPrice.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 17),
            ),
            if (hasPhone && widget.selectedItems.isNotEmpty)
              ElevatedButton(
                onPressed: () async {
                  final messageText = 'Order:\n${formattedOrderLines.join('')}';
                  final whatsapp =
                      'https://wa.me/91${widget.phoneNumber}?text=${Uri.encodeComponent(messageText)}';
                  launchUrlString(
                    whatsapp,
                    mode: LaunchMode.externalNonBrowserApplication,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(color: Color(0xFFD0EE82)),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Send Order  ',
                      style: TextStyle(fontSize: 17),
                    ),
                    FaIcon(FontAwesomeIcons.whatsapp),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
