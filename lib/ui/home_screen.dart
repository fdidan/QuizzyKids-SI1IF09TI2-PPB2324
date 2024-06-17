import 'package:flutter/material.dart';
import 'package:quizzykids/styles/colors.dart';
import 'package:quizzykids/styles/text_styles.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  
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
              fit: BoxFit.fitWidth
            ),
          ),
        ),
        Scaffold(
          backgroundColor: const Color.fromARGB(0, 255, 193, 7),
          appBar: AppBar(
            title: Text('Quizzy Kids', style: kHeading1,),
            actions: const [
              
            ],
          ),
          endDrawer: Drawer(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Profilku'),
                )
              ],
            ),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Pilih Kategori\nFavoritmu',
                  style: kHeading1,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/music.png'))
                      ),
                      child: Text('Musik', style: kSubtitle2,),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/history.png'))
                      ),
                      child: Text('Sejarah', style: kSubtitle2,),
                    ),
                  ],
                )
              ],
            ),
          )
        )
      ],
    );
  }
}
