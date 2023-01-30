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
    ilaclarsayfa(),
  ];
  final ustbarlar = [];
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
              NavigationDestination(
                  icon: Icon(Icons.medical_services_outlined),
                  label: "İlaçlar"),
            ],
          ),
        ),
        /*
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push (context,
                MaterialPageRoute( builder: (context) => formsayfa(),
                ));
            }),
*/
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
              icon: Icon(Icons.add),
              label: Text("Ekle"),
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
      body: Container(
        decoration: arkaplan_tarzi(),
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
  List turlerkedi_resim = [
    Image.asset('images/ankara_kedis.jpg'),
    Image.asset('images/burmese.jpg'),
    Image.asset('images/bengal.jpg'),
    Image.asset('images/cymric.jpg'),
    Image.asset('images/devon_rex.jpg'),
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
  List turlerkopek_resim = [
    Image.asset('american_bully.jpg'),
    Image.asset('alaksakurdu.jpg'),
    Image.asset('beagla.jpg'),
    Image.asset('canecorsa.jpg'),
    Image.asset('doberman.jpg'),
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
            child: Text(
              "Kedi Türleri",
              style: yazi_tarzi(),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  width: 50,
                  height: 100,
                  color: Colors.white10.withOpacity(0.40),
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
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
                  ),
                );

              }, childCount: turlerkopek.length)),
          SliverToBoxAdapter(
            child: Text(
              "Kopek Türleri",
              style: yazi_tarzi(),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                    width: 50,
                    height: 100,
                    color: Colors.white10.withOpacity(0.40),
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
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
    return Container(
      decoration: arkaplan_tarzi(),
    );
  }
}

class ilaclarsayfa extends StatefulWidget {
  const ilaclarsayfa({Key? key}) : super(key: key);

  @override
  State<ilaclarsayfa> createState() => _ilaclarsayfaState();
}

class _ilaclarsayfaState extends State<ilaclarsayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: arkaplan_tarzi(),
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
                      backgroundImage: AssetImage("images/ankara_kedis.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "Ankara kedisi",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.black),
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
                    style : TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin:
            EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
              height: 200,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/burmese.jpg"),
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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
              height: 300,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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
              height: 300,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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
              height: 300,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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
              height: 300,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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
              height: 300,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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
              height: 300,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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
              height: 300,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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
              height: 300,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75.0,
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      "sa",
                      style:
                      TextStyle(fontSize: 22.0, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
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
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bilgiler"),
                ],
              ),
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

class ustbarsliver extends StatefulWidget {
  const ustbarsliver({Key? key}) : super(key: key);

  @override
  State<ustbarsliver> createState() => _ustbarsliverState();
}

class _ustbarsliverState extends State<ustbarsliver> {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blueAccent,
      title: Text("Mavi Pati"),
    );
  }
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
