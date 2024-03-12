import 'package:flutter/material.dart';

class HowToPlay extends StatefulWidget {
  const HowToPlay({super.key});

  @override
  State<HowToPlay> createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay> {
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
                        width: 25.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 25.0,
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/title-background/blocks-how-to-play.png',
                              scale: 0.1,
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
                            width: 335.0,
                            child: Text(
                              'A child playing threw some of his plastic building blocks into the aquarium, home of our little hero Crab.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
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
                            width: 335.0,
                            child: Text(
                              'Now, you need to help him find the blocks and take them to the recycling bin.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
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
                            width: 335.0,
                            child: Text(
                              'There is a time limit for cleaning, but for each block found, you will gain an increment of time.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
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
                            width: 335.0,
                            child: Text(
                              'So let\'s do this: Help our little hero Crabs in Cleaning His Home!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Crayon',
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            height: 1.0,
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
