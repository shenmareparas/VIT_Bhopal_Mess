import 'package:material_ui/material_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vit_bhopal_mess/models/menu_item.dart';

class DesktopCartPanel extends StatelessWidget {
  final List<MenuItem> selectedItems;
  final double totalPrice;
  final int selectedCount;
  final String? phoneNumber;
  final VoidCallback onClearCart;
  final VoidCallback onCartUpdated;
  final VoidCallback? onOpenFullCart;
  final String title;

  const DesktopCartPanel({
    super.key,
    required this.selectedItems,
    required this.totalPrice,
    required this.selectedCount,
    this.phoneNumber,
    required this.onClearCart,
    required this.onCartUpdated,
    this.onOpenFullCart,
    this.title = 'Order Summary',
  });

  List<String> get formattedOrderLines => selectedItems
      .where((item) => item.quantity > 0)
      .map((item) => '${item.name} (${item.quantity})\n')
      .toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasPhone = phoneNumber != null && phoneNumber!.isNotEmpty;
    final hasItems = selectedItems.isNotEmpty;

    return Container(
      width: 340,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 20,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                if (hasItems)
                  IconButton(
                    tooltip: 'Clear Cart',
                    iconSize: 20,
                    icon: Icon(
                      Icons.delete_sweep_rounded,
                      color: colorScheme.error,
                    ),
                    onPressed: onClearCart,
                  ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
          // Cart Items List
          Expanded(
            child: !hasItems
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add_shopping_cart_rounded,
                            size: 48,
                            color: colorScheme.onSurfaceVariant
                                .withValues(alpha: 0.5),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Your cart is empty',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Click + on any dish to add to your order',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    itemCount: selectedItems.length,
                    separatorBuilder: (_, __) => Divider(
                      height: 12,
                      color: colorScheme.outlineVariant.withValues(alpha: 0.2),
                    ),
                    itemBuilder: (context, index) {
                      final item = selectedItems[index];
                      return Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onSurface,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '₹${(item.price * item.quantity).toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  iconSize: 16,
                                  visualDensity: VisualDensity.compact,
                                  icon: const Icon(Icons.remove_rounded),
                                  onPressed: () {
                                    if (item.quantity > 0) {
                                      item.quantity--;
                                      if (item.quantity == 0) {
                                        selectedItems.removeAt(index);
                                      }
                                      onCartUpdated();
                                    }
                                  },
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                IconButton(
                                  iconSize: 16,
                                  visualDensity: VisualDensity.compact,
                                  icon: const Icon(Icons.add_rounded),
                                  onPressed: () {
                                    item.quantity++;
                                    onCartUpdated();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
          // Bottom Summary & Actions
          if (hasItems) ...[
            Divider(
              height: 1,
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total ($selectedCount items)',
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
                  const SizedBox(height: 14),
                  if (hasPhone) ...[
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        final messageText =
                            'Order:\n${formattedOrderLines.join('')}Total: ₹${totalPrice.toStringAsFixed(0)}';
                        final whatsapp =
                            'https://wa.me/91$phoneNumber?text=${Uri.encodeComponent(messageText)}';
                        launchUrlString(
                          whatsapp,
                          mode: LaunchMode.externalNonBrowserApplication,
                        );
                      },
                      icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 16),
                      label: const Text('Send Order on WhatsApp'),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        final Uri call = Uri(scheme: 'tel', path: phoneNumber);
                        await launchUrl(call);
                      },
                      icon: const Icon(Icons.call_rounded, size: 16),
                      label: const Text('Call Caterer'),
                    ),
                  ] else if (onOpenFullCart != null) ...[
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: onOpenFullCart,
                      icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                      label: const Text('Proceed to Checkout'),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
