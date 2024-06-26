import 'package:animate_do/animate_do.dart';
import 'package:bidyapithedu/constants/color_path.dart';
import 'package:bidyapithedu/features/views/auth/signUp_page.dart';
import 'package:bidyapithedu/shared_components/custom_widget/custom_textfield.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:gcc_admin/features/views/auth/forget_password.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../confiq/routing/all_route.dart';
import '../../../constants/local_string.dart';
import '../../../constants/other_constant.dart';
import '../../../shared_components/custom_style.dart';
import '../../../shared_components/custom_widget/custom_button.dart';
import '../../../shared_components/custom_widget/custom_widgets.dart';
import '../../controller/auth_controller.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put(AuthController());
  final box = GetStorage();

  void initState() {
    // TODO: implement initState
    super.initState();
    getUsernameAndPassword();
  }

  getUsernameAndPassword(){
    _authController.mobileController.text=box.read('username')??'';
    _authController.passwordController.text=box.read('password')??'';
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPath.kWhite,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: CustomStyle.kCustomBoxDecoration(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30.sp,
                        width: 80.sp,
                        height: 200.sp,
                        child: FadeInUp(duration: Duration(seconds: 1), child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140.sp,
                        width: 80.sp,
                        height: 150.sp,
                        child: FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40.sp,
                        top: 40.sp,
                        width: 80.sp,
                        height: 150.sp,
                        child: FadeInUp(duration: Duration(milliseconds: 1300), child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeInUp(duration: const Duration(milliseconds: 1600), child: Container(
                          margin:  EdgeInsets.only(top: 50.sp),
                          child:  Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize:40.sp, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FadeInUp(duration: Duration(milliseconds: 1800), child:
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color.fromRGBO(143, 148, 251, 1)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(

                          children: <Widget>[
                           Obx((){

                             print(_authController.showPass.value);
                             return  Container(
                               decoration: BoxDecoration(
                                 border:Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1))),
                               ),
                               child: CustomTextField.kCustomTextField(
                                 border: InputBorder.none,
                                 contentPadding: EdgeInsets.only(left: 5,top:4),
                                 hint: 'User name',
                                 fillColor: ColorPath.kWhite,
                                 suffixIcon:Icon(FeatherIcons.user,size: 15,),
                                 controller: _authController.mobileController,
                                 validator:  (value) => value!.isNotEmpty
                                 // RegExp("^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                                 //         .hasMatch(value!)
                                     ? null
                                     : 'Enter Valid User ID',),
                             );
                           }
                           ),
                            Obx(() => CustomTextField.kCustomTextField(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 8,top: 4),
                                hint: 'Password',
                                fillColor: ColorPath.kWhite,
                                controller: _authController.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.length<6) {
                                    return 'Password minimum 6 digit';
                                  }else if (value.length > 15) {
                                    return "Exceeded password limit";
                                  }
                                  return null;
                                },
                                suffixIcon:InkWell(
                                  onTap: () {
                                    _authController
                                        .passwordVisibility();
                                  },
                                  child: Icon(_authController
                                      .showPass.isFalse
                                      ? FeatherIcons.eye
                                      : FeatherIcons.eyeOff,size: 15,),
                                ),
                                obscureText: _authController.showPass.value
                            )),



                          ],
                        ),
                      )),

                      SizedBox(height: 20),

                      FadeInUp(
                        duration: Duration(milliseconds: 1900),
                        child: CustomButton.customButton(
                            onTap:() {
                              if(_formKey.currentState!.validate()){

                                _authController.login();
                              }
                            },
                            text: 'Login'
                        ),
                      ),

                      FadeInUp(
                        duration: Duration(milliseconds: 1900),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(LocalString.DONT_HAVE_ACCOUNT.tr,style: CustomStyle.kCustomTextStyle(),),
                            TextButton(
                              onPressed: (){
                              // Navigator.of(context).pushReplacementNamed(AllRouters.SIGN_UP_PAGE);
                              Get.to(() => SignUpPage(),
                                  transition: Transition.circularReveal
                              );
                            },
                              style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                              child: Text(LocalString.REGISTRATION_BUTTON.tr,style: CustomStyle.kCustomTextStyle(color:ColorPath.kPrimaryColor),),)
                          ],),
                      )

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
