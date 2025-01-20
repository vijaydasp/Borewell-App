import 'dart:async';
import 'package:borwell_app/ipaddress_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ReadingsPage extends StatefulWidget {
  const ReadingsPage({super.key});

  @override
  State<ReadingsPage> createState() => _ReadingsPageState();
}

class _ReadingsPageState extends State<ReadingsPage> {
  String? temperature;
  String? humidity;
  String? gas;
  String? distance;
  Timer? _timer;

  bool isLoading = false;

  final String apiUrl = '$baseUrl_sys/readings';

  final Dio dio = Dio();

  Future<void> fetchReadings() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await dio.get(apiUrl);
      print(response.data);

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        setState(() {
          temperature = data['temperature'];
          humidity = data['humidity'];
          gas = data['gas'];
          distance = data['distance'];
        });
      } else {
        throw Exception('Failed to fetch readings: ${response.statusCode}');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchReadings();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      fetchReadings();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Readings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: temperature != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SensorTile(
                        label: 'Temperature',
                        value: '${temperature} °C',
                        icon: Icons.thermostat,
                      ),
                      SensorTile(
                        label: 'Humidity',
                        value: '${humidity} %',
                        icon: Icons.water_drop,
                      ),
                      SensorTile(
                        label: 'Gas',
                        value: '${gas} ppm',
                        icon: Icons.cloud,
                      ),
                      SensorTile(
                        label: 'Distance',
                        value: '${distance} cm',
                        icon: Icons.linear_scale,
                      ),
                    ],
                  )
                : const Text(
                    'No Data Available',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
      ),
    );
  }
}

class SensorTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const SensorTile({
    required this.label,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(icon, size: 40, color: Colors.blueAccent),
          title: Text(
            label,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
