import 'package:flutter/material.dart';
import 'package:untitled1/list_app.dart';
import 'package:untitled1/pdf_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset("assets/image/rasm.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Muallif:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                        "   Xamdamova Xanifaxon Shukurillayevna, Jizzax politexnika instituti O‘zbek tili va adabiyoti kafedrasi mudiri filologiya fanlari bo‘yicha falsafa doktori, PhD."),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                        "   Xamdamova Xanifaxon Shukurillayevna, Jizzax politexnika instituti O‘zbek tili va adabiyoti kafedrasi mudiri filologiya fanlari bo‘yicha falsafa doktori, PhD. Ilmiy ish mavzusi <Rustamxon dostoni so‘z boyligi>. Mazkur mavzuga oid 20 ga yaqin ilmiy maqolalar, tezislar hamda 'Rustamxon' dostoni lug‘atlari' nomli tadqiqot-lug‘ati muallifi. Ushbu elektron mobil ilova 'Rustamxon' dostoni lug‘atlari' bo‘lib, undagi ma’lumotlar baxshi-shoir Fozil Yo‘ldosh o‘g‘li kuylagan 'Rustamxon' dostonining 1988 yildagi nashri asosida tayyorlangan. Ilovada, asosan, doston matnidagi so‘zshakllarning qo‘llanish chastotasi o‘z aksini topgan."),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ExampleApp.routName);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    fixedSize: const Size.fromHeight(
                      55,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        32,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Dasturga kirish",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfViewerPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    fixedSize: const Size.fromHeight(
                      55,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        32,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Dostonni o'qish",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
