import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/learningpage/module1/m1_main.dart';
import 'package:climatechange/learningpage/module1/enhanced/enhancedintro.dart';
import 'm1_lesson2_p4.dart';
import 'package:climatechange/component/hoverable_images.dart' as component;

class Module1l2p5 extends StatelessWidget {
  const Module1l2p5({super.key});

  @override
  Widget build(BuildContext context) {
    final pageheader = 'เรื่องที่ 2';
    final pagesubtitle = '2.2) สิ่งที่เราสามารถทำได้เพื่อช่วยลดการเปลี่ยนแปลงสภาพภูมิอากาศ';
    final background = 'asset/overall/background1.png';

    return Scaffold(
      appBar: buildAppBar(
        'เรื่องที่ 2 ความสำคัญของการเปลี่ยนแปลงสภาพภูมิอากาศ',
        context,
      ),
      drawer: buildDrawer(
        context,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Adjust the opacity value as needed
              child: Image.asset(
                background, // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ), 
          SafeArea(
            child: Column(
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 237, 252),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color for the button
                          shape: BoxShape.circle, // Circular shape
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black, // Shadow color
                              blurRadius: 4, // Blur radius for the shadow
                              offset: const Offset(0, 2), // Shadow offset
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.exit_to_app, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                    builder: (context) => const Module1Screen()
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 20), // Add spacing between the icon and the header
                      Expanded( // Ensures the text wraps into a new line
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pageheader,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              pagesubtitle,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            color: const Color.fromARGB(200, 255, 255, 255),
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '⦿    ลดขยะและรีไซเคิล ลดการใช้พลาสติกและแยกขยะเพื่อให้สามารถนำกลับมาใช้ใหม่ได้',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '⦿    ร่วมรณรงค์และให้ความรู้แก่คนรอบข้าง บอกต่อเรื่องความสำคัญของการเปลี่ยนแปลงสภาพภูมิอากาศให้กับเพื่อนและครอบครัว',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 12),
                                  Center(
                                    child: component.HoverableImage(
                                      imagePath: 'asset/module1/Designer4.jpeg',
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const DragAndHoverImageSet(),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
    
  }
}

class DragAndHoverImageSet extends StatefulWidget {
  const DragAndHoverImageSet({super.key});

  @override
  _DragAndHoverImageSetState createState() => _DragAndHoverImageSetState();
}

class _DragAndHoverImageSetState extends State<DragAndHoverImageSet> {
  int _currentState = 0; // Tracks the current state of the image set (0-4)
  Offset _dragPosition = const Offset(150, 300); // Initial position of the draggable
  bool _isHovering = false; // Tracks whether the draggable is hovering over the image set

  void _incrementState() {
    setState(() {
      _currentState = (_currentState + 1) % 5; // Cycles through 0-4
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image set with 5 states
        Center(
          child: DragTarget<String>(
            onWillAccept: (data) {
              if (data == 'drag') {
                setState(() {
                  _isHovering = true; // Set hovering to true when draggable is above
                });
                return true;
              }
              return false;
            },
            onLeave: (data) {
              setState(() {
                _isHovering = false; // Reset hovering when draggable leaves
              });
            },
            onAccept: (data) {
              _incrementState(); // Increment state when draggable is dropped
              setState(() {
                _isHovering = false; // Reset hovering after acceptance
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _isHovering ? Colors.blue : Colors.transparent, // Highlight on hover
                    width: 3,
                  ),
                ),
                child: Image.asset(
                  'asset/module1/state$_currentState.png', // Dynamically load image based on state
                  width: 200,
                  height: 200,
                ),
              );
            },
          ),
        ),
        // Draggable image
        Positioned(
          left: _dragPosition.dx,
          top: _dragPosition.dy,
          child: Draggable<String>(
            data: 'drag', // Data to be passed to DragTarget
            feedback: Material(
              color: Colors.transparent,
              child: Image.asset(
                'asset/module1/draggable.png', // Image for dragging
                width: 100,
                height: 100,
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.5, // Make the original widget semi-transparent while dragging
              child: Image.asset(
                'asset/module1/draggable.png',
                width: 100,
                height: 100,
              ),
            ),
            child: Image.asset(
              'asset/module1/draggable.png', // Static image when not dragging
              width: 100,
              height: 100,
            ),
            onDragUpdate: (details) {
              setState(() {
                _dragPosition += details.delta; // Update position as the draggable moves
              });
            },
            onDragEnd: (details) {
              setState(() {
                // Convert global offset to local offset
                final RenderBox renderBox = context.findRenderObject() as RenderBox;
                _dragPosition = renderBox.globalToLocal(details.offset); // Convert to local coordinates
              });
            },
          ),
        ),
      ],
    );
  }
}