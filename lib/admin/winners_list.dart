import 'package:flutter/material.dart';

class ListofWinners extends StatelessWidget {
  const ListofWinners({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));
    List<String> winnersimages = [
      "assets/mom.png",
      "assets/happiness.jpg",
      "assets/canoe.png"
    ];
    List<String> medals = [
      "assets/madal 1.png",
      "assets/medal second 1.png",
      "assets/madal 1.png",
    ];
    List<String> winnersname = ["Ayisha",
      "Rayan",
      "Sneha"
    ];
    List<String> wrk = ["Digital Painting",
      "Phography",
      "Phography"
    ];
    List<String> theme = ["Theme:Mom",
      "Theme:happiness",
      "Theme:photography"
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Color(0xff0C8290),
        ),
        title: Text("Winners",
            style: TextStyle(
                fontFamily: "amikosemi",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Container(
                height: height / 12,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff0C8290),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Select Contest",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "amikosemi",
                          fontWeight: FontWeight.normal),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: winnersimages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(blurRadius: 15, color: Colors.grey)
                            ], borderRadius: BorderRadius.circular(10)),
                            height: height / 5,
                            width: width / 3,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(winnersimages[index],
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                medals[index],
                                scale: 15,
                              ),
                              Text(
                                winnersname[index],
                                style: TextStyle(
                                    fontFamily: "amikosemi",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              Text(wrk[index],
                                  style: TextStyle(
                                      fontFamily: "amikosemi",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey)),
                              Text(
                                  theme[index],
                                  style: TextStyle(
                                      fontFamily: "amikosemi",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                          color: Colors.grey,
                          endIndent: 2,
                          indent: 2,
                          thickness: 1),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}