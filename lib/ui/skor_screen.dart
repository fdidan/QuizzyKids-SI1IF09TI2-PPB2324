import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzykids/routes/route.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';

class SkorScreen extends StatefulWidget {
  const SkorScreen({
    super.key,
    required this.finalSkor,
  });

  final Map<String, dynamic> finalSkor;

  @override
  State<StatefulWidget> createState() => _SkorScreenState(finalSkor);
}

class _SkorScreenState extends State<SkorScreen> {
  _SkorScreenState(this.finalSkor);
  final Map<String, dynamic> finalSkor;

  late int benar = finalSkor['benar'];
  late int salah = finalSkor['salah'];
  late double skor = finalSkor['skor'];
  late String kategori = finalSkor['kategori'];

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.sizeOf(context).height;
    var widthDevice = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_image_skor.png'),
                fit: BoxFit.fitWidth),
          ),
        ),
        Container(
          padding: EdgeInsets.all(widthDevice * 0.05),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: heightDevice * 0.08,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: Container(
                width: widthDevice * 0.15,
                height: widthDevice * 0.15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kDeepPurple,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.popAndPushNamed(
                      context,
                      rHome,
                    );
                  },
                  color: kWhite,
                ),
              ),
              title: Text(
                'Quizzy Kids',
                style: kHeading2,
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: widthDevice * 0.9,
                    height: heightDevice * 0.08,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: kYellow,
                    ),
                    child: Center(
                      child: Text(
                        kategori,
                        style: kHeading7,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Salah : $salah',
                        style: kSubtitle2,
                      ),
                      Container(
                        child: Text(
                          'Benar : $benar',
                          style: kSubtitle2,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightDevice * 0.04,
                        ),
                        Container(
                          width: widthDevice * 0.8,
                          height: widthDevice * 0.2,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/congrats.png'),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: widthDevice * 0.4,
                          height: widthDevice * 0.4,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/piala.png'),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                        SizedBox(
                          height: heightDevice * 0.02,
                        ),
                        Column(
                          children: [
                            Text(
                              'Skor',
                              style: kHeading7,
                            ),
                            Text(
                              '$skor',
                              style: GoogleFonts.poppins(
                                  color: kGreenLeaf,
                                  fontSize: widthDevice * 0.08,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightDevice * 0.02,
                        ),
                        Container(
                          width: widthDevice * 0.6,
                          height: widthDevice * 0.14,
                          decoration: BoxDecoration(
                              color: kLightGreen,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, rHome);
                                },
                                child: Text(
                                  'Beranda',
                                  style: kButton1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  size: 60.0,
                )),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          ),
        ),
      ],
    );
  }
}
