import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TipCalculator(),
  ));
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  double bill = 0;
  int personCount = 1;
  int tipPercentage = 0;

  @override
  Widget build(BuildContext context) {

    calPerPersonbill(double bill,int personCount,int tipPercentage)
    {
      var perPersonBill = 0.0;
      if( bill < 0 || bill == 0 )
        return 0;
      perPersonBill = bill + (bill*tipPercentage)/100;
      return perPersonBill/personCount;
    }


    calculateTip(double bill,int tipPercentage)
    {
      var tip=0.0;
      if(bill<0 || bill==0)
        return tip;
      tip = (bill*tipPercentage)/100;
      return tip;
    }



    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),

          ///vvv imp self adjustable padding using MediaQuery
          child: ListView(
            ///vvv imp to create a scrolling list on device
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(23),
            children: <Widget>[
              Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Bill Per Person",style:TextStyle(fontSize: 24,)),
                    SizedBox(height: 20,),
                    Text("\$${calPerPersonbill(bill,personCount,tipPercentage).ceil()}",style: TextStyle(fontSize: 30,)),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 150,
                margin: EdgeInsets.only(
                  top: 20,
                  left: 3,
                  right: 3,
                ),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          prefixText: "bill amount ",
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        try {
                          setState(() {
                              bill = double.parse(value);                    
                                                    });
                        } catch (exception) {
                          setState(() {
                              bill = double.parse(value);                    
                                                    });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Split",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (personCount > 1)
                                    personCount--;
                                  else
                                    personCount = personCount;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text("-",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "$personCount",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  personCount = personCount + 1;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text("+",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Tip",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$${calculateTip(bill,tipPercentage)}", ////vvvv imp!!! all codes are running parallely :)
                          style: TextStyle(fontSize: 20),         //non blocking codes...
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("$tipPercentage %",style: TextStyle(fontSize: 21,)),
                        SizedBox(
                          height: 20,
                        ),
                    Slider(
                          activeColor: Colors.cyan,
                          min: 0,
                          max: 100,
                          value: tipPercentage.toDouble(),
                          onChanged: (double val) {
                            setState(() {
                              tipPercentage = val.round().toInt();
                            });
                          },
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
