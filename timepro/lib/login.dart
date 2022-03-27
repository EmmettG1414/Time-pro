import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {

  const  LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void Register() async {
    final User? user = (
        await _auth.createUserWithEmailAndPassword(email: emailController.text,
            password: passwordController.text)).user;

    if(user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }
  void Login() async {
    final User? user = (await _auth.signInWithEmailAndPassword(email: emailController.text,
        password: passwordController.text)).user;

    if(user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homeScreen()),
      );
    }
  }
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  Widget loginScreen() {
    return Container(
      //resizeToAvoidBottomInset : false,
      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage('assets/timeb2.jpg'),
            fit: BoxFit.fill),),
      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/timesmall.png', width: 200),
          ),
          const SizedBox(height: 60),
          TextField(
            controller: emailController,
            autofocus: false,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.yellow,
              hintText: 'Email',
              floatingLabelStyle: TextStyle(color: Colors.black),
              //focusedBorder: InputBorder.none,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
          Container(
            height: 0.1,
            color: Colors.deepPurple,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            autofocus: false,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.yellow,
              hintText: 'Password',
              floatingLabelStyle: TextStyle(color: Colors.deepPurple),
              //focusedBorder: InputBorder.none,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                side: const BorderSide(width: 2.0, color: Colors.deepPurple),
                //backgroundColor: Colors.yellow,
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0
                ),
              ),
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;

                if (email.isEmpty || password.isEmpty) {
                  showDialog(context: context, builder: (_) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Enter your email and password'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () =>  Navigator.of(context, rootNavigator: true).pop('dialog'),
                      )
                    ],
                  ));

                  return;
                }

                Login();


              },
            ),
          ),
          const SizedBox(height: 40.0),
          MaterialButton(
            child: const Text(
              "Create Account",
              style: TextStyle(color: Colors.yellow),
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          const SizedBox(height: 10.0),
          MaterialButton(
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.yellow),
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget createAccount() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/timeb2.jpg'),
            fit: BoxFit.fill),),
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/timesmall.png', width: 200),
          ),
          const SizedBox(height: 50),
          TextField(
            controller: nameController,
            autofocus: false,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.yellow,
              hintText: 'Your name',
              floatingLabelStyle: TextStyle(color: Colors.black),
              //focusedBorder: InputBorder.none,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
            height: 0.5,
            color: Colors.deepPurple,
          ),
          TextField(
            controller: emailController,
            autofocus: false,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.yellow,
              hintText: 'Email',
              floatingLabelStyle: TextStyle(color: Colors.black),
              //focusedBorder: InputBorder.none,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
            height: 0.1,
            color: Colors.deepPurple,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            autofocus: false,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.yellow,
              hintText: 'Create Password',
              floatingLabelStyle: TextStyle(color: Colors.black),
              //focusedBorder: InputBorder.none,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                side: const BorderSide(width: 1.0, color: Colors.deepPurple),
              ),
              child: const Text(
                "Register",
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0
                ),
              ),
              onPressed: () async {
                final name = nameController.text;
                final email = emailController.text;
                final password = passwordController.text;

                if (email.isEmpty || password.isEmpty) {
                  showDialog(context: context, builder: (_) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Please enter your email and password'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                      )
                    ],
                  ));

                  return;
                }

                Register();
              },
            ),
          ),
          const SizedBox(height: 40.0),
          MaterialButton(
            child: const Text(
              "Already have an account? Login",
              style: TextStyle(color: Colors.yellow),
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
        ],
      ),
    );
  }
  Widget forgotPass(){
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/timeb2.jpg'),fit: BoxFit.fill),),
      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/timesmall.png', width: 200),
          ),
          const SizedBox(height: 50),
          Container(
            height: 0.5,
            color: Colors.deepPurple,
          ),
          TextField(
            controller: emailController,
            autofocus: false,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.yellow,
              hintText: 'Your Email',
              floatingLabelStyle: TextStyle(color: Colors.black),
              //focusedBorder: InputBorder.none,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
            height: 0.1,
            color: Colors.deepPurple,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            autofocus: false,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.yellow,
                hintText: 'Create New Password',
                floatingLabelStyle: TextStyle(color: Colors.black),
                //focusedBorder: InputBorder.none,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
          const SizedBox(height: 40.0),
            SizedBox(
              width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    side: const BorderSide(width: 2.0, color: Colors.deepPurple),
    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),),
            child: const Text(
              "Reset Password",
              style: TextStyle(
                  color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 18,),
            ),
            onPressed: () {
              child: Text(
                "Password has been Reset"
              );
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
            ),
          const SizedBox(height: 40.0),
          MaterialButton(
            child: const Text(
              "Back to Login",
              style: TextStyle(color: Colors.yellow),
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;


    emailController.text = "";

    return Scaffold(
        resizeToAvoidBottomInset : false,
        extendBodyBehindAppBar: true,
        body: IndexedStack(
          index: selectedIndex,
          children: [
            loginScreen(),
            createAccount(),
            forgotPass(),
          ],
        )
    );
  }
}
