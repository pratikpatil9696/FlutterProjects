import 'package:flutter/material.dart';
import 'todoxmodelclass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoX extends StatefulWidget {
  const ToDoX({super.key});
  @override
  State createState() => _StateWorkPlan();
}

class _StateWorkPlan extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List colorData = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  void bottomShade(bool isEdit, [WorkPlanModelClass? obj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color.fromRGBO(255, 255, 255, 1),
                //color: const Color.fromRGBO(135, 138, 245, 1)//135, 138, 245, 1
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isEdit ? "Edit Task" : "Create Task",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: const Color.fromRGBO(49, 68, 108, 0.8)
                        //color: const Color.fromRGBO(102,106,246,1)
                        ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color.fromRGBO(49, 68, 108, 1)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "Enter Title",
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(135, 138, 245, 1),
                                  width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(135, 138, 245, 1),
                                  width: 1),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, .7)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color.fromRGBO(49, 68, 108, 1)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: "Enter Description",
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(135, 138, 245, 1),
                                  width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(135, 138, 245, 1),
                                  width: 1),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, .7)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Date",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color.fromRGBO(49, 68, 108, 1)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                          controller: dateController,
                          decoration: InputDecoration(
                            hintText: "Enter Date",
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(0, 0, 0, .7)),
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime(2025));

                            String dateString =
                                DateFormat.yMMMMd().format(date!);

                            setState(() {
                              dateController.text = dateString;
                            });
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      isEdit ? submit(isEdit, obj) : submit(isEdit);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(102, 106, 246, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.quicksand(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> submit(bool isEdit, [WorkPlanModelClass? obj]) async {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (!isEdit) {
        await insertData(WorkPlanModelClass(
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
            date: dateController.text.trim()));
        setState(() {});
      } else {
        obj!.title = titleController.text.trim();
        obj.description = descriptionController.text.trim();
        obj.date = dateController.text.trim();
        await updateData(obj);
        setState(() {});
      }
    }
  }

  void clearTextField() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void edit(WorkPlanModelClass obj) {
    titleController.text = obj.title;
    descriptionController.text = obj.description;
    dateController.text = obj.date;
    bottomShade(true, obj);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color.fromRGBO(102, 106, 246, 1),//102, 106, 246, 1),135, 138, 245, 1
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 25, 
                top: 45,
                bottom:45  
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: GoogleFonts.quicksand(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  Text(
                    "Pratik",
                    style: GoogleFonts.quicksand(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                
                
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Color.fromRGBO(135, 138, 245, 1),//102, 106, 246, 1  217, 217, 217, 1
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 25,
                        top: 5,
                        bottom: 10
                      ),
                      child: Column(
                        children: [
                          Text("Work Plan",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white)),
                    Text("Dashboard",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Colors.white)),
                        ]),
                    ),
                    
                    
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                            
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Slidable(
                                closeOnScroll: true,
                                endActionPane: ActionPane(
                                  motion: const DrawerMotion(),
                                  extentRatio: 0.2, 
                                  children: [
                                    Expanded(
                                    child: Column(
                                            children: [
                                              const Spacer(),
                                              
                                              GestureDetector(
                                                onTap: () {
                                                  edit(data[index]);
                                                
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                    size: 23,
                                                    color: Color.fromRGBO(49, 68, 108, 1),
                                                    Icons.edit_outlined),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await deleteData(data[index]);
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                    size: 23,
                                                    color: Color.fromRGBO(49, 68, 108, 1),
                                                    Icons.delete_outline_outlined),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                  )
                                  ]
                        
                                  ),
                        
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: colorData[index % colorData.length],
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1),
                                              offset: Offset(0, 10),
                                              blurRadius: 20,
                                              spreadRadius: 1)
                                        ]),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                //height: 52,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                    //color: Color.fromRGBO(255, 255, 255, 1),
                                                    //shape: BoxShape.circle,
                                                    ),
                                                child:
                                                    Image.asset("assets/Images/reminders.png")),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data[index].title,
                                                    style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 16,
                                                        color: const Color.fromRGBO(0, 0, 0, 1)),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    data[index].description,
                                                    style: GoogleFonts.quicksand(
                                                        color:
                                                            const Color.fromRGBO(84, 84, 84, 1),
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 13),
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),
                        
                                            Row(
                                              children: [
                                                Text(
                                                  data[index].date,
                                                    style: GoogleFonts.quicksand(
                                                      color: const Color.fromRGBO(132, 132, 132, 1),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 10),
                                                  ),
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // backgroundColor: const Color.fromRGBO(49, 68,108,1),

          //backgroundColor: const Color.fromRGBO(245, 169,33,1),

          backgroundColor: const Color.fromRGBO(102, 106, 246, 1),

          //backgroundColor: const Color.fromRGBO( 244, 134,60,1),
          onPressed: () {
            clearTextField();
            bottomShade(false);
          },
          child: const Icon(Icons.add_outlined),
        ));
  }
}
