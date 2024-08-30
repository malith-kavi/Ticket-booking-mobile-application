import 'package:booking/widgets/custom_button2.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String? ticketType;
  final String? ticketPrice;

  const ConfirmationScreen({
    required this.eventName,
    required this.eventDate,
    required this.ticketType,
    required this.ticketPrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Booking Confirmation',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 95, 158, 192)
            ),),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        color:Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Ok.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                'Your Ticket is Booked!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Event: $eventName',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Date: $eventDate',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Ticket Type: $ticketType',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Price: \$$ticketPrice',
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomButton2(text: 'Back to Home', 
                onPressed: (){
                  Navigator.popUntil(context, 
                   (route) => route.isFirst);
                   
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
