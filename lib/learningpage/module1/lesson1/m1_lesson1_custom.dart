import 'package:flutter/material.dart';

class WeatherVsClimateSort extends StatefulWidget {
  @override
  _WeatherVsClimateSortState createState() => _WeatherVsClimateSortState();
}

class _WeatherVsClimateSortState extends State<WeatherVsClimateSort> {
  final List<String> items = [
    'เมื่อวานฝนตก',
    'อุณหภูมิเฉลี่ยของโลกปีนี้สูงขึ้น',
    'พรุ่งนี้มีพายุฝนตก',
    'ฤดูร้อนที่แล้วร้อนมาก',
    'สัปดาห์ที่แล้ว แดดออกทุกวัน',
    'ฤดูฝนตกที่แล้วฝนตกน้อย',
  ];

  final List<String> weather = [];
  final List<String> climate = [];

  void moveItem(String item, String category) {
    setState(() {
      if (category == 'weather') {
        weather.add(item);
      } else {
        climate.add(item);
      }
      items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: Text('Weather vs. Climate Sort'),
        bottom: TabBar(
        tabs: [
          Tab(text: 'Weather 🌦️'),
          Tab(text: 'Climate 🌍'),
        ],
        ),
      ),
      body: TabBarView(
        children: [
        // Weather Tab
        Column(
          children: [
          Expanded(
            child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
              title: Text(items[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                ElevatedButton(
                  onPressed: () => moveItem(items[index], 'weather'),
                  child: Text('Weather'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => moveItem(items[index], 'climate'),
                  child: Text('Climate'),
                ),
                ],
              ),
              );
            },
            ),
          ),
          Divider(),
          Text('Weather:', style: TextStyle(fontWeight: FontWeight.bold)),
          ...weather.map((item) => Text(item)).toList(),
          ],
        ),
        // Climate Tab
        Column(
          children: [
          Expanded(
            child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.terrain, size: 100, color: Colors.brown),
              SizedBox(height: 16),
              Text(
                'Climate (Long-Term)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Average over 30+ years (e.g., deserts are always dry).',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Example: "The Sahara has a hot desert climate."',
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              ],
            ),
            ),
          ),
          Divider(),
          Text('Climate:', style: TextStyle(fontWeight: FontWeight.bold)),
          ...climate.map((item) => Text(item)).toList(),
          ],
        ),
        ],
      ),
      ),
    );
  }
}