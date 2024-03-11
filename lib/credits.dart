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
          width: 960,
          height: 540,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              width: 960,
              height: 540,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/title-background/background-title.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const SizedBox(
                        width: 100.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 75.0,
                          ),
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset(
                              'assets/images/items/recyclebin.png',
                              scale: 0.5,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 75.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 75.0,
                          ),
                          const SizedBox(
                            width: 300.0,
                            child: Text(
                              'Desenvolvido por Edson Amorina Jr',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
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
                                minimumSize: const Size(100, 40), //////// HERE
                              ),
                              child: const Text(
                                'Voltar para menu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
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
                          const SizedBox(
                            width: 150.0,
                            child: Text(
                              '#GlobalGamersChallenge ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
