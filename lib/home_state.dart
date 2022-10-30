import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'data.dart';

class HomeState extends State<Home> {
  var _totalquestion = questions.length;
  var _questionIndex = 0;
  String? answer;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xFF018A31),
              statusBarIconBrightness: Brightness.light),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF018A31),
              size: 40,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            titletext[_questionIndex],
            style: Theme.of(context).textTheme.headline3,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 5,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFF018A31), width: 1.5),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: _questionIndex < questions.length
              ? Column(
                  children: [
                    Container(child: SizedBox(height: 10)),
                    Container(
                      child: Row(
                        children: const [
                          Expanded(flex: 2, child: SizedBox.shrink()),
                          Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.fastfood_rounded,
                                size: 25,
                                color: Color(0xFF7A2A20),
                              )),
                          Expanded(
                              flex: 1,
                              child: Icon(Icons.directions_car_filled_rounded,
                                  size: 25, color: Color(0xFFDC7F31))),
                          Expanded(
                              flex: 1,
                              child: Icon(Icons.checkroom_rounded,
                                  size: 25, color: Color(0xFFFA0087))),
                          Expanded(
                              flex: 1,
                              child: Icon(Icons.shopping_bag_rounded,
                                  size: 25, color: Color(0xFFD9B5E7))),
                          Expanded(flex: 2, child: SizedBox.shrink())
                        ],
                      ),
                    ),
                    Container(child: SizedBox(height: 10)),
                    Container(
                        child: Row(children: [
                          Expanded(flex: 1, child: SizedBox.shrink()),
                      Expanded(
                        flex: 2,
                          child: LinearProgressIndicator(
                        backgroundColor: Color(0xFFBBBBBB),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF008C31)),
                        value: _questionIndex.toDouble() / _totalquestion,
                        minHeight: 3,
                      )),
                          Expanded(flex: 1, child: SizedBox.shrink())
                    ])),
                    Container(child: SizedBox(height: 20)),
                    Text(
                      questions[_questionIndex],
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    buildRadio(context, options[_questionIndex][0]),
                    buildRadio(context, options[_questionIndex][1]),
                    buildRadio(context, options[_questionIndex][2]),
                    buildRadio(context, options[_questionIndex][3]),
                    Container(
                        child: Expanded(
                            child: Image.asset(
                                'image/images$_questionIndex.jpg',
                                fit: BoxFit.fill)))
                  ],
                )
              : Container(child: const Text("result"))
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
              Expanded(
                  flex: 10,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF008C31),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ))),
              const Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
              Expanded(
                  flex: 3,
                  child: TextButton(
                    onPressed: _answerQuestion,
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFC2F2D3),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    child: const Icon(Icons.arrow_forward_sharp,
                        color: Color(0xFF018A31), size: 40),
                  )),
              const Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
            ],
          ),
        ));
  }

  RadioListTile<String> buildRadio(BuildContext context, String options) {
    return RadioListTile(
      title: Text(options, style: Theme.of(context).textTheme.headline2),
      value: options,
      groupValue: answer,
      activeColor: const Color(0xFF018A31),
      onChanged: (value) {
        setState(() {
          answer = value.toString();
        });
      },
    );
  }
}
