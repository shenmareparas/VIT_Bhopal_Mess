import 'package:animate_do/animate_do.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';
import 'package:vit_bhopal_mess/widgets/responsive_layout.dart';

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

  void _clearCart() {
    setState(() {
      for (final item in widget.selectedItems) {
        item.quantity = 0;
      }
      widget.selectedItems.clear();
      _fadeOutList.clear();
      widget.onCartUpdated?.call();
    });
  }

  void _confirmResetCart() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Reset Cart?'),
          content: const Text(
            'Are you sure you want to remove all items from your cart?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _clearCart();
              },
              child: const Text('Empty Cart'),
            ),
          ],
        );
      },
    );
  }

  void _sendWhatsAppOrder() {
    final messageText =
        'Order:\n${formattedOrderLines.join('')}Total: ₹${totalPrice.toStringAsFixed(0)}';
    final whatsapp =
        'https://wa.me/91${widget.phoneNumber}?text=${Uri.encodeComponent(messageText)}';
    launchUrlString(
      whatsapp,
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isWide = Breakpoints.isWide(context);
    final hasPhone =
        widget.phoneNumber != null && widget.phoneNumber!.isNotEmpty;
    final hasItems = widget.selectedItems.isNotEmpty;

    final emptyView = FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.remove_shopping_cart_outlined,
              size: 64,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Add items from the menu to see them here',
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );

    final itemsList = Scrollbar(
      radius: const Radius.circular(10),
      thickness: 6,
      interactive: true,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: widget.selectedItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = widget.selectedItems[index];
          final widgetContent = Card(
            elevation: 0,
            color: colorScheme.surfaceContainerLow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: colorScheme.outlineVariant.withValues(alpha: 0.35),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          '₹${(item.price * item.quantity).toStringAsFixed(0)} (${item.quantity} × ₹${item.price.toStringAsFixed(0)})',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          iconSize: 18,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.remove_rounded),
                          tooltip: 'Remove',
                          onPressed: () {
                            setState(() {
                              if (item.quantity > 0) {
                                item.quantity--;
                                widget.onCartUpdated?.call();
                                if (item.quantity == 0) {
                                  _fadeOutList[index] = true;
                                  Future.delayed(
                                    const Duration(milliseconds: 300),
                                    () {
                                      setState(() {
                                        widget.selectedItems.removeAt(index);
                                        _fadeOutList.removeAt(index);
                                      });
                                    },
                                  );
                                }
                              }
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
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
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.add_rounded),
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
                ],
              ),
            ),
          );

          return _fadeOutList[index]
              ? FadeOutRight(
                  duration: const Duration(milliseconds: 300),
                  child: widgetContent,
                )
              : FadeInUp(
                  duration: const Duration(milliseconds: 250),
                  child: widgetContent,
                );
        },
      ),
    );

    final desktopSummaryCard = Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Order Breakdown',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items ($selectedItemsCount)',
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
              Text(
                '₹${totalPrice.toStringAsFixed(0)}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Payable',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                '₹${totalPrice.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (hasPhone && hasItems) ...[
            FilledButton.icon(
              onPressed: _sendWhatsAppOrder,
              icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18),
              label: const Text('Send Order on WhatsApp'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () async {
                final Uri call = Uri(scheme: 'tel', path: widget.phoneNumber);
                await launchUrl(call);
              },
              icon: const Icon(Icons.call_rounded, size: 18),
              label: const Text('Call Caterer'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          if (hasPhone)
            IconButton(
              tooltip: 'Call Caterer',
              onPressed: () async {
                final Uri call = Uri(
                  scheme: 'tel',
                  path: widget.phoneNumber,
                );
                await launchUrl(call);
              },
              icon: const Icon(Icons.call_rounded),
            ),
          if (hasItems)
            IconButton(
              tooltip: 'Empty Cart',
              onPressed: _confirmResetCart,
              icon: const Icon(Icons.delete_sweep_rounded),
            ),
        ],
      ),
      body: ResponsiveContentWrapper(
        maxWidth: 1040,
        child: !hasItems
            ? emptyView
            : (isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: itemsList),
                      const SizedBox(width: 20),
                      desktopSummaryCard,
                    ],
                  )
                : itemsList),
      ),
      bottomNavigationBar: (!isWide && hasItems)
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
                          '$selectedItemsCount ${selectedItemsCount == 1 ? "Item" : "Items"} in cart',
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
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    if (hasPhone)
                      FilledButton.icon(
                        onPressed: _sendWhatsAppOrder,
                        icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18),
                        label: const Text('Send Order'),
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                      ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
