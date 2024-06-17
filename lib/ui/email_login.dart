import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizzykids/bloc/login/login_cubit.dart';
import 'package:quizzykids/routes/route.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';
import 'package:quizzykids/ui/home_screen.dart';

class EmailLogin extends StatefulWidget{
  const EmailLogin({super.key});
  
  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin>{
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();

  bool passInvisible = false;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
      (value) async => await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false));
  }

  @override 
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_image.png'),
                    fit: BoxFit.fitWidth
                  ),
                ),
        ),
        Scaffold(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          body: BlocListener<LoginCubit, LoginState>(
            listener: (context, state){
              if(state is LoginSuccess){
                ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.msg),
                  backgroundColor: Colors.green,
                  ));
                Navigator.pushNamedAndRemoveUntil(context, rHome, (route) => false);
              }
              if(state is LoginLoading){
                ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(content: Text('Loading...')));
              }
              if(state is LoginFailure){
                ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.msg),
                  backgroundColor: Colors.red,
                  ));
              }
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                color: const Color.fromARGB(0, 255, 193, 7),
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.2),
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      height: MediaQuery.sizeOf(context).width * 0.15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kDeepPurple,
                      ),
                      child: BackButton(
                        onPressed:() {
                          Navigator.pop(context);
                        },
                        color: kWhite,
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).width * 0.12,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        'Masuk\nuntuk\nmelanjutkan',
                        style: kHeading5,
                      ),
                    ),
                    const SizedBox(height: 44,),
                    Center(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailEdc,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kDeepPurple,
                                  width: 2,
                                  style: BorderStyle.solid
                                )
                              ),
                              labelText: 'Email',
                              labelStyle: kTextField,
                              fillColor: kDeepPurple,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          TextFormField(
                            controller: passEdc,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kDeepPurple,
                                  width: 2,
                                  style: BorderStyle.solid
                                )
                              ),
                              labelText: 'Kata Sandi',
                              labelStyle: kTextField,
                              fillColor: kDeepPurple,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passInvisible = !passInvisible;
                                  });
                                },
                                icon: Icon(passInvisible? Icons.visibility : Icons.visibility_off)
                              )
                            ),
                            obscureText: !passInvisible,
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/forgotpassword');
                                },
                                child: Text(
                                  'Lupa kata sandi?',
                                  style: kTextLink2,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 18,),
                          ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>()
                                .login(
                                  email: emailEdc.text,
                                  password: passEdc.text
                                );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kDeepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                'Masuk',
                                style: kButton1,
                              ),
                            )
                          ),
                        ],
                      )  
                    ),
                  ],
                ),
              ),
            )
          ),
        )
      ],
    );
  }
}