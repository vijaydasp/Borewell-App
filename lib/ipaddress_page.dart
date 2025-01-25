import 'package:borwell_app/double_stream.dart';
import 'package:borwell_app/stream.dart';
import 'package:borwell_app/stream_esp32.dart';
import 'package:flutter/material.dart';
String baseUrl = "";
String baseUrl_sys = "";
String baseUrl_stream = "";
class IpAddressInputPage extends StatefulWidget {
  @override
  _IpAddressInputPageState createState() => _IpAddressInputPageState();
}

class _IpAddressInputPageState extends State<IpAddressInputPage> {
  final _formKey = GlobalKey<FormState>();
  final _ipController = TextEditingController(text: "192.168.0.120");
  final _ipController_system = TextEditingController(text: "192.168.0.120");
  final _ipController_stream = TextEditingController(text: "192.168.0.120");
  

  @override
  void dispose() {
    _ipController.dispose();
    _ipController_system.dispose();
    _ipController_stream.dispose();
    super.dispose();
  }

  String? _validateIpAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an IP address";
    }
    // Regex for IPv4 validation
    final ipRegex = RegExp(
        r"^((25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)$");
    if (!ipRegex.hasMatch(value)) {
      return "Enter a valid IPv4 address (e.g., 192.168.0.1)";
    }
    return null;
  }

  void _submit() {
    
    if (_formKey.currentState?.validate() == true) {
      baseUrl = "http://${_ipController.text}:81/stream";
      baseUrl_sys = "http://${_ipController_system.text}:8000";
      baseUrl_stream = "http://${_ipController_stream.text}:8000";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Valid IP: ${_ipController.text}"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VRBoxStream(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Enter IP Address"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter IP Address",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _ipController,
                decoration: InputDecoration(
                  labelText: "IP Address of ESP32-Camera",
                  hintText: "e.g., 192.168.0.1",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.language),
                ),
                keyboardType: TextInputType.number,
                validator: _validateIpAddress,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _ipController_stream,
                decoration: InputDecoration(
                  labelText: "IP Address of Camera",
                  hintText: "e.g., 192.168.0.1",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.language),
                ),
                keyboardType: TextInputType.number,
                validator: _validateIpAddress,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _ipController_system,
                decoration: InputDecoration(
                  labelText: "IP Address of System",
                  hintText: "e.g., 192.168.0.1",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.language),
                ),
                keyboardType: TextInputType.number,
                validator: _validateIpAddress,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
