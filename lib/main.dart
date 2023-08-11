import 'package:flutter/material.dart';
void main()=>runApp( const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   // primarySwatch: Colors.green,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstNum=0;
  int  secondNum=0;
  String texttodisplay="";
  String  res="";
  String  operator="";

  void btnclicked(String btnval) {
    if (btnval == "CLEAR") {
      texttodisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = "";
      // operator = "";
    } else if (btnval == '+' || btnval == '-' || btnval == '*' || btnval == '/') {
      firstNum = int.parse(texttodisplay);
      res = "";
      operator = btnval;
    } else if (btnval == "=") {
      secondNum = int.parse(texttodisplay);
      if (operator == '+') {
        res = (firstNum + secondNum).toString();
      } else if (operator == '-') {
        res = (firstNum - secondNum).toString();
      } else if (operator == 'x') {
        res = (firstNum * secondNum).toString();
      } else if (operator == '/') {
        res = (firstNum / secondNum).toString();
      }
      texttodisplay = res; // Update texttodisplay with the result
      firstNum = 0; // Reset first_num for the next calculation
      secondNum = 0; // Reset second_num for the next calculation
      operator = ""; // Reset operator for the next calculation
    } else {
      res = int.parse(texttodisplay + btnval).toString();
      texttodisplay = res; // Update texttodisplay with the new input
    }
    setState(() {});
  }


  Widget custombtn(String btnval)
  {
    return Expanded(
        child: MaterialButton(
          color: Colors.black,
          padding: const EdgeInsets.all(20),
          onPressed: ()=>btnclicked(btnval),
          child: Text("$btnval",style: const TextStyle(color: Colors.white,),
        ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.calculate,size: 30,),

        title: const Text('CALCULATOR',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 30),) ,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$texttodisplay",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w500),
                  ),
                )),
            Row(
              children: <Widget> [
                custombtn("1"),
                custombtn("2"),
                custombtn("3"),
              ],
            ),

            Row(
              children: <Widget> [
                custombtn("4"),
                custombtn("5"),
                custombtn("6"),
              ],
            ),

            Row(
              children: <Widget> [
                custombtn("7"),
                custombtn("8"),
                custombtn("9"),
              ],
            ),


            Row(
              children: <Widget> [
                custombtn("+"),
                custombtn("0"),
                custombtn("-"),
              ],
            ),

            Row(
              children: <Widget> [
                custombtn("x"),
                custombtn("/"),
                custombtn("="),
              ],
            ),

            Row(
              children: <Widget> [
                custombtn("CLEAR"),
                custombtn("DEL")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

