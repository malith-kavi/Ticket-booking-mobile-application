import 'package:booking/screens/event%20details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy data for filters
  String selectedCategory = 'All';
  String selectedDate = 'Anytime';
  String selectedLocation = 'Anywhere';

  // Dummy data for events
  final List<Map<String, String>> events = [
    {'name': 'Music Concert', 'category': 'Music', 'date': '2024-09-01', 'location': 'Colombo','ticketPrices':'120','description':'Experience an unforgettable night of live performances at the Music Concert, where top artists come together to create magic on stage.'},
    {'name': 'Art Exhibition', 'category': 'Art', 'date': '2024-09-05', 'location': 'Kandy','ticketPrices':'120','description':'Discover captivating artworks and creativity at the Art Exhibition, where masterpieces come to life in a vibrant display of talent.'},
    {'name': 'Tech Conference', 'category': 'Science', 'date': '2024-09-10', 'location': 'Galle','ticketPrices':'120','description':'Join industry leaders and innovators at the Tech Conference to explore the latest advancements and trends in technology.'},
    {'name': 'Food Festival', 'category': 'Food', 'date': '2024-09-15', 'location': 'Matale','ticketPrices':'120','description':'Indulge in a culinary adventure at the Food Festival, featuring a diverse array of delicious dishes and flavors from around the world.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Upcoming Events',
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
      body:Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Filters
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },

                    items: <String>['All', 'Music', 'Art', 'Science', 'Food']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    
                  ),

                  DropdownButton<String>(
                    value: selectedDate,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDate = newValue!;
                      });
                    },
                    items: <String>['Anytime', '2024-09-01', '2024-09-05', '2024-09-10', '2024-09-15']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  DropdownButton<String>(
                    value: selectedLocation,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLocation = newValue!;
                      });
                    },
                    items: <String>['Anywhere', 'Colombo', 'Kandy', 'Galle', 'Matale']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  ' Events:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  // Filter events based on selected filters
                  if ((selectedCategory == 'All' || event['category'] == selectedCategory) &&
                      (selectedDate == 'Anytime' || event['date'] == selectedDate) &&
                      (selectedLocation == 'Anywhere' || event['location'] == selectedLocation)) {
                    return GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=>EventDetailsScreen(
                              eventName: event['name']!, 
                              eventDate: event['date']!, 
                              eventLocation: event['location']!, 
                              eventDescription: event['description']!, 
                              ticketPrices: [
                                {
                                  'type':'General Admission',
                                  'price':event['ticketPrices']!,
                                },
                                {
                                  'type':'VIP',
                                  'price':(int.parse(event['ticketPrices']!)*2)
                                  .toString(),
                                  }
                              ],
                              ),
                            ),
                        );
                      },
                    
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 138, 43, 226),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('Category: ${event['category']}'),
                            Text('Date: ${event['date']}'),
                            Text('Location: ${event['location']}'),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
