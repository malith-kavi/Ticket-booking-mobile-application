import 'package:booking/screens/home_screen.dart';
import 'package:booking/widgets/custom_button.dart';
import 'package:booking/widgets/filling_bar.dart';
import 'package:booking/widgets/gray_button.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
   const Notifications({super.key});
  
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/notification2.png',
                    width: 300,
                    height: 300,
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
                          'Book & get notifications',
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
                            'Get notifications about latest events\n               and keep in touch',
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
                          child:GrayBar(isBlue: index == 0 || index == 1,
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
                                MaterialPageRoute(builder: (context)=>const HomeScreen()),
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
                                MaterialPageRoute(builder: (context)=>const HomeScreen()),
                                );
                              },
                            ),
                          ),
                        
                        ],

                      ),
                      const Spacer(),
                        ],
                      ),
                    
                  ),
                         
              ),
            ),
          ),
        );
  }
}

