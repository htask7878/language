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
  List isLanguageList = [
    true,
    false,
    false,
    false,
    false,
  ];

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
                                              isLanguageList[index] =
                                                  !isLanguageList[index];
                                              lan = languageList[index].name;
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
