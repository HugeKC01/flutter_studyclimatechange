import 'package:flutter/material.dart';

class ArticleHeader extends StatelessWidget {
  final String header;
  final String subtitle;
  final double fontSize;
  final VoidCallback onExit;

  const ArticleHeader({
    super.key,
    required this.header,
    required this.subtitle,
    required this.fontSize,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: onExit,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterNavigation extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onForwardPressed;
  final int currentPage;
  final int totalPages;

  const FooterNavigation({
    super.key,
    required this.onBackPressed,
    required this.onForwardPressed,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary.withAlpha((0.6 * 255).toInt()),
        borderRadius: BorderRadius.circular(50), // Pill shape
      ),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                width: 40,
                height: 40,
                child: ElevatedButton(
                  onPressed: onBackPressed,
                    style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          // Page number
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface, // Use color scheme surface color
              borderRadius: BorderRadius.circular(50), // Pill shape
            ),
            child: Text(
              'Page $currentPage of $totalPages',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Forward button
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                width: 40,
                height: 40,
                child: ElevatedButton(
                  onPressed: onForwardPressed,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}