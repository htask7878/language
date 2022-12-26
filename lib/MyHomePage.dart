import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Language> languageList = [
    Languages.english,
    Languages.urdu,
    Languages.gujarati,
    Languages.arabic,
    Languages.japanese,
  ];

  String lan = "English";

  // List isLanguageList = List.filled(5, false);
  List isLanguageList = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState1) {
                              return Dialog(
                                child: SizedBox(
                                  height: 400,
                                  child: Column(
                                    children: [
                                      ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return Card(
                                            shape: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
                                            margin: EdgeInsets.all(1),
                                          );
                                        },
                                        shrinkWrap: true,
                                        padding: EdgeInsets.all(10),
                                        itemCount: languageList.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                                "${languageList[index].name}"),
                                            onTap: () {
                                              if (isLanguageList[0] == false) {
                                                isLanguageList = List.filled(5, false);
                                                isLanguageList[index] =
                                                    !isLanguageList[index];
                                              } else if (isLanguageList[1] ==
                                                  false) {
                                                isLanguageList =
                                                    List.filled(5, false);
                                                isLanguageList[1] =
                                                    !isLanguageList[1];
                                              } else if (isLanguageList[2] ==
                                                  false) {
                                                isLanguageList =
                                                    List.filled(5, false);
                                                isLanguageList[2] =
                                                    !isLanguageList[2];
                                              } else if (isLanguageList[3] ==
                                                  false) {
                                                isLanguageList =
                                                    List.filled(5, false);
                                                isLanguageList[3] =
                                                    !isLanguageList[3];
                                              } else if (isLanguageList[4] ==
                                                  false) {
                                                isLanguageList =
                                                    List.filled(5, false);
                                                isLanguageList[4] =
                                                    !isLanguageList[4];
                                              }
                                              // isLanguageList[index] = !isLanguageList[index];
                                              // lan = languageList[index].name;

                                              print(
                                                  "isTrue ===========>>${isLanguageList[index]}");
                                              print("Lan ===========>>$lan");
                                              setState(() {});
                                              setState1(() {});
                                            },
                                            trailing: isLanguageList[index]
                                                ? Icon(
                                                    Icons.check,
                                                    color: Colors.orange,
                                                  )
                                                : null,
                                          );
                                        },
                                      ),
                                      Center(
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward,
                                              color: Colors.orange,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text("Click")),
                const SizedBox(
                  height: 30,
                ),
                Text("${lan}"),
              ],
            ),
          )),
    );
  }
}
