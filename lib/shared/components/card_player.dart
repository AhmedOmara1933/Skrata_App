import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubit/app_cubit.dart';

class CardPlayer extends StatefulWidget {
  final Map model;

  const CardPlayer({super.key, required this.model});

  @override
  State<CardPlayer> createState() => _CardPlayerState();
}

class _CardPlayerState extends State<CardPlayer> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.model['name'].toString()),
      onDismissed: (value) {
        AppCubit.get(context).deleteDatabase(id: widget.model['id'].toString());
      },
      child: Container(
        height: 245.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xff699442),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: const Image(
                              image: AssetImage('images/217.jpg'),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Text(
                              '${widget.model['name']}',
                              style: GoogleFonts.acme(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          counter = 0;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 40.0),
                        child: const Image(
                          image: AssetImage('images/reset.png'),
                          height: 35.0,
                          width: 50.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          counter -= 1;
                        });
                      },
                      child: const Icon(Icons.arrow_back_ios)),
                  Container(
                    width: 120.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$counter',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          counter += 1;
                        });
                      },
                      child: const Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            counter -= 3;
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 30.0,
                              child: Text(
                                '-3',
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                            ),
                            const Text(
                              'lose',
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            counter += 3;
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 30.0,
                              child: Text(
                                '3',
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                            ),
                            const Text(
                              'Win',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          counter += 1;
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 30.0,
                              child: Text(
                                '1',
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                            ),
                            const Text(
                              'Extra',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            counter -= 5;
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 30.0,
                              child: Text(
                                '-5',
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                            ),
                            const Text(
                              'lose',
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
