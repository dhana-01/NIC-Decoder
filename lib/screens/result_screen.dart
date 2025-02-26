import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final NICController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Decoded NIC Info', style: TextStyle(fontSize: 22))),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blueAccent.withOpacity(0.5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAnimatedText('Birth Date: ${controller.birthDate}'),
                _buildAnimatedText('Age: ${controller.age}'),
                _buildAnimatedText('Gender: ${controller.gender}'),
                _buildAnimatedText('Weekday: ${controller.weekday}'),
                _buildAnimatedText('Can Vote: ${controller.canVote}'),
                SizedBox(height: 20),

                // Animated Back Button
                GestureDetector(
                  onTap: () => Get.back(),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Animated Text Widget
  Widget _buildAnimatedText(String text) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
