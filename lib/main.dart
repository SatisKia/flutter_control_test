import 'package:flutter/material.dart';

// ラジオボタンの値
enum RadioValue { hoge, fuga, piyo }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  double contentWidth  = 0.0;
  double contentHeight = 0.0;

  double bottomSpace = 0.0;

  // チェックボックス
  bool _checkBoxValue = true;
  void _onCheckBoxChanged(bool? value) {
    setState(() {
      _checkBoxValue = value!;
    });
  }

  // スイッチ
  bool _switchValue = false;
  void _onSwitchChanged(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  // ラジオボタン
  RadioValue _radioValue = RadioValue.hoge;
  void _onRadioChanged(RadioValue? value) {
    setState(() {
      _radioValue = value!;
    });
  }

  // テキスト入力
  String _changeText1 = '';
  String _submitText1 = '';
  String _changeText2 = '';
  String _submitText2 = '';
  String _changeText3 = '';
  String _submitText3 = '';
  void _text1Changed(String value) {
    setState(() {
      _changeText1 = value;
    });
  }
  void _text1Submitted(String value) {
    setState(() {
      _submitText1 = value;
    });
  }
  void _text2Changed(String value) {
    setState(() {
      _changeText2 = value;
    });
  }
  void _text2Submitted(String value) {
    setState(() {
      _submitText2 = value;
    });
  }
  void _text3Changed(String value) {
    setState(() {
      _changeText3 = value;
    });
  }
  void _text3Submitted(String value) {
    setState(() {
      _submitText3 = value;
    });
  }

  // ドロップダウンメニュー
  final Map<String, String> _dropdownMenu = {
    '0': 'メニュー1',
    '1': 'メニュー2',
    '2': 'メニュー3',
    '3': 'メニュー4',
    '4': 'メニュー5',
    '5': 'メニュー6',
    '6': 'メニュー7',
    '7': 'メニュー8',
    '8': 'メニュー9',
    '9': 'メニュー10',
  };
  String _dropdownValue = '0';
  void _onDropdownChanged(value) {
    setState(() {
      _dropdownValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    contentWidth  = MediaQuery.of( context ).size.width;
    contentHeight = MediaQuery.of( context ).size.height - MediaQuery.of( context ).padding.top;

    bottomSpace = MediaQuery.of( context ).viewInsets.bottom;

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 0
        ),
        resizeToAvoidBottomInset: false, // 自前で高さ対応する
        body: SingleChildScrollView(
            reverse: true, // スクロールの向きを逆にする
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomSpace),
              child: Column( children: [
                // チェックボックス
                CheckboxListTile(
                    title: const Text('チェックボックス'),
                    value: _checkBoxValue,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: _onCheckBoxChanged
                ),

                // スイッチ
                SwitchListTile(
                    title: const Text('スイッチ'),
                    value: _switchValue,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: _onSwitchChanged
                ),

                // ラジオボタン
                RadioListTile(
                    title: const Text('ラジオボタン1'),
                    value: RadioValue.hoge,
                    groupValue: _radioValue,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: _onRadioChanged
                ),
                RadioListTile(
                    title: const Text('ラジオボタン2'),
                    value: RadioValue.fuga,
                    groupValue: _radioValue,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: _onRadioChanged
                ),
                RadioListTile(
                    title: const Text('ラジオボタン3'),
                    value: RadioValue.piyo,
                    groupValue: _radioValue,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: _onRadioChanged
                ),

                // テキスト入力
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(left: contentWidth / 40, top: 0.0, right: contentWidth / 40, bottom: 0.0),
                    hintText: 'テキストを入力',
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  onChanged: _text1Changed,
                  onSubmitted: _text1Submitted,
                ),
                Row( children: [ Padding( padding: EdgeInsets.only(top: contentWidth / 80, bottom: contentWidth / 80), child: Text( "入力中：$_changeText1", style: const TextStyle( color: Color(0xFFFF0000)), ) ) ] ),
                Row( children: [ Padding( padding: EdgeInsets.only(top: contentWidth / 80, bottom: contentWidth / 80), child: Text( "入力決定：$_submitText1", style: const TextStyle( color: Color(0xFFFF0000)), ) ) ] ),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(left: contentWidth / 40, top: 0.0, right: contentWidth / 40, bottom: 0.0),
                    hintText: '英数字を入力',
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  onChanged: _text2Changed,
                  onSubmitted: _text2Submitted,
                ),
                Row( children: [ Padding( padding: EdgeInsets.only(top: contentWidth / 80, bottom: contentWidth / 80), child: Text( "入力中：$_changeText2", style: const TextStyle( color: Color(0xFFFF0000)), ) ) ] ),
                Row( children: [ Padding( padding: EdgeInsets.only(top: contentWidth / 80, bottom: contentWidth / 80), child: Text( "入力決定：$_submitText2", style: const TextStyle( color: Color(0xFFFF0000)), ) ) ] ),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(left: contentWidth / 40, top: 0.0, right: contentWidth / 40, bottom: 0.0),
                    hintText: '伏せ字英数字を入力',
                  ),
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  onChanged: _text3Changed,
                  onSubmitted: _text3Submitted,
                ),
                Row( children: [ Padding( padding: EdgeInsets.only(top: contentWidth / 80, bottom: contentWidth / 80), child: Text( "入力中：$_changeText3", style: const TextStyle( color: Color(0xFFFF0000)), ) ) ] ),
                Row( children: [ Padding( padding: EdgeInsets.only(top: contentWidth / 80, bottom: contentWidth / 80), child: Text( "入力決定：$_submitText3", style: const TextStyle( color: Color(0xFFFF0000)), ) ) ] ),

                Row( children: [
                  // ドロップダウンメニュー
                  SizedBox(
                    width: contentWidth * 0.7,
                    height: contentWidth / 8,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: contentWidth / 40, top: 0.0, right: contentWidth / 40, bottom: 0.0),
                        enabledBorder: const OutlineInputBorder(),
                      ),
                      items: _dropdownMenu.entries.map((entry) {
                        return DropdownMenuItem(
                          child: Text(entry.value),
                          value: entry.key,
                        );
                      }).toList(),
                      value: _dropdownValue,
                      onChanged: _onDropdownChanged,
                    ),
                  ),
                ] ),
              ] ),
            )
        )
    );
  }
}
