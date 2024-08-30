import 'package:booking/screens/home_screen.dart';
import 'package:booking/screens/notifications.dart';
import 'package:booking/widgets/custom_button.dart';
import 'package:booking/widgets/filling_bar.dart';
import 'package:booking/widgets/gray_button.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Image.asset(
                      'assets/images/explore2.png',
                      width: 300,
                      height: 300,
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      ),
                      Center(
                        child: Text(
                          'Explore top events',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                
                  
                  
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
                          child: Text(
                            '  Explore the top events in your \narea and book events seamlessly',
                          ),
                        ),
                      ],
                    ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          2,
                          (index) =>Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child:GrayBar(isBlue: index == 0,
                          ),
                          ),
                        ),
                    ),
                  ),
                  const Spacer(),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GrayButton(
                          text: 'Skip',
                          onPressed: (){
                            Navigator.push(context, 
                                MaterialPageRoute(builder: (context)=>HomeScreen()),
                                );
                          },
                        ),
                      ),
                    
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomButton(
                              text: 'Next',
                              onPressed: (){
                                Navigator.pushReplacement(context, 
                                MaterialPageRoute(builder: (context)=>Notifications()),
                                );
                              },
                            ),
                          ),
                           
                        ],
                        
                      ),
                      const Spacer(),
                ]         
              ),
            ),
          ),
        ),
      ),
    );
  }
}

