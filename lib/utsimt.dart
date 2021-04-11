import 'package:flutter/material.dart';

class Imt extends StatefulWidget {
  @override
  _ImtState createState() => _ImtState();
}

class _ImtState extends State<Imt> {
  var berat = 0, tinggi = 0, nama = "", teks = "";
  double tMeter = 0, hasil = 0, hasil1, hasilL = 0;

  final TextEditingController b = new TextEditingController();
  final TextEditingController t = new TextEditingController();
  final TextEditingController n = new TextEditingController();

  void hitung() {
  setState(() {
    berat = int.parse(b.text);
    tinggi = int.parse(t.text);
    tMeter = tinggi * 0.010;
    nama = n.text;
    hasil = berat / (tMeter * tMeter);
    hasilL = double.parse(hasil.toStringAsFixed(1));
    if (hasil >= 18.5 && hasil < 22.9){
      teks = "$nama, status gizimu adalah Underweight";
    } else if (hasil >= 23 && hasil < 24.9){
      teks = "$nama, status gizimu adalah Normal Range";
    } else if (hasil >= 25 && hasil < 29.9){
      teks = "$nama, status gizimu adalah Overweight";
    } else if (hasil >= 30 && hasil < 34.9){
      teks = "$nama, status gizimu adalah Obese Class 1";
    } else if (hasil >= 35 && hasil < 39.9){
      teks = "$nama, status gizimu adalah Obese Class 2";
    } else if (hasil >= 40){
      teks = "$nama, status gizimu adalah Obese Class 3";
    }
  });
}

void hapus(){
  setState((){
    b.text = "";
    t.text = "";
    n.text = "";
    teks = "";
    berat = 0;
    tinggi = 0;
    hasil = 0;
    hasilL = 0;
  });
}


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("INDEX MASSA TUBUH"),
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new Center(
                    child: new Text(
                  "Hitung IMT",
                  style: new TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold),
                )),
               
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Center(
                    child: new Text(
                      "Hitung Indeks Masa Tubuhmu dengan mengisi formulir di bawah ini:",
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new TextField(
                    controller: n,
                    decoration: new InputDecoration(
                        hintText: "Masukan Nama",
                        labelText: "Nama :",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: b,
                    decoration: new InputDecoration(
                        hintText: "Masukan Berat Badan",
                        labelText: "Berat Badan:",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: t,
                    decoration: new InputDecoration(
                        hintText: "Masukan Tinggi Badan",
                        labelText: "Tinggi Badan:",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Row(
                    children: <Widget>[
                      new RaisedButton(
                        onPressed: hitung,
                        child: new Text("Hitung"),
                        color: Colors.teal.shade500,
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(right: 20.0),
                      ),
                      new RaisedButton(
                          onPressed: hapus,
                          child: new Text("Hapus"),
                          color: Colors.teal.shade500)
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                  child: new Text(
                    "Berat Badan : $berat",
                    style: new TextStyle(fontSize: 17.0),
                  ),
                ),
                new Text(
                  "Tinggi Badan : $tinggi",
                  style: new TextStyle(fontSize: 17.0),
                ),
                new Text(
                  "NIlai IMT : $hasilL",
                  style: new TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Text(
                      "$teks",
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
