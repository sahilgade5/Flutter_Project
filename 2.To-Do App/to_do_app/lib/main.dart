import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic database;
List<ModelClassToDo> obj = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
    join(await getDatabasesPath(), "DatabaseToDo.db"),
    version: 1,
    onCreate: (db, version) async {
      db.execute(
          'CREATE TABLE ToMyTable(noId INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,decription TEXT,date TEXT)');
    },
  );
  obj = await getdata();
  runApp(const MainApp());
}

Future insertdata(ModelClassToDo obj) async {
  final localdb = await database;

  await localdb.insert(
    "ToMyTable",
    obj.toDoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deletedata(int? index) async {
  final localdb = await database;

  await localdb.delete(
    "ToMyTable",
    where: "noId = ?",
    whereArgs: [index],
  );
}

Future updatedata(ModelClassToDo obj) async {
  final localdb = await database;

  localdb.update(
    "ToMyTable",
    obj.toDoMap(),
    where: "noId = ?",
    whereArgs: [obj.noId],
  );
}

Future<List<ModelClassToDo>> getdata() async {
  final localdb = await database;

  List<Map<String, dynamic>> listMapData = await localdb.query('ToMyTable');

  return List.generate(listMapData.length, (i) {
    return ModelClassToDo(
        noId: listMapData[i]['noId'],
        title: listMapData[i]['title'],
        description: listMapData[i]['decription'],
        date: listMapData[i]['date']);
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State createState() => ToDoAppState();
}

class ModelClassToDo {
  int? noId;
  String title;
  String description;
  String date;

  ModelClassToDo(
      {this.noId,
      required this.title,
      required this.description,
      required this.date});

  Map<String, dynamic> toDoMap() {
    return {
      'title': title,
      'decription': description,
      'date': date,
    };
  }
}

class ToDoAppState extends State {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    obj = await getdata();
    setState(() {});
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void clearControllers() {
    titleController.clear();
    dateController.clear();
    descriptionController.clear();
  }

  void bottom(BuildContext context, bool flag, [ModelClassToDo? toDoObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Column(
                  children: [
                    Text(
                      "Create task",
                      // style: GoogleFonts.quicksand(
                      //     fontWeight: FontWeight.w600, fontSize: 18),

                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Title",
                        // style: GoogleFonts.quicksand(
                        //     fontWeight: FontWeight.w500, fontSize: 15),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15)),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Enter Title",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Date",
                        // style: GoogleFonts.quicksand(
                        //     fontWeight: FontWeight.w500, fontSize: 15),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15)),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2025));

                        String formatedDate =
                            DateFormat.yMMMd().format(pickedDate!);
                        setState(() {
                          dateController.text = formatedDate;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Enter Date",
                        suffix: const Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Description",
                      // style: GoogleFonts.quicksand(
                      //     fontSize: 15, fontWeight: FontWeight.w500),
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      maxLines: 3,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Enter Description",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (titleController.text.trim().isNotEmpty &&
                          descriptionController.text.trim().isNotEmpty &&
                          dateController.text.trim().isNotEmpty) {
                        if (flag == false) {
                          ModelClassToDo obj1 = ModelClassToDo(
                              title: titleController.text.trim(),
                              description: descriptionController.text.trim(),
                              date: dateController.text.trim());
                          await insertdata(obj1);
                        } else {
                          toDoObj!.title = titleController.text.trim();
                          toDoObj.description =
                              descriptionController.text.trim();
                          toDoObj.date = dateController.text.trim();

                          await updatedata(toDoObj);
                        }
                      }
                      obj = await getdata();
                      clearControllers();
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text("Submit")),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 65,
            width: 148,
            margin: const EdgeInsets.only(top: 45, left: 29),
            child: const SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Good Morning",
                    // style: GoogleFonts.quicksand(
                    //     fontSize: 22,
                    //     fontWeight: FontWeight.w400,
                    //     color: Color.fromRGBO(255, 255, 255, 1)),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  Text(
                    "Sahil",
                    // style: GoogleFonts.quicksand(
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.w600,
                    //     color: Color.fromRGBO(255, 255, 255, 1)),

                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              height: 653,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "CREATE TO DO LIST",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                        height: 609,
                        width: 400,
                        padding: const EdgeInsets.only(top: 25),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: obj.length,
                            itemBuilder: (context, index) {
                              return Slidable(
                                closeOnScroll: true,
                                endActionPane: ActionPane(
                                    motion: const DrawerMotion(),
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                titleController.text =
                                                    obj[index].title;
                                                descriptionController.text =
                                                    obj[index].description;
                                                dateController.text =
                                                    obj[index].date;

                                                bottom(
                                                    context, true, obj[index]);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      89, 57, 241, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                await deletedata(
                                                    obj[index].noId);

                                                setState(() {
                                                  obj.removeAt(index);
                                                });
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      89, 57, 241, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(10, 10),
                                        color: Color.fromRGBO(243, 243, 243, 1),
                                        blurRadius: 8,
                                      )
                                    ],
                                  ),
                                  // height: 90,
                                  // width: 360,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 52,
                                        width: 52,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1)),
                                        child: Image.asset("Asset/group42.png"),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              obj[index].title,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              obj[index].description,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              obj[index].date,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Checkbox(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          activeColor: Colors.green,
                                          value: true,
                                          onChanged: (val) {}),
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottom(context, false);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
