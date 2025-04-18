import 'dart:async';
import 'package:flutter/material.dart';
import 'package:climatechange/component/appbar.dart';
import 'package:climatechange/component/drawer.dart';
import 'package:climatechange/component/footer_navigator.dart';
import 'package:climatechange/component/page_config.dart';
import 'package:weather_animation/weather_animation.dart';
import 'm3_lesson2_p4.dart';

class DragAndDropGame extends StatefulWidget {
  const DragAndDropGame({Key? key}) : super(key: key);

  @override
  _DragAndDropGameState createState() => _DragAndDropGameState();
}

class _DragAndDropGameState extends State<DragAndDropGame> with SingleTickerProviderStateMixin {
  final Map<String, bool> score = {};
  int currentStage = 1;
  String currentClothing = ''; // Tracks the current clothing of the person
  Color outlineColor = Colors.transparent; // Add a variable to track the outline color
  bool isNextEnabled = false; // Add a flag to enable/disable the Next button
  String explanation = ''; // Add a variable to store the explanation
  bool showTooltipOverlay = false; // Add a flag to control the tooltip overlay
  bool showArrowOverlay = false; // Show arrow and helper text when tooltip is pressed
  double personPosition = 0; // Track the vertical position of the person
  String instruction = 'ลากไอเท็มที่ถูกต้องไปยังตัวละคร!'; // Dynamic instructions (TH)
  Timer? _tooltipTimer; // Timer for hiding tooltip instruction
  late AnimationController _personAnimController;
  late Animation<double> _personOffsetAnim;

  final List<Map<String, String>> stageData = [
    {
      'เสื้อยืด': '👕',
      'เสื้อแจ็คเก็ต': '🧥',
    }, // Stage 1: Hot weather
    {
      'ผ้าพันคอ': '🧣',
      'กางเกงขาสั้น': '🩳',
    }, // Stage 2: Cold weather
    {
      'ร่ม': '☂️',
      'หมวก': '🧢',
    }, // Stage 3: Rainy weather
  ];

  final List<String> stageTargets = [
    'อากาศร้อน', // Stage 1
    'อากาศหนาว', // Stage 2
    'อากาศฝนตก', // Stage 3
  ];

  final List<String> stageExplanations = [
    'เสื้อยืดเหมาะกับอากาศร้อนเพราะบางและระบายอากาศได้ดี ส่วนเสื้อแจ็คเก็ตจะทำให้ร้อนเกินไป',
    'ผ้าพันคอช่วยให้อบอุ่นในอากาศหนาว ส่วนกางเกงขาสั้นไม่เหมาะเพราะจะทำให้ขาเย็น',
    'ร่มช่วยกันฝนในวันที่ฝนตก ส่วนหมวกช่วยป้องกันแดด แต่กันฝนไม่ได้',
  ];

  @override
  void initState() {
    super.initState();
    _personAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _personOffsetAnim = Tween<double>(begin: 0, end: -40).animate(
      CurvedAnimation(parent: _personAnimController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _tooltipTimer?.cancel();
    _personAnimController.dispose();
    super.dispose();
  }

  void toggleTooltip() {
    setState(() {
      showTooltipOverlay = true;
      showArrowOverlay = true;
      instruction = 'ลากไอเท็มไปยังตัวละคร!';
    });
    _personAnimController.forward().then((_) {
      _personAnimController.reverse();
    });
    _tooltipTimer?.cancel();
    _tooltipTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        showTooltipOverlay = false;
        showArrowOverlay = false;
        if (currentStage != 1) {
          instruction = '';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive scaling for iPhone SE, Galaxy S8+, etc.
        final double baseWidth = 375.0;
        double scale = constraints.maxWidth / baseWidth;
        // For iPhone SE and smaller, reduce scale further for better fit
        if (constraints.maxWidth <= 340) {
          scale = 0.70;
        } else {
          scale = scale.clamp(0.80, 1.15);
        }
        double responsive(double value) => value * scale;

        final pagetitle = 'เกมลากและวาง';
        final pageheader = 'ด่านที่ $currentStage';
        final pagesubtitle = 'จับคู่ไอเท็มกับสภาพอากาศที่ถูกต้อง';
        final int totalPages = PageConfig.lessonPageCounts['m3lesson2'] ?? 1;

        final data = stageData[currentStage - 1];
        final target = stageTargets[currentStage - 1];

        // Define backgrounds for each stage
        final List<WeatherScene> stageBackgrounds = [
          WeatherScene.scorchingSun, // Stage 1: Hot weather
          WeatherScene.snowfall,     // Stage 2: Cold weather
          WeatherScene.stormy,         // Stage 3: Rainy weather
        ];

        return Scaffold(
          appBar: buildAppBar(
            pagetitle,
            context,
          ),
          drawer: buildDrawer(
            context,
          ),
          body: Stack(
            children: [
              SizedBox.expand(
                child: WrapperScene.weather(scene: stageBackgrounds[currentStage - 1]), // Dynamic background
              ),
              SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(responsive(14)),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 214, 237, 252),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.exit_to_app, color: Colors.black),
                            iconSize: responsive(22),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: responsive(12)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pageheader,
                                  style: TextStyle(
                                    fontSize: responsive(18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  pagesubtitle,
                                  style: TextStyle(fontSize: responsive(13)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          if (showArrowOverlay)
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  SizedBox(height: responsive(6)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_downward, color: Colors.blue, size: responsive(26)),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: responsive(2), bottom: responsive(4)),
                                    padding: EdgeInsets.symmetric(
                                      vertical: responsive(4),
                                      horizontal: responsive(8),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(responsive(7)),
                                      border: Border.all(color: Colors.blue, width: 1),
                                    ),
                                    child: Text(
                                      'ลากหนึ่งในไอเท็มเหล่านี้ไปยังตัวละครด้านล่าง!',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: responsive(11.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: data.keys.map((item) {
                                  return Draggable<String>(
                                    data: item,
                                    feedback: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.blue, width: responsive(1.5)),
                                          borderRadius: BorderRadius.circular(responsive(7)),
                                        ),
                                        padding: EdgeInsets.all(responsive(6)),
                                        child: Text(
                                          data[item]!,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: responsive(18),
                                          ),
                                        ),
                                      ),
                                    ),
                                    childWhenDragging: const Text(''),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue, width: responsive(1.5)),
                                        borderRadius: BorderRadius.circular(responsive(7)),
                                      ),
                                      padding: EdgeInsets.all(responsive(6)),
                                      child: Text(
                                        data[item]!,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: responsive(18),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              DragTarget<String>(
                                builder: (BuildContext context, List<String?> incoming, List rejected) {
                                  return Column(
                                    children: [
                                      AnimatedBuilder(
                                        animation: _personAnimController,
                                        builder: (context, child) {
                                          return Transform.translate(
                                            offset: Offset(0, _personOffsetAnim.value + personPosition),
                                            child: child,
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: outlineColor, width: responsive(3)),
                                            borderRadius: BorderRadius.circular(responsive(7)),
                                          ),
                                          padding: EdgeInsets.all(responsive(7)),
                                          child: Column(
                                            children: [
                                              Text(
                                                '👤',
                                                style: TextStyle(fontSize: responsive(54)),
                                              ),
                                              Text(
                                                currentClothing.isNotEmpty ? currentClothing : 'ไม่มีไอเท็ม',
                                                style: TextStyle(fontSize: responsive(14)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (currentStage == 1 || showTooltipOverlay)
                                        Padding(
                                          padding: EdgeInsets.only(top: responsive(6)),
                                          child: Text(
                                            instruction,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: responsive(11.5), color: Colors.black54),
                                          ),
                                        ),
                                      if (explanation.isNotEmpty)
                                        Padding(
                                          padding: EdgeInsets.only(top: responsive(6)),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: responsive(7),
                                              horizontal: responsive(8),
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
                                              borderRadius: BorderRadius.circular(responsive(8)),
                                              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: responsive(1)),
                                            ),
                                            child: Text(
                                              explanation,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: responsive(13),
                                                color: const Color.fromARGB(255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                                onWillAccept: (data) => data != null,
                                onAccept: (data) {
                                  setState(() {
                                    currentClothing = data;
                                    if (data == stageData[currentStage - 1].keys.first) {
                                      // Correct: allow to proceed
                                      outlineColor = Colors.green;
                                      score[data] = true;
                                      isNextEnabled = true;
                                      explanation = stageExplanations[currentStage - 1];
                                      instruction = 'เยี่ยมมาก! กดถัดไปเพื่อไปยังด่านถัดไป';
                                    } else {
                                      // Incorrect: cannot proceed
                                      outlineColor = Colors.red;
                                      explanation = '';
                                      isNextEnabled = false;
                                      instruction = 'ลองใหม่อีกครั้ง! ลากไอเท็มที่ถูกต้อง';
                                    }
                                  });
                                },
                                onLeave: (data) {
                                  setState(() {
                                    outlineColor = Colors.transparent;
                                    personPosition = 0;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FooterNavigation(
                      onBackPressed: () {
                        Navigator.pop(context);
                      },
                      onForwardPressed: () {
                        if (isNextEnabled) {
                          if (currentStage < 3) {
                            setState(() {
                              currentStage++; // Increment the stage
                              score.clear();
                              currentClothing = ''; // Reset clothing for the next stage
                              outlineColor = Colors.transparent; // Reset outline
                              isNextEnabled = false; // Disable the Next button
                              explanation = ''; // Reset explanation
                              personPosition = 0; // Reset person position
                              instruction = 'ลากไอเท็มที่ถูกต้องไปยังตัวละคร!'; // Reset instruction
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('ยินดีด้วย!'),
                                content: const Text('คุณผ่านทุกด่านแล้ว!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Module3l2p4(),
                                        ),
                                      );
                                    },
                                    child: const Text('ไปต่อ'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('คำตอบไม่ถูกต้อง'),
                              content: const Text('คุณต้องลากไอเท็มที่ถูกต้องเพื่อไปยังด่านถัดไป'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('ตกลง'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      currentPage: currentStage,
                      totalPages: 3,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: responsive(60),
                right: responsive(10),
                child: Tooltip(
                  message: 'คลิกเพื่อดูคำแนะนำ',
                  child: IconButton(
                    icon: const Icon(Icons.help_outline, color: Colors.blue),
                    iconSize: responsive(20),
                    onPressed: toggleTooltip,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}