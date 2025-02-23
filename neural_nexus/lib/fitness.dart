import 'package:flutter/material.dart';

class FitnessPage extends StatefulWidget {
  final String feature; // Parameter to identify which fitness feature was selected

  const FitnessPage({super.key, required this.feature});

  @override
  _FitnessPageState createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  double _value = 0.0; // Example value for tracking (e.g., steps, heart rate)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.feature} Tracking'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                widget.feature,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              // Tracking Value Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: Colors.white.withOpacity(0.9),
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  child: Column(
                    children: [
                      Text(
                        'Current Value',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      Text(
                        _value.toStringAsFixed(widget.feature == 'Heart Rate' ? 0 : 2),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      if (widget.feature == 'Heart Rate')
                        Text(
                          'bpm',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      if (widget.feature == 'Step Counter')
                        Text(
                          'steps',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                      Slider(
                        value: _value,
                        min: 0,
                        max: widget.feature == 'Heart Rate' ? 200 : 10000, // Adjust max based on feature
                        divisions: widget.feature == 'Heart Rate' ? 200 : 1000,
                        label: _value.round().toString(),
                        onChanged: (newValue) {
                          setState(() {
                            _value = newValue;
                          });
                        },
                        activeColor: Colors.blue.shade800,
                        inactiveColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              // History or Additional Info
              Text(
                'Tracking History',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              ListTile(
                leading: Icon(Icons.history, color: Colors.blue.shade800),
                title: Text(
                  'No recent activity',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.grey.shade600,
                  ),
                ),
                subtitle: Text(
                  'Track more to see history',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}