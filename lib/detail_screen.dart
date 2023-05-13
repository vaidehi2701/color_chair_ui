import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

List mycolors = <Color>[
  Colors.red,
  Colors.purple,
  Colors.indigo,
];
Color primaryColor = mycolors[0];
int _counter = 0;

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _favoriteController;

  @override
  void initState() {
    super.initState();

    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _favoriteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 15,
            ),
            appbar(),
            buildImage(),
            bottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget appbar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.person,
              color: Colors.black87,
              size: 40,
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.search,
                color: Colors.black87,
                size: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.mail_outline,
                  color: Colors.black87,
                  size: 32,
                ),
              ),
            ],
          )
        ],
      );

  Widget buildImage() => Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(primaryColor, BlendMode.color),
            child: ClipPath(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  "images/chair.png",
                  fit: BoxFit.cover,
                  width: 400,
                  height: 400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            right: 10,
            child: Column(
              children: [
                for (var i = 0; i < 3; i++)
                  IconButton(
                    icon: Icon(
                      Icons.circle,
                      color: mycolors[i].withOpacity(0.85),
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        primaryColor = mycolors[i];
                      });
                    },
                  )
              ],
            ),
          )
        ],
      );

  Widget bottomSheet() => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.black87),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fancy Chair",
                  style: GoogleFonts.lato(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                IconButton(
                  splashRadius: 50,
                  iconSize: 30,
                  onPressed: () {
                    if (_favoriteController.status ==
                        AnimationStatus.dismissed) {
                      _favoriteController.reset();
                      _favoriteController.animateTo(0.6);
                    } else {
                      _favoriteController.reverse();
                    }
                  },
                  icon: Lottie.asset(Icons8.heart_color,
                      controller: _favoriteController),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500.",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildIcon(Icons.remove),
                    SizedBox(
                      width: 40.0,
                      child: Text(
                        '$_counter',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    buildIcon(Icons.add)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "350",
                      style: GoogleFonts.lato(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
              ],
            ),
          ]),
        ),
      );

  Widget buildIcon(IconData icons) => ElevatedButton(
      style: const ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size(30, 20)),
          padding: MaterialStatePropertyAll(EdgeInsets.only(top: 8, bottom: 8)),
          backgroundColor: MaterialStatePropertyAll(Colors.grey)),
      onPressed: () {
        setState(() {
          icons == Icons.add ? _counter++ : _counter--;
        });
      },
      child: Center(child: Icon(icons)));
}
