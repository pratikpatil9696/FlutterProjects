import "package:coworking/Controller/dialogeData.dart";
import "package:coworking/Controller/getSlotsAPI.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "../Controller/getAvailability.dart";


class Desk extends StatefulWidget {
  const Desk({super.key});

  @override
  State createState() => _DeskState();
}

class _DeskState extends State {

  int selectedSeat = -1;

  void selectSeat(int seatNumber) {
    setState(() {
      selectedSeat = seatNumber;
    });
  }


  Border? getBorder(bool isBooked) {

    if(isBooked){
     
    }
    else{
      return Border.all(
        color: const Color.fromRGBO(199, 207, 252, 1)
      );
    }

  }
  List<String> slots = [
      "10:00AM - 11:00AM",
      "11:00AM - 12:00PM",
      "01:00PM - 02:00PM",
      "02:00PM - 03:00PM",
      "04:00PM - 05:00PM",
      "05:00PM - 06:00PM",
      "06:00PM - 07:00PM",
      "07:00PM - 08:00PM",
      "08:00PM - 09:00PM",
      "09:00PM - 10:00PM"
    ];

    int seatid=0;

    
  static List<DateTime> dates = List<DateTime>.generate(
    500,
    (i) => DateTime.now().add(Duration(days: i)),
  );



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Date & Slot",
        style: GoogleFonts.poppins(
          fontWeight:FontWeight.w400,
          fontSize:20,
          color:Colors.black
          
        ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [


          Container(
              height: 80,
              decoration: const BoxDecoration(
                border:Border.symmetric(
                  horizontal: BorderSide(
                    color: Color.fromRGBO(232, 226, 226, 1),
                    width: 1
                  )
                )
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return DateItem(
                    date: dates[index],
                    onSelected: (isSelected) {
                      
                      if(isSelected==true){
                        DialogData.datesData.add(dates[index]);
                      }

                    },
                  );
                },
              ),
            ),

            const SizedBox(
              height: 25,
            ),



                
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  itemCount: slots.length,
                  itemBuilder: (context, index) {
                    int seatNumber = index + 1;
                    bool isBooked = GetSlotsAPI.activeSlotIds.contains(seatNumber);
                    bool isSelected = seatNumber == selectedSeat;
        
                    Color color;
                    if (isBooked) {
                      color = const Color.fromRGBO(227, 227, 227, 1);
                    } else if (isSelected) {
                      color = const Color.fromRGBO(77, 96, 209, 1);
                    } else {
                      color = const Color.fromRGBO(240, 245, 255, 1);
                    }

                    return GestureDetector(
                      onTap: () {

                        seatid=seatNumber;
                        if (!isBooked) {
                          selectSeat(seatNumber);
                          
                        }
                        
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          border:  getBorder(isBooked),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Center(
                          child: Text(
                            slots[index],
                            style: GoogleFonts.poppins(
                              fontWeight:FontWeight.w400,
                              fontSize:14,
                              color: isBooked ? Colors.white : 
                              isSelected ? const Color.fromRGBO(255, 255, 255, 1) : const Color.fromRGBO(91, 97, 128, 1),
                              
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        
             GestureDetector(
              onTap: (){
                
                GetAvailabilityAPI.get_availability();
                print("time$seatid");
                DialogData.addTime(seatid);

                Navigator.pushNamed(context, 'AvaliableDesk');
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color:const Color.fromRGBO(81, 103, 235, 1),
                  borderRadius: BorderRadius.circular(10)
                ),
                alignment:Alignment.center,
                child: Text("Next",
                  style: GoogleFonts.poppins(
                    fontWeight:FontWeight.w700,
                    fontSize:16,
                    color:const Color.fromRGBO(255, 255, 255, 1)
                  ),
                ),
              ),
             )
        
          ],
        ),
      ),
    
    );
  }
}








class DateItem extends StatefulWidget {
  final DateTime date;
  final ValueChanged<bool> onSelected;

  DateItem({required this.date, required this.onSelected});

  @override
  _DateItemState createState() => _DateItemState();
}
class _DateItemState extends State<DateItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          
          _isSelected = !_isSelected;
          widget.onSelected(_isSelected);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 60,
          decoration: BoxDecoration(
            color: _isSelected ? const Color.fromRGBO(77, 96, 209, 1) : Colors.white, 
            
            border: Border.all(
              color: _isSelected ? const Color.fromRGBO(77, 96, 209, 1) : Colors.white,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('E').format(widget.date), 
                style: TextStyle(
                  color: _isSelected ? Colors.white : Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.date.day.toString(), 
                style: TextStyle(
                  color: _isSelected ? Colors.white : Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('MMM').format(widget.date), 
                style: TextStyle(
                  color: _isSelected ? Colors.white : Colors.black,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


