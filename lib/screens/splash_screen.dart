import 'package:flutter/material.dart';
import 'package:menuapp/models/bgimage_model.dart';
import 'package:menuapp/widgets/blob.dart';
import 'package:menuapp/widgets/float_image.dart';
import 'restaurantmenu_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _floatController;

  late List<FloatingBgImage> bgImages;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.9,
      upperBound: 1.1,
    )..repeat(reverse: true);

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    Future.delayed(const Duration(milliseconds: 1500), () {
      _textController.forward();
    });

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    bgImages = [];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      double screenWidth = MediaQuery.of(context).size.width;
      for (var img in leftImages) {
        bgImages.add(img);
        bgImages.add(FloatingBgImage(
          imagePath: img.imagePath,
          top: img.top,
          left: screenWidth - img.left! - img.width,
          width: img.width,
          height: img.height,
          opacity: img.opacity,
          dx: img.dx,
          dy: img.dy,
        ));
      }
      setState(() {});
    });

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RestaurantMenuScreen()),
      );
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fond dégradé
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 54, 7, 7),
                  Color.fromARGB(255, 19, 19, 18),
                  Color.fromARGB(255, 27, 2, 1),
                ],
              ),
            ),
          ),

          // Blobs animés (coins)
          buildBlob(
              top: -80,
              left: -80,
              controller: _floatController,
              color: Colors.orangeAccent.withOpacity(0.3)),
          buildBlob(
              bottom: -80,
              right: -80,
              controller: _floatController,
              color: Colors.redAccent.withOpacity(0.2)),

          // Images flottantes
          for (var bg in bgImages)
            AnimatedBuilder(
              animation: _floatController,
              builder: (context, child) {
                return Positioned(
                  top: bg.top + bg.dy * _floatController.value,
                  left: bg.left! + bg.dx * _floatController.value,
                  child: Opacity(
                    opacity: bg.opacity,
                    child: Image.asset(
                      bg.imagePath,
                      width: bg.width,
                      height: bg.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),

          // Logo + texte + loader
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                ScaleTransition(
                  scale: _logoController,
                  child: ClipOval(
                    child: Image.asset(
                      "logo.png",
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeTransition(
                  opacity: _textController,
                  child: Text(
                    "MENU LE FRAIS CHAUD",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.luckiestGuy(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [Colors.orangeAccent, Colors.redAccent],
                        ).createShader(
                          Rect.fromLTWH(
                              0, 0, MediaQuery.of(context).size.width, 70),
                        ),
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.orangeAccent,
                    strokeWidth: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




