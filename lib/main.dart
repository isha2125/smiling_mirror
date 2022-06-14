import 'package:flutter/material.dart';
import 'package:smiling_mirror/camera.dart';
import 'package:smiling_mirror/splash.dart';
import 'package:camera/camera.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

late List<CameraDescription> _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smiling mirror",
      home: Splash(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 3, 3),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'The only curve that looks good all the time is',
                    textStyle: const TextStyle(
                      fontFamily: 'Robo',
                      letterSpacing: 3.0,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TyperAnimatedText(
                    'Smile',
                    textStyle: const TextStyle(
                      fontFamily: 'Robo',
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.white,
                      letterSpacing: 3.0,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TypewriterAnimatedText(
                    'A smile holds some magic.',
                    textStyle: const TextStyle(
                        fontSize: 32.0,
                        letterSpacing: 3.0,
                        color: Colors.white,
                        fontFamily: 'Robo'),
                    speed: const Duration(milliseconds: 200),
                  ),
                  TypewriterAnimatedText(
                    'Would you like to see it ?',
                    textStyle: const TextStyle(
                        fontSize: 32.0,
                        letterSpacing: 3.0,
                        color: Colors.white,
                        fontFamily: 'Robo'),
                    speed: const Duration(milliseconds: 400),
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: false,
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Let\'s See'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                textStyle: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
