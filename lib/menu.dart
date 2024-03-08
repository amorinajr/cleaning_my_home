import 'package:cleaning_my_home/game.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Cleaning My Home",
                style: TextStyle(
                  color: Colors.white,
                  // fontFamily: 'Normal',
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    minimumSize: const Size(100, 40), //////// HERE
                  ),
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      color: Colors.white,
                      // fontFamily: 'Normal',
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Game(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 20,
          margin: const EdgeInsets.all(20.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Developed by Edson Amorina Jr',
                      style: TextStyle(
                          color: Colors.white,
                          // fontFamily: 'Normal',
                          fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
