import 'package:app_gym/models/exercise.dart';
import 'package:app_gym/models/routine.dart';
import 'package:flutter/material.dart';
//import 'package:app_gym/models/exercise.dart';
import 'package:app_gym/services/database_service.dart';

class AddRoutineScreen extends StatefulWidget {
  final String clientId;
  final Function updateRoutineList;

  const AddRoutineScreen({super.key, required this.clientId, required this.updateRoutineList});

  @override
  // ignore: library_private_types_in_public_api
  _AddRoutineScreenState createState() => _AddRoutineScreenState();
}
class _AddRoutineScreenState extends State<AddRoutineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _repsController = TextEditingController();
  final _setsController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _commentsController = TextEditingController();
  final _durationController = TextEditingController();
  bool? result = false;

  @override
  void initState() {
    super.initState();
  }

  final List<Exercise> _exercises = [
    Exercise(id: '1', name: 'Sentadillas', description: 'descripcion 1', sets: 3, reps: 10, duration: 0),
    Exercise(id: '2', name: 'Flexiones', description: 'descripcion 2', sets: 3, reps: 15, duration: 0),
    Exercise(id: '3', name: 'Estocadas', description: 'descripcion 3', sets: 5, reps: 20, duration: 0),
    Exercise(id: '4', name: 'Dominadas', description: 'descripcion 4',  sets: 3, reps: 10, duration: 0),
    Exercise(id: '5', name: 'Press Banca', description: 'descripcion 5', sets: 3, reps: 10, duration: 0),
    Exercise(id: '6', name: 'Peso muerto', description: 'descripcion 6', sets: 3, reps: 10, duration: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir nueva rutina'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
    
    borderRadius: BorderRadius.circular(10),
  ),
            child: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Ejercicio',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ingrese el nombre del ejercicio';
                                  }
                                  return null;
                                },
                              ),TextFormField(
                          controller: _repsController,
                          decoration: const InputDecoration(
                            labelText: 'Repeticiones',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese la cantidad de repeticiones';
                            }
                            return null;
                          },
                        ),TextFormField(
                          controller: _setsController,
                          decoration: const InputDecoration(
                            labelText: 'Series',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese la cantidad de series';
                            }
                            return null;
                          },
                        ),TextFormField(
                          controller: _durationController,
                          decoration: const InputDecoration(
                            labelText: 'Duracion',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese la duracion del ejercicio';
                            }
                            return null;
                          },
                        ),TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Descripción',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese una descripción del ejercicio';
                            }
                            return null;
                          },
                        ),const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                _exercises.add(Exercise(id: '7', name: _nameController.text, description: _descriptionController.text, sets: int.parse(_setsController.text), reps: int.parse(_repsController.text), duration: int.parse(_durationController.text)));
                              });
                                    _nameController.clear();
                                    _descriptionController.clear();
                                    _repsController.clear();
                                    _setsController.clear();
                         //     final exercise = Exercise(
                         //       id: '',
                         //       name: _nameController.text,
                         //       description: _descriptionController.text,
                          //    );
                        //      DatabaseService.addExercise(exercise).then((_) {
                              
                              
                          //    });
                            }
                                },
                                child: const Text('Agregar ejercicio'),
                              ),
                      ],
                    ),
                  ),
                ),ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: _exercises.length,
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        title: Text(_exercises[index].name),
        subtitle: Text(_exercises[index].description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('${_exercises[index].sets.toString()} sets de ${_exercises[index].reps.toString()} reps'),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmar eliminación'),
                      content: const Text('¿Estás seguro de que quieres eliminar este ejercicio?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Eliminar'),
                          onPressed: () {
                            setState(() {
                              _exercises.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  },
),
              ],
            ),
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    DateTime? date = DateTime.now();
      result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estás seguro que quieres añadir la rutina?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: _commentsController,
                  decoration: const InputDecoration(
                    labelText: 'Comentario',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un comentario';
                    }
                    return null;
                  },
                ), 
                const SizedBox(height: 20),
                ElevatedButton(
  onPressed: () async {
    final DateTime today = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(today.year, today.month - 1), // Primer día del mes anterior
      lastDate: today, // Hoy
    );
    if (selectedDate != null) {
      setState(() {
        date = selectedDate;
      });
    }
  },
  child: const Text('Seleccionar fecha'),
),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context, false); // Devolver false para indicar que no se realizó ninguna actualización
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () async {
                final routine = await DatabaseService.addRoutine(Routine(
                  id: '',
                  date: date.toString(),
                  exercises: _exercises,
                  comments: _commentsController.text,
                ), widget.clientId);
                
                // ignore: use_build_context_synchronously
                Navigator.pop(context, true); 
              },
            ),
          ],
        );
      },
    );
    if (result == true) {
    setState(() {
      widget.updateRoutineList();
      _exercises.clear();
      _commentsController.clear();
    });();
    }
  },
  child: const Icon(Icons.done),
),

    );
  }
}