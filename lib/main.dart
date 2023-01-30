import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final formKey = GlobalKey<FormState>();
void main() => runApp(ana_kisim());

class ana_kisim extends StatefulWidget {
  const ana_kisim({Key? key}) : super(key: key);
  @override
  State<ana_kisim> createState() => _ana_kisimState();
}

class _ana_kisimState extends State<ana_kisim> {
  //////////////////////////
  int index = 0;
  final sayfalar = [
    hayvalarsayfa(),
    turlersayfa(),
    hastaliklarsayfa(),
  ];
  /////////////////////////
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'Ana Sayfa': (_) => hayvalarsayfa(),
      },
      home: Scaffold(
        appBar: ustbar(),
        body: sayfalar[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.purpleAccent.shade100,
          ),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.purple,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(milliseconds: 400),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.pets), label: "Hayvanlarım"),
              NavigationDestination(
                  icon: Icon(Icons.info_outline_rounded), label: "Türler"),
              NavigationDestination(
                  icon: Icon(Icons.medical_information_outlined),
                  label: "Hastalıklar"),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
//   Sayfalar                               ///
///////////////////////////////////////////////

class hayvalarsayfa extends StatefulWidget {
  const hayvalarsayfa({Key? key}) : super(key: key);

  @override
  State<hayvalarsayfa> createState() => _hayvalarsayfaState();
}

class _hayvalarsayfaState extends State<hayvalarsayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: arkaplan_tarzi(),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton.extended(
              icon: Icon(Icons.add, color: Colors.black),
              label: Text(
                "Ekle",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.black12.withOpacity(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => formsayfa(),
                  ),
                );
              })
        ]),
      ),
    );
  }
}

class formsayfa extends StatefulWidget {
  const formsayfa({Key? key}) : super(key: key);

  @override
  State<formsayfa> createState() => _formsayfaState();
}

class _formsayfaState extends State<formsayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.purpleAccent,
                    Colors.blueAccent,
                  ],
                ),
              ),
              height: 250,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset(
                        "images/pati.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 20),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Evcil Hayvan Kaydı",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black12,
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: Colors.white10,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.pets,
                    color: Colors.purple,
                  ),
                  hintText: "İsim Giriniz",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black12,
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: Colors.white10,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.pets,
                    color: Colors.purple,
                  ),
                  hintText: "Yaş Giriniz",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black12,
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: Colors.white10,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.pets,
                    color: Colors.purple,
                  ),
                  hintText: "Türü Giriniz",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                width: 50,
                height: 50,
                color: Colors.white10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class turlersayfa extends StatefulWidget {
  const turlersayfa({Key? key}) : super(key: key);

  @override
  State<turlersayfa> createState() => _turlersayfaState();
}

class _turlersayfaState extends State<turlersayfa> {
  List<String> turlerkedi = [
    "Ankara Kedisi",
    "Burmese",
    "Bengal Kedisi",
    "Cymric",
    "Devon Rex",
  ];
  List<String> turlerkedi_resim = [
    'images/ankara_kedis.jpg',
    'images/burmese.jpg',
    'images/bengal.jpg',
    'images/cymric.jpg',
    'images/devon_rex.jpg',
  ];
  List turlerkedi_sayfalar = [
    Ankara_kedisi(),
    Burmese(),
    Bengal_kedisi(),
    Cyrimc(),
    Devon_Rex(),
  ];

  List<String> turlerkopek = [
    "American Bully",
    "Alaska Kurdu",
    "Beagle",
    "Cane Corsa",
    "Doberman",
  ];
  List<String> turlerkopek_resim = [
    'images/american_bully.jpg',
    'images/alaksakurdu.jpg',
    'images/beagla.jpg',
    'images/canecorsa.jpg',
    'images/doberman.jpg',
  ];
  List turlerkopek_sayfa = [
    American_Bully(),
    Alaska_Kurdu(),
    Beagle(),
    Cane_Corsa(),
    Doberman(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: arkaplan_tarzi(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Center(
            child: Text(
              "Kedi Türleri",
              style: yazi_tarzi(),
            ),
          )),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Center(
              child: Container(
                color: Colors.transparent.withOpacity(0.5),
                height: 110,
                width: 300,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(),
                      SizedBox(),
                      CircleAvatar(
                        backgroundImage: AssetImage(turlerkedi_resim[index]),
                        radius: 25,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => turlerkedi_sayfalar[index],
                            ),
                          );
                        },
                        child: Text(
                          "${turlerkedi[index]}",
                          style: yazi_tarzi_15(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }, childCount: turlerkedi.length)),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Center(
            child: Text(
              "Kopek Türleri",
              style: yazi_tarzi(),
            ),
          )),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Center(
              child: Container(
                color: Colors.transparent.withOpacity(0.5),
                height: 110,
                width: 300,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(),
                      CircleAvatar(
                        backgroundImage: AssetImage(turlerkopek_resim[index]),
                        radius: 25,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => turlerkopek_sayfa[index],
                            ),
                          );
                        },
                        child: Text(
                          "${turlerkopek[index]}",
                          style: yazi_tarzi_15(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }, childCount: turlerkopek.length)),
        ],
      ),
    );
  }
}

class hastaliklarsayfa extends StatefulWidget {
  const hastaliklarsayfa({Key? key}) : super(key: key);

  @override
  State<hastaliklarsayfa> createState() => _hastaliklarsayfaState();
}

class _hastaliklarsayfaState extends State<hastaliklarsayfa> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: arkaplan_tarzi(),
        child: Center(
          child: Column(
            children: [
             const SizedBox(
                height: 10,
              ),
              Text("1-OBEZİTE", style: yazi_tarzi()),
              Text(
                "Sadece insanları değil ö"
                "zellikle kedi ve köpekleri de olumsuz etkileyen ve en yaygın hastalık obezitedir. Aşırı kilolu hayvanlarda kalpten diyabete, erken yaşta ölümden artrite kadar pek çok sorunun temelinde obezite yatar. Ucuz mamalar, günlük hareketliliğin azalması, egzersiz yeterliliği ve düzensiz beslenme aşırı kilo sorununu da beraberinde getirir.",
                style: yazi_tarzi_15(),
              ),
             const SizedBox(
                height: 10,
              ),
             const SizedBox(
                height: 10,
              ),
              Text("2-Kalp Kurdu", style: yazi_tarzi()),
              Text(
                "Sivrisineklerden evcil hayvanlara bulaşan bu hastalık, en çok köpeklerde görülür. Erken teşhisle etkili ve kalıcı bir tedavinin uygulanabildiği soruna kedilerin yakalanması halinde tedavi şansının olmadığı bilinmelidir. Kedilerin bu hastalıktan korunmasının tek yolu ayda bir kez kullanılacak koruyucu ilaçlardır.",
                style: yazi_tarzi_15(),
              ),
             const SizedBox(
                height: 10,
              ),
             const SizedBox(
                height: 10,
              ),
              Text("3- Kedi ve köpeklerde diş sorunları", style: yazi_tarzi()),
              Text(
                "Diş temizliği evcil hayvanlar için de en az insanlar kadar önemlidir. Diş eti hastalıklarının ve diş çürüklerinin nedeni olarak gösterilebilecek olan tartar, kalp ve böbrek sorunlarının da en önemli sebebidir. Diş fırçalama rutininin oluşturulabilmesi pek çok sorunun oluşmadan önlenmesini sağlar.",
                style: yazi_tarzi_15(),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////
//  Hayvan Sayfaları                        ///
///////////////////////////////////////////////

class Ankara_kedisi extends StatelessWidget {
  const Ankara_kedisi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/ankara_kedis.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Ankara kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Ankara kedisi dünyanın adeta dört bir yanından kabul gören ve evcil hayvan arayışı içerisinde olanların hem çok fazla ilgi duyduğu hem de en sevdikleri kedilerden bir tanesidir. Bir Türk kedisi olan Ankara kedilerinin kökeni Anadolu’dan gelmektedir. Çok uzun tüylü bir kedi ırkıdır ve uzun tüylü kedilerin atası olarak da bilinmektedir. Eğer oyuncu, hareketli bir kedi arayışı içerisindeyseniz ve evinizde sürekli gezinen minik bir canlı görmeyi istiyorsanız seçiminizi Ankara kedisinden yana rahatlıkla yapabilirsiniz.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Burmese extends StatelessWidget {
  const Burmese({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/burmese.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Burmese Kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Yaramazlıkları ve zekâlarıyla ön plana çıkan Burmese kediler oyuncu ve zeki kedi ırkında sınıflandırılırlar. Hatta bu kediler en yaramaz kediler listesi yapılırsa mutlaka ilk sırada yer alırlar. Eğer evinizde bu kedi ile yaşayacaksanız değerli eşyalarınızı ondan uzak tutmalısınız çünkü istemeden de olsa zarar vereceklerdir. Zeki olmaları nedeniyle oyunlara ve aktivitelere kısa sürede adapte olan Burmalar, kendisi gibi oyuncu olan çocuklarla çok iyi anlaşır ve sıkı bağ kurarlar.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bengal_kedisi extends StatelessWidget {
  const Bengal_kedisi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/bengal.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Bengal kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kabul edelim ki Bengal cinsi kediler tıpkı vahşi bir kedi gibi görünürler. Ancak dünya üzerinde milyonlarca kedi severin bu cinste bir kedinin herhangi bir evcil kedi kadar sevimli olduğunu söylediği de bir gerçektir. Sahiplerine karşı son derece sadık bir tür olan Bengaller, güçlü zekâlarıyla da fazlasıyla meraklı, tam bir oyun sever, enerjik ve girişken kedilerdir. Kedi forumlarında pek çok Bengal hayranlarının, Bengal cinsi kedilerinin kişilikleri ve eğlenceli tuhaflıkları hakkında övündüklerine rastlayabiliriz. Bengaller, bulunduğu ortamı benimseyen, sahipleriyle güçlü bir sevgi ve sadakat bağları kuran özel bir türdür. Bu özellikleri onları ilk defa kedi besleyecek olan kişilerin gözünde de değerli kılmaktadır. Bengaller, ihtiyaç duydukları ilgi ve sevgiyi sahiplerinden gördüğü takdirde son derece sadık, sevecen ve oyun oynamayı seven iyi bir arkadaş olurlar.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Cyrimc extends StatelessWidget {
  const Cyrimc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/cymric.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Cymric kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kabul edelim ki Bengal cinsi kediler tıpkı vahşi bir kedi gibi görünürler. Ancak dünya üzerinde milyonlarca kedi severin bu cinste bir kedinin herhangi bir evcil kedi kadar sevimli olduğunu söylediği de bir gerçektir. Sahiplerine karşı son derece sadık bir tür olan Bengaller, güçlü zekâlarıyla da fazlasıyla meraklı, tam bir oyun sever, enerjik ve girişken kedilerdir. Kedi forumlarında pek çok Bengal hayranlarının, Bengal cinsi kedilerinin kişilikleri ve eğlenceli tuhaflıkları hakkında övündüklerine rastlayabiliriz. Bengaller, bulunduğu ortamı benimseyen, sahipleriyle güçlü bir sevgi ve sadakat bağları kuran özel bir türdür. Bu özellikleri onları ilk defa kedi besleyecek olan kişilerin gözünde de değerli kılmaktadır. Bengaller, ihtiyaç duydukları ilgi ve sevgiyi sahiplerinden gördüğü takdirde son derece sadık, sevecen ve oyun oynamayı seven iyi bir arkadaş olurlar.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Devon_Rex extends StatelessWidget {
  const Devon_Rex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/devon_rex.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Devon Rex kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kabul edelim ki Bengal cinsi kediler tıpkı vahşi bir kedi gibi görünürler. Ancak dünya üzerinde milyonlarca kedi severin bu cinste bir kedinin herhangi bir evcil kedi kadar sevimli olduğunu söylediği de bir gerçektir. Sahiplerine karşı son derece sadık bir tür olan Bengaller, güçlü zekâlarıyla da fazlasıyla meraklı, tam bir oyun sever, enerjik ve girişken kedilerdir. Kedi forumlarında pek çok Bengal hayranlarının, Bengal cinsi kedilerinin kişilikleri ve eğlenceli tuhaflıkları hakkında övündüklerine rastlayabiliriz. Bengaller, bulunduğu ortamı benimseyen, sahipleriyle güçlü bir sevgi ve sadakat bağları kuran özel bir türdür. Bu özellikleri onları ilk defa kedi besleyecek olan kişilerin gözünde de değerli kılmaktadır. Bengaller, ihtiyaç duydukları ilgi ve sevgiyi sahiplerinden gördüğü takdirde son derece sadık, sevecen ve oyun oynamayı seven iyi bir arkadaş olurlar.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class American_Bully extends StatelessWidget {
  const American_Bully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/devon_rex.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Devon Rex kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kabul edelim ki Bengal cinsi kediler tıpkı vahşi bir kedi gibi görünürler. Ancak dünya üzerinde milyonlarca kedi severin bu cinste bir kedinin herhangi bir evcil kedi kadar sevimli olduğunu söylediği de bir gerçektir. Sahiplerine karşı son derece sadık bir tür olan Bengaller, güçlü zekâlarıyla da fazlasıyla meraklı, tam bir oyun sever, enerjik ve girişken kedilerdir. Kedi forumlarında pek çok Bengal hayranlarının, Bengal cinsi kedilerinin kişilikleri ve eğlenceli tuhaflıkları hakkında övündüklerine rastlayabiliriz. Bengaller, bulunduğu ortamı benimseyen, sahipleriyle güçlü bir sevgi ve sadakat bağları kuran özel bir türdür. Bu özellikleri onları ilk defa kedi besleyecek olan kişilerin gözünde de değerli kılmaktadır. Bengaller, ihtiyaç duydukları ilgi ve sevgiyi sahiplerinden gördüğü takdirde son derece sadık, sevecen ve oyun oynamayı seven iyi bir arkadaş olurlar.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Alaska_Kurdu extends StatelessWidget {
  const Alaska_Kurdu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/devon_rex.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Devon Rex kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kabul edelim ki Bengal cinsi kediler tıpkı vahşi bir kedi gibi görünürler. Ancak dünya üzerinde milyonlarca kedi severin bu cinste bir kedinin herhangi bir evcil kedi kadar sevimli olduğunu söylediği de bir gerçektir. Sahiplerine karşı son derece sadık bir tür olan Bengaller, güçlü zekâlarıyla da fazlasıyla meraklı, tam bir oyun sever, enerjik ve girişken kedilerdir. Kedi forumlarında pek çok Bengal hayranlarının, Bengal cinsi kedilerinin kişilikleri ve eğlenceli tuhaflıkları hakkında övündüklerine rastlayabiliriz. Bengaller, bulunduğu ortamı benimseyen, sahipleriyle güçlü bir sevgi ve sadakat bağları kuran özel bir türdür. Bu özellikleri onları ilk defa kedi besleyecek olan kişilerin gözünde de değerli kılmaktadır. Bengaller, ihtiyaç duydukları ilgi ve sevgiyi sahiplerinden gördüğü takdirde son derece sadık, sevecen ve oyun oynamayı seven iyi bir arkadaş olurlar.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Beagle extends StatelessWidget {
  const Beagle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/devon_rex.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Devon Rex kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kabul edelim ki Bengal cinsi kediler tıpkı vahşi bir kedi gibi görünürler. Ancak dünya üzerinde milyonlarca kedi severin bu cinste bir kedinin herhangi bir evcil kedi kadar sevimli olduğunu söylediği de bir gerçektir. Sahiplerine karşı son derece sadık bir tür olan Bengaller, güçlü zekâlarıyla da fazlasıyla meraklı, tam bir oyun sever, enerjik ve girişken kedilerdir. Kedi forumlarında pek çok Bengal hayranlarının, Bengal cinsi kedilerinin kişilikleri ve eğlenceli tuhaflıkları hakkında övündüklerine rastlayabiliriz. Bengaller, bulunduğu ortamı benimseyen, sahipleriyle güçlü bir sevgi ve sadakat bağları kuran özel bir türdür. Bu özellikleri onları ilk defa kedi besleyecek olan kişilerin gözünde de değerli kılmaktadır. Bengaller, ihtiyaç duydukları ilgi ve sevgiyi sahiplerinden gördüğü takdirde son derece sadık, sevecen ve oyun oynamayı seven iyi bir arkadaş olurlar.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Cane_Corsa extends StatelessWidget {
  const Cane_Corsa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/devon_rex.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Devon Rex kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kabul edelim ki Bengal cinsi kediler tıpkı vahşi bir kedi gibi görünürler. Ancak dünya üzerinde milyonlarca kedi severin bu cinste bir kedinin herhangi bir evcil kedi kadar sevimli olduğunu söylediği de bir gerçektir. Sahiplerine karşı son derece sadık bir tür olan Bengaller, güçlü zekâlarıyla da fazlasıyla meraklı, tam bir oyun sever, enerjik ve girişken kedilerdir. Kedi forumlarında pek çok Bengal hayranlarının, Bengal cinsi kedilerinin kişilikleri ve eğlenceli tuhaflıkları hakkında övündüklerine rastlayabiliriz. Bengaller, bulunduğu ortamı benimseyen, sahipleriyle güçlü bir sevgi ve sadakat bağları kuran özel bir türdür. Bu özellikleri onları ilk defa kedi besleyecek olan kişilerin gözünde de değerli kılmaktadır. Bengaller, ihtiyaç duydukları ilgi ve sevgiyi sahiplerinden gördüğü takdirde son derece sadık, sevecen ve oyun oynamayı seven iyi bir arkadaş olurlar.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Doberman extends StatelessWidget {
  const Doberman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ustbar(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.purpleAccent],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 225,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/devon_rex.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Devon Rex kedisi",
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    "Özellikleri",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Kabul edelim ki Bengal cinsi kediler tıpkı vahşi bir kedi gibi görünürler. Ancak dünya üzerinde milyonlarca kedi severin bu cinste bir kedinin herhangi bir evcil kedi kadar sevimli olduğunu söylediği de bir gerçektir. Sahiplerine karşı son derece sadık bir tür olan Bengaller, güçlü zekâlarıyla da fazlasıyla meraklı, tam bir oyun sever, enerjik ve girişken kedilerdir. Kedi forumlarında pek çok Bengal hayranlarının, Bengal cinsi kedilerinin kişilikleri ve eğlenceli tuhaflıkları hakkında övündüklerine rastlayabiliriz. Bengaller, bulunduğu ortamı benimseyen, sahipleriyle güçlü bir sevgi ve sadakat bağları kuran özel bir türdür. Bu özellikleri onları ilk defa kedi besleyecek olan kişilerin gözünde de değerli kılmaktadır. Bengaller, ihtiyaç duydukları ilgi ve sevgiyi sahiplerinden gördüğü takdirde son derece sadık, sevecen ve oyun oynamayı seven iyi bir arkadaş olurlar.",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.purple,
            elevation: 10.0,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Yaramazlık",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Dost Canlısı",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Bakım",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////
//  Hazır Planlar                           ///
///////////////////////////////////////////////

AppBar ustbar() {
  return AppBar(
      elevation: 0,
      toolbarHeight: 60,
      title: Text(
        "Mavi Pati",
        style: yazi_tarzi(),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [(Colors.blueAccent), (Colors.lightBlue)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark);
}

TextStyle yazi_tarzi() {
  return const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}

TextStyle yazi_tarzi_15() {
  return const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}

BoxDecoration arkaplan_tarzi() {
  return const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.purpleAccent,
          Colors.blueAccent,
        ]),
  );
}
