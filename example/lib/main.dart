import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_zip_archive/flutter_zip_archive.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  bool _existZipFile = false;
  static const String zipFileName = '123.zip';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "1234");

    _checkZipFile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("密码："),
                  Expanded(
                      child: TextField(
                    controller: _controller,
                  ))
                ],
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: _selectFile,
                child: Text("压缩"),
              ),
              Visibility(
                visible: _existZipFile,
                child: MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: _unzip,
                  child: Text("解压"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // zipファイルがあるかをチェックする
  void _checkZipFile() {
    Directory _cacheDir = Directory.systemTemp;
    final exist = File("${_cacheDir.path}/$zipFileName").existsSync();
    setState(() {
      _existZipFile = exist;
    });
  }

  Future _selectFile() async {
    XFile? file;
    try {
      file = await ImagePicker().pickImage(source: ImageSource.gallery);
    } catch (e) {
      print(e);
      print('iPhoneシミュレーターだとできないことがある');
      return;
    }

    Directory _cacheDir = Directory.systemTemp;
    if (file == null) {
      return;
    }

    // testフォルダを作ってそこにピックアップした画像を入れる
    final newPath = _cacheDir.path + "/test";
    Directory(newPath).createSync();
    // 画像名取得
    final fileName = file.path.split('/').last;
    File(file.path).copySync(newPath + '/' + fileName);

    // 書き込む前に削除しておく
    if (File(_cacheDir.path + "/$zipFileName").existsSync()) {
      File(_cacheDir.path + "/$zipFileName").deleteSync();
    }

    var _map = await FlutterZipArchive.zip(
        newPath, _cacheDir.path + "/$zipFileName", _controller.text);
    print("_map:" + _map.toString());

    _checkZipFile();
  }

  Future _unzip() async {
    Directory _cacheDir = Directory.systemTemp;
    var _map = await FlutterZipArchive.unzip(
        _cacheDir.path + "/$zipFileName", _cacheDir.path, _controller.text);
    print("_map:" + _map.toString());
  }
}
