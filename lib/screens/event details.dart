import 'package:booking/screens/confirmation_screen.dart';
import 'package:booking/widgets/custom_button2.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  final String eventName;
  final String eventDate;
  final String eventLocation;
  final String eventDescription;
  final List<Map<String, String>> ticketPrices;

  const EventDetailsScreen({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.eventDescription,
    required this.ticketPrices,
    super.key,
  });

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  int? selectedTicketIndex;
  String? ticketType;
  String? ticketprize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Event Details',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:Color.fromARGB(255, 95, 158, 192),
              ),
              ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Name
            Text(
              widget.eventName,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Event Date and Location
            Text(
              'Date: ${widget.eventDate}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Location: ${widget.eventLocation}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            // Event Description
            const Text(
              'About the event:',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.eventDescription,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            // Ticket Prices
            const Text(
              'Ticket Prices:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.ticketPrices.length,
                itemBuilder: (context, index) {
                  final ticket = widget.ticketPrices[index];
                  final isSelected = selectedTicketIndex == index;

                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedTicketIndex = index;
                        ticketType = ticket['type']!;
                        ticketprize = ticket['price']!;
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                      
                        
                        color: isSelected
                         ?const Color.fromARGB(255, 95, 158, 192)
                         :Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ticket['type']!,
                            style:  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                               ? const Color.fromARGB(255, 0, 0, 0)
                               :Colors.black,
                            ),
                          ),
                          Text(
                            '\$${ticket['price']}',
                            style:  TextStyle(
                              fontSize: 16,
                              color: isSelected
                               ? const Color.fromARGB(255, 0, 0, 0)
                               :Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomButton2(text: 'Confirm', onPressed: (){
                      Navigator.pushReplacement(context, 
                                MaterialPageRoute(builder: (context)=>ConfirmationScreen(
                                  eventName: widget.eventName, 
                                  eventDate: widget.eventDate, 
                                  ticketType: ticketType, 
                                  ticketPrice: ticketprize)),
                                );
                    }),
                  ),
                ],
              )
            
            
          ],
        ),
      ),
    );
  }
}

