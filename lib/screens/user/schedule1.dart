import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TickTick Calendar',
      theme: ThemeData(
        primarySwatch: Colors.green, // Use a green primary swatch
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade100,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: ScheduleTask(),
    );
  }
}

class ScheduleTask extends StatefulWidget {
  @override
  _ScheduleTaskState createState() => _ScheduleTaskState();
}

class _ScheduleTaskState extends State<ScheduleTask> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  Map<DateTime, List<String>> _events = {}; // Replace with your events data

  List<Task> _tasksForSelectedDay = []; // Tasks for selected day

  TextEditingController _taskNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _events = {
      DateTime.now(): ['Event 1', 'Event 2'],
      DateTime.now().add(Duration(days: 2)): ['Event 3'],
    };

    _updateTasksForSelectedDay(_selectedDay);
  }

  void _updateTasksForSelectedDay(DateTime day) {
    setState(() {
      _tasksForSelectedDay = _events[day]?.map((task) => Task(name: task, completed: false)).toList() ?? [];
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    _updateTasksForSelectedDay(selectedDay);
  }

  void _onFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Task for ${DateFormat('yyyy-MM-dd').format(_selectedDay)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _taskNameController,
              decoration: InputDecoration(
                labelText: 'Task Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save task logic goes here
                Navigator.pop(context); // Close bottom sheet after saving
                String taskName = _taskNameController.text.trim();
                if (taskName.isNotEmpty) {
                  setState(() {
                    _events[_selectedDay] ??= [];
                    _events[_selectedDay]!.add(taskName);
                    _tasksForSelectedDay.add(Task(name: taskName, completed: false));
                  });
                }
                _taskNameController.clear(); // Clear text field
              },
              child: Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TickTick Calendar',
          style: TextStyle(color: Colors.white), // Text color
        ),
        backgroundColor: Colors.green, // App bar background color
      ),
      body: Container(
        color: Colors.lightGreen[50], // Page background color
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              onDaySelected: _onDaySelected,
              onFormatChanged: _onFormatChanged,
              eventLoader: _getEventsForDay,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Tasks for ${DateFormat('yyyy-MM-dd').format(_selectedDay)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _tasksForSelectedDay.length,
                      itemBuilder: (context, index) {
                        final task = _tasksForSelectedDay[index];
                        return CheckboxListTile(
                          title: Text(
                            task.name,
                            style: TextStyle(color: Colors.green),
                          ),
                          value: task.completed,
                          onChanged: (bool? value) {
                            setState(() {
                              task.completed = value!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }
}

class Task {
  String name;
  bool completed;

  Task({required this.name, required this.completed});
}
