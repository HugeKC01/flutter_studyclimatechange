import 'package:flutter/material.dart';

class FooterNavigation extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onForwardPressed;
  final String pageNumber;

  const FooterNavigation({
    super.key,
    required this.onBackPressed,
    required this.onForwardPressed,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 0, 122, 255),
              ),
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                width: 40,
                height: 40,
                child: FloatingActionButton(
                  heroTag: 'btnBack',
                  onPressed: onBackPressed,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: const CircleBorder(),
                  child: const Icon(Icons.arrow_back,
                      size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
          // Page number
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white, // White background
              borderRadius: BorderRadius.circular(50), // Pill shape
            ),
            child: Text(
              pageNumber,
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 0, 122, 255),
              ),
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                width: 40,
                height: 40,
                child: FloatingActionButton(
                  heroTag: 'btnForward',
                  onPressed: onForwardPressed,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: const CircleBorder(),
                  child: const Icon(Icons.arrow_forward,
                      size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}