import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../core/routes/app_routes.dart';

class EnterMobileNumberView extends StatefulWidget {
   EnterMobileNumberView({super.key});

  @override
  State<EnterMobileNumberView> createState() => _EnterMobileNumberViewState();
}

class _EnterMobileNumberViewState extends State<EnterMobileNumberView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              // logo 
              SvgPicture.asset("assets/onboarding/logo.svg"),
              SizedBox(height: 18),
              
              // welcome text
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 18),
              
              //welcome note
              Text(
                "Access room services, housekeeping,and support instantly.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 40),
              
              // email or mobile input
              TextFormField(
                style:  TextStyle(
                  color: Color(0xffff5555),
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: 'Email / Mobile',
                  hintText: 'Enter email or mobile',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  
                  hintStyle:  TextStyle(color: Colors.grey),

                  // label color (unfocused)
                  labelStyle:  TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: Colors.grey),
                    
                  ),
                ),
              ),

              SizedBox(height: 64),
              Center(
                child: SizedBox(
                  width: 288,
                  height: 44,
                  child: ElevatedButton(

                    // navigating to verification screen
                    onPressed: (){Get.toNamed(Routes.otpVerification);},

                    // text button
                    child: Text(
                      "Get OTP",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xffff5555),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
