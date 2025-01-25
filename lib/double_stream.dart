import 'package:flutter/material.dart';
import 'package:borwell_app/double_stream_page.dart';

class VRBoxStream extends StatelessWidget {
  const VRBoxStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRotatedView(),
              const SizedBox(height: 20),
              _buildRotatedView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRotatedView() {
    return RotatedBox(
      quarterTurns: 1,  // 90 degree rotation
      child: Container(
        height: 304,
        width: 350,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Mapview(),
      ),
    );
  }
}