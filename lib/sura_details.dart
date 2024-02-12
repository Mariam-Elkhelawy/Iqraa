import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFiles(model.index);
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'إسلامي',
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            margin: EdgeInsets.all(20),
            color: Color(0xFFF8F8F8).withOpacity(.8),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            child: Column(
              children: [
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'سورة ${model.name}',
                      style: GoogleFonts.inter(fontSize: 30),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.play_circle,
                      size: 27,
                      color: Color(0xFF242424),
                    ),
                  ],
                ),
                Divider(indent: 50,endIndent: 50,
                  color: Color(0xFFB7935F),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        verses[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(fontSize: 20),
                      );
                    },
                    itemCount: verses.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadFiles(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.split('/n');
    verses = lines;
    setState(() {});
  }
}
