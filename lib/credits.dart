import 'package:flutter/material.dart';

class Credits extends StatefulWidget {
  const Credits({super.key});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: 1280,
          height: 720,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              // width: 960,
              // height: 540,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/title-background/background-title.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 50.0,
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/items/recyclebin.png',
                              scale: 0.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 110.0,
                          ),
                          const SizedBox(
                            width: 325.0,
                            child: Text(
                              'Developed by: Edson Amorina Junior',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Crayon',
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const SizedBox(
                            width: 325.0,
                            child: Text(
                              '[Background Sound] Artist: Kirk Osamayo - Title: Video Game Snowy Night - Source: Free Music Archive (CC BY)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Crayon',
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const SizedBox(
                            width: 325.0,
                            child: Text(
                              '[Sound Effects] Source: Zapsplat.com',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Crayon',
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const SizedBox(
                            width: 325.0,
                            child: Text(
                              '#GlobalGamersChallenge ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Crayon',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 250,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                minimumSize: const Size(100, 25),
                              ),
                              child: const Text(
                                'Back to the Menu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontFamily: 'Crayon',
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
