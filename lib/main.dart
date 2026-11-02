import 'package:flutter/material.dart';

void main() {
  runApp(const CoquetteSchoolApp());
}

class CoquetteSchoolApp extends StatelessWidget {
  const CoquetteSchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coquette School Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFFFF0F3),
      ),
      home: const CoquetteHome(),
    );
  }
}

class Task {
  String title;
  String subject;
  bool isCompleted;

  Task({required this.title, required this.subject, this.isCompleted = false});
}

class CoquetteHome extends StatefulWidget {
  const CoquetteHome({super.key});

  @override
  State<CoquetteHome> createState() => _CoquetteHomeState();
}

class _CoquetteHomeState extends State<CoquetteHome> {
  final List<Task> _tasks = [
    Task(title: 'Entregar tarea de Álgebra', subject: 'Matemáticas', isCompleted: false),
    Task(title: 'Resumen de Biología (Págs 45-60)', subject: 'Ciencias', isCompleted: true),
    Task(title: 'Traer cartulina rosa para Historia', subject: 'Sociales', isCompleted: false),
    Task(title: 'Estudiar verbos irregulares', subject: 'Inglés', isCompleted: false),
  ];

  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  void _addNewTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(
          Task(
            title: _taskController.text,
            subject: _subjectController.text.isEmpty ? 'General' : _subjectController.text,
            isCompleted: false,
          ),
        );
      });
      _taskController.clear();
      _subjectController.clear();
      Navigator.pop(context);
    }
  }

  void _showAddTaskModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFFFE5EC),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text('🎀', style: TextStyle(fontSize: 22)),
                  SizedBox(width: 8),
                  Text(
                    'Nueva Pendiente Coquette',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD81B60),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  labelText: '¿Qué tienes pendiente?',
                  labelStyle: const TextStyle(color: Color(0xFFAD1457)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: 'Materia o Asignatura (Ej. Literatura)',
                  labelStyle: const TextStyle(color: Color(0xFFAD1457)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addNewTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD81B60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Guardar con amor 💌',
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int completedCount = _tasks.where((t) => t.isCompleted).length;
    double progress = _tasks.isEmpty ? 0 : completedCount / _tasks.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFB3C6),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '🩰 My School Diary 🩰',
          style: TextStyle(
            color: Color(0xFF880E4F),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Text('🦢', style: TextStyle(fontSize: 40)),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¡Hola, hermosa! ✨',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD81B60),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Que hoy tu día en secundaria esté lleno de éxito y ternura.',
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFCCD5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Progreso del día 🎀',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF880E4F),
                        ),
                      ),
                      Text(
                        '$completedCount de ${_tasks.length} listas',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF880E4F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white,
                      color: const Color(0xFFD81B60),
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '🌸 Cosas Pendientes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF880E4F),
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFFFC2D1)),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                        color: task.isCompleted ? Colors.grey : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      task.subject,
                      style: const TextStyle(color: Color(0xFFAD1457), fontSize: 12),
                    ),
                    value: task.isCompleted,
                    activeColor: const Color(0xFFD81B60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    onChanged: (bool? value) {
                      setState(() {
                        task.isCompleted = value ?? false;
                      });
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddTaskModal,
        backgroundColor: const Color(0xFFD81B60),
        icon: const Text('🎀', style: TextStyle(fontSize: 18)),
        label: const Text('Agregar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}