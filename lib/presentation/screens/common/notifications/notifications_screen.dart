import 'package:amar_thikana/data/services/notification_service.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService _notificationService = NotificationService();
  bool _isPermissionGranted = false;
  DateTime _scheduledDate = DateTime.now().add(const Duration(minutes: 1));
  
  // Controllers for text fields
  final TextEditingController _titleController = TextEditingController(text: 'Test Title');
  final TextEditingController _bodyController = TextEditingController(text: 'This is a test notification');
  final TextEditingController _payloadController = TextEditingController(text: 'test_payload');
  
  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }
  
  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _payloadController.dispose();
    super.dispose();
  }
  
  Future<void> _initializeNotifications() async {
    // Initialize the notification service
    await _notificationService.initialize();
    
    // Check permission status
    final bool hasPermission = await _notificationService.checkPermission();
    setState(() {
      _isPermissionGranted = hasPermission;
    });
    
    // Set up notification tap handler
    _notificationService.setOnNotificationTap((payload) {
      _showPayloadDialog(payload);
    });
    
    // Check if app was opened from a notification
    final String? initialPayload = await _notificationService.getInitialNotificationPayload();
    if (initialPayload != null) {
      // Delay showing the dialog to ensure the UI is fully loaded
      Future.delayed(const Duration(milliseconds: 500), () {
        _showPayloadDialog(initialPayload, isInitial: true);
      });
    }
  }
  
  Future<void> _requestPermission() async {
    final bool granted = await _notificationService.requestPermission();
    setState(() {
      _isPermissionGranted = granted;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(granted 
            ? 'Notification permission granted' 
            : 'Notification permission denied'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  
  Future<void> _showNotification() async {
    if (!_isPermissionGranted) {
      _showPermissionRequiredDialog();
      return;
    }
    
    await _notificationService.showNotification(
      id: DateTime.now().millisecond,
      title: _titleController.text,
      body: _bodyController.text,
      payload: _payloadController.text,
    );
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification sent'),
        duration: Duration(seconds: 1),
      ),
    );
  }
  
  Future<void> _scheduleNotification() async {
    if (!_isPermissionGranted) {
      _showPermissionRequiredDialog();
      return;
    }
    
    await _notificationService.scheduleNotification(
      id: DateTime.now().millisecond,
      title: _titleController.text,
      body: _bodyController.text,
      scheduledDate: _scheduledDate,
      payload: _payloadController.text,
    );
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Notification scheduled for ${_formatDateTime(_scheduledDate)}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  
  Future<void> _cancelAllNotifications() async {
    await _notificationService.cancelAllNotifications();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications cancelled'),
        duration: Duration(seconds: 1),
      ),
    );
  }
  
  Future<void> _selectDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _scheduledDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_scheduledDate),
      );
      
      if (pickedTime != null) {
        setState(() {
          _scheduledDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }
  
  void _showPermissionRequiredDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text('Notification permission is required to send notifications.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _requestPermission();
            },
            child: const Text('REQUEST PERMISSION'),
          ),
        ],
      ),
    );
  }
  
  void _showPayloadDialog(String? payload, {bool isInitial = false}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isInitial ? 'App Opened from Notification' : 'Notification Tapped'),
        content: Text('Payload: ${payload ?? 'None'}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Manager'),
        actions: [
          IconButton(
            icon: Icon(
              _isPermissionGranted ? Icons.notifications_active : Icons.notifications_off,
              color: _isPermissionGranted ? Colors.green : Colors.red,
            ),
            onPressed: _requestPermission,
            tooltip: 'Request Permission',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Permission status
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: _isPermissionGranted ? Colors.green[100] : Colors.red[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Icon(
                    _isPermissionGranted
                        ? Icons.check_circle_outline
                        : Icons.error_outline,
                    color: _isPermissionGranted ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      _isPermissionGranted
                          ? 'Notification permission granted'
                          : 'Notification permission required',
                      style: TextStyle(
                        color: _isPermissionGranted ? Colors.green[800] : Colors.red[800],
                      ),
                    ),
                  ),
                  if (!_isPermissionGranted)
                    TextButton(
                      onPressed: _requestPermission,
                      child: const Text('GRANT'),
                    ),
                ],
              ),
            ),
            
            const SizedBox(height: 24.0),
            const Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Notification details fields
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _payloadController,
              decoration: const InputDecoration(
                labelText: 'Payload',
                border: OutlineInputBorder(),
                helperText: 'Optional data to pass with notification',
              ),
            ),
            
            const SizedBox(height: 24.0),
            
            // Immediate notification section
            ElevatedButton.icon(
              onPressed: _showNotification,
              icon: const Icon(Icons.send),
              label: const Text('SEND NOTIFICATION NOW'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
            
            const SizedBox(height: 24.0),
            const Text(
              'Schedule Notification',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Scheduled notification section
            ListTile(
              title: const Text('Date & Time'),
              subtitle: Text(_formatDateTime(_scheduledDate)),
              trailing: const Icon(Icons.calendar_today),
              onTap: _selectDateTime,
              tileColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: _scheduleNotification,
              icon: const Icon(Icons.schedule),
              label: const Text('SCHEDULE NOTIFICATION'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
            
            const SizedBox(height: 24.0),
            
            // Cancel notifications section
            OutlinedButton.icon(
              onPressed: _cancelAllNotifications,
              icon: const Icon(Icons.cancel),
              label: const Text('CANCEL ALL NOTIFICATIONS'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}