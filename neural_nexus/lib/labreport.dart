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
          title: const Text("Add Lab Report"),
          content: TextField(
            controller: reportNameController,
            decoration: const InputDecoration(hintText: "Enter report name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (reportNameController.text.isNotEmpty) {
                  _addReport(reportNameController.text, "Added Today");
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab Reports"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            "Your Lab Reports",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...reports,
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _showAddReportDialog,
            icon: const Icon(Icons.add),
            label: const Text("Add My Lab Report"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              _addReport("Sample Report", "Added Today");
            },
            icon: const Icon(Icons.file_upload),
            label: const Text("Choose from Files (Placeholder)"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
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
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.assignment),
        title: Text(title),
        subtitle: Text("Date: $date"),
        trailing: Text(status, style: TextStyle(color: _getStatusColor(status), fontWeight: FontWeight.bold)),
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
