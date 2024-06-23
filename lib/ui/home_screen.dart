import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizzykids/model/db_connect.dart';
import 'package:quizzykids/routes/route.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';
import 'package:quizzykids/ui/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState(){
    super.initState();
    DbConnect();
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.sizeOf(context).height;
    var widthDevice = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/home_bg_image.png'),
                fit: BoxFit.fitWidth),
          ),
        ),
        Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color.fromARGB(0, 255, 193, 7),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: kWhite),
              title: Text(
                'Quizzy Kids',
                style: kHeading6,
              ),
              backgroundColor: kDeepPurple,
              toolbarHeight: heightDevice * 0.08,
              actions: const [],
            ),
            endDrawer: Drawer(
              width: widthDevice * 0.6,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.only(
                  left: widthDevice * 0.06,
                ),
                margin: EdgeInsets.only(
                    top: heightDevice * 0.05, bottom: heightDevice * 0.4),
                decoration: const BoxDecoration(
                    color: kDeepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListView(
                  itemExtent: 34,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.account_circle_rounded,
                          color: kWhite,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: () {
                            //
                          },
                          child: StreamBuilder(
                              stream: FirebaseAuth.instance.authStateChanges(),
                              builder: (context, snapshot) {
                                var userName =
                                    snapshot.data?.displayName.toString();
                                //snapshot.data?.d
                                return Text(
                                  '$userName',
                                  style: kHeading8,
                                );
                              }),
                        )
                      ],
                    ),
                    ListTile(
                      title: Text(
                        'Profilku',
                        style: kSubtitle1,
                      ),
                      onTap: () {
                        //
                      },
                    ),
                    ListTile(
                      title: Text('Pesan', style: kSubtitle1),
                      onTap: () {
                        //
                      },
                    ),
                    ListTile(
                      title: Text('Notifikasi', style: kSubtitle1),
                      onTap: () {
                        //
                      },
                    ),
                    ListTile(
                      title: Text('Peringkat', style: kSubtitle1),
                      onTap: () {
                        //
                      },
                    ),
                    ListTile(
                      title: Text('Pengaturan', style: kSubtitle1),
                      onTap: () {
                        //
                      },
                    ),
                    ListTile(
                      title: Text('Bantuan & Dukungan', style: kSubtitle1),
                      onTap: () {
                        //
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: heightDevice * 0.08,
                ),
                Text(
                  'Pilih Kategori\nFavoritmu',
                  style: kHeading1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: heightDevice * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, rMusicQuiz);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: widthDevice * 0.2,
                            height: widthDevice * 0.2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/music.png'))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Musik',
                            style: kSubtitle2,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, rHistoryQuiz);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: widthDevice * 0.2,
                            height: widthDevice * 0.2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/history.png'))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sejarah',
                            style: kSubtitle2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: heightDevice * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          rSportQuiz,
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: widthDevice * 0.2,
                            height: widthDevice * 0.2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sport.png'))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Olahraga',
                            style: kSubtitle2,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          rAnimalQuiz,
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: widthDevice * 0.2,
                            height: widthDevice * 0.2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/animal.png'))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Binatang',
                            style: kSubtitle2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: heightDevice * 0.1),
                ElevatedButton(
                    onPressed: () async {
                      FirebaseAuth.instance.signOut().then((value) =>
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (route) => false));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kDeepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        'Keluar',
                        style: kButton1,
                      ),
                    )),
              ],
            )))
      ],
    );
  }
}
