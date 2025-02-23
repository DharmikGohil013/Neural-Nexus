import 'package:flutter/material.dart';

class LabReportPage extends StatefulWidget {
  const LabReportPage({super.key});

  @override
  _LabReportPageState createState() => _LabReportPageState();
}

class _LabReportPageState extends State<LabReportPage> {
  List<LabReportCard> reports = [
    LabReportCard(title: "Blood Test", date: "Feb 10, 2025", status: "Completed"),
    LabReportCard(title: "X-Ray", date: "Jan 28, 2025", status: "Pending"),
    LabReportCard(title: "Urine Test", date: "Dec 20, 2024", status: "Completed"),
    LabReportCard(title: "MRI Scan", date: "Nov 15, 2024", status: "In Progress"),
  ];

  void _addReport(String title, String date) {
    setState(() {
      reports.add(LabReportCard(title: title, date: date, status: "Pending"));
    });
  }

  void _showAddReportDialog() {
    TextEditingController reportNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text("Add Lab Report"),
          content: TextField(
            controller: reportNameController,
            decoration: InputDecoration(
              hintText: "Enter report name",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                if (reportNameController.text.isNotEmpty) {
                  _addReport(reportNameController.text, _getCurrentDate());
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    return "${_getMonthName(now.month)} ${now.day}, ${now.year}";
  }

  String _getMonthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab Reports"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Lab Reports",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              if (reports.isEmpty)
                Center(
                  child: Text(
                    "No lab reports yet",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.grey,
                    ),
                  ),
                )
              else
                Column(children: reports),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              _buildAddReportButton(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              _buildUploadButton(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddReportButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _showAddReportDialog,
      icon: Icon(Icons.add, size: MediaQuery.of(context).size.width * 0.06),
      label: Text(
        "Add My Lab Report",
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.015,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        _addReport("Sample Report", _getCurrentDate());
      },
      icon: Icon(Icons.file_upload, size: MediaQuery.of(context).size.width * 0.06),
      label: Text(
        "Choose from Files (Placeholder)",
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.015,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
      ),
    );
  }
}

class LabReportCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;

  const LabReportCard({super.key, required this.title, required this.date, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          Icons.assignment,
          size: MediaQuery.of(context).size.width * 0.07,
          color: Colors.blue.shade800,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Date: $date",
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
        trailing: Text(
          status,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            color: _getStatusColor(status),
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // TODO: Add navigation to report details
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "In Progress":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}