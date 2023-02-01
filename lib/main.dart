import 'package:flutter/material.dart';
import 'utility.dart';

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

  ScrollController? scrollController;

  // ボタン連打防止
  late MyPressed _pressed1;
  late MyPressed _pressed2;
  late MyPressed _pressed3;
  late MyPressed _pressed4;
  late MyPressed _pressed5;
  late MyPressed _pressed6;

  @override
  void initState(){
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController!.jumpTo( scrollController!.position.maxScrollExtent );
    });

    // ボタン連打防止
    _pressed1 = MyPressed((){
      // ボタンが押された時の処理
      debugPrint("ボタン1が押された");
    });
    _pressed2 = MyPressed((){
      // ボタンが押された時の処理
      debugPrint("ボタン2が押された");
    });
    _pressed3 = MyPressed((){
      // ボタンが押された時の処理
      debugPrint("ボタン3が押された");
    });
    _pressed4 = MyPressed((){
      // ボタンが押された時の処理
      debugPrint("ボタン4が押された");
    });
    _pressed5 = MyPressed((){
      // ボタンが押された時の処理
      debugPrint("ボタン5が押された");
    });
    _pressed6 = MyPressed((){
      // ボタンが押された時の処理
      debugPrint("ボタン6が押された");
    });
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  // チェックボックス
  bool _checkboxValue = true;
  void _onCheckboxChanged(bool? value) {
    setState(() {
      _checkboxValue = value!;
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
  int _radio1Value = 0;
  void _onRadio1Changed(int? value) {
    setState(() {
      _radio1Value = value!;
    });
  }
  int _radio2Value = 0;
  void _onRadio2Changed(int? value) {
    setState(() {
      _radio2Value = value!;
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
    contentHeight = MediaQuery.of( context ).size.height - MediaQuery.of( context ).padding.top - MediaQuery.of( context ).padding.bottom;

    bool buttonTest    = true;
    bool checkboxTest  = true;
    bool switchTest    = true;
    bool radioTest     = true;
    bool textFieldTest = true;
    bool dropdownTest  = true;
    var body = <Widget>[];
    body.add(
        const SizedBox(height: 10)
    );

    _pressed1.attach(setState);
    _pressed2.attach(setState);
    _pressed3.attach(setState);
    _pressed4.attach(setState);
    _pressed5.attach(setState);
    _pressed6.attach(setState);

    // ボタン
    if( buttonTest ) {
      body.add( Column(children: [
        Row(children: [
          TextButton(
            onPressed: _pressed1.pressed ? null : _pressed1.onPressed,
            child: const Text('TextButton'),
          ),
          const SizedBox(width: 10),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: _pressed2.pressed ? null : _pressed2.onPressed,
            child: const Text('TextButton'),
          ),
          const SizedBox(width: 10),
          const TextButton(
            onPressed: null,
            child: Text('TextButton'),
          )
        ] ),
        Row(children: [
          OutlinedButton(
            onPressed: _pressed3.pressed ? null : _pressed3.onPressed,
            child: const Text('Outlined'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.red,
                backgroundColor: Colors.yellow
            ),
            onPressed: _pressed4.pressed ? null : _pressed4.onPressed,
            child: const Text('Outlined'),
          ),
          const SizedBox(width: 10),
          const OutlinedButton(
            onPressed: null,
            child: Text('Outlined'),
          )
        ] ),
        Row(children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
            ),
            onPressed: _pressed5.pressed ? null : _pressed5.onPressed,
            child: const Text('Elevated'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              onPrimary: Colors.red,
              shadowColor: Colors.orange,
              elevation: 5,
            ),
            onPressed: _pressed6.pressed ? null : _pressed6.onPressed,
            child: const Text('Elevated'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
            ),
            onPressed: null,
            child: const Text('Elevated'),
          )
        ] )
      ] ) );
    }

    // チェックボックス
    if( checkboxTest ) {
      body.add(
          CheckboxListTile(
              title: const Text('チェックボックス'),
              value: _checkboxValue,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: _onCheckboxChanged
          )
      );
    }

    // スイッチ
    if( switchTest ) {
      body.add(
          SwitchListTile(
              title: const Text('スイッチ'),
              value: _switchValue,
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: _onSwitchChanged
          )
      );
    }

    // ラジオボタン
    if( radioTest ) {
      body.add( Column(children: [
        RadioListTile(
            title: const Text('ラジオボタン1'),
            value: 0,
            groupValue: _radio1Value,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: _onRadio1Changed
        ),
        RadioListTile(
            title: const Text('ラジオボタン2'),
            value: 1,
            groupValue: _radio1Value,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: _onRadio1Changed
        ),
        RadioListTile(
            title: const Text('ラジオボタン3'),
            value: 2,
            groupValue: _radio1Value,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: _onRadio1Changed
        ),
        Row(children: [
          Container(width: contentWidth / 3, height: 64, alignment: Alignment.center,
            child: RadioListTile(
                title: Row(children: [ SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset('assets/icon1.png', fit: BoxFit.fill)
                ) ] ),
                value: 0,
                groupValue: _radio2Value,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: _onRadio2Changed
            ),
          ),
          Container(width: contentWidth / 3, height: 64, alignment: Alignment.center,
            child: RadioListTile(
                title: Row(children: [ SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset('assets/icon4.png', fit: BoxFit.fill)
                ) ] ),
                value: 1,
                groupValue: _radio2Value,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: _onRadio2Changed
            ),
          ),
          Container(width: contentWidth / 3, height: 64, alignment: Alignment.center,
            child: RadioListTile(
                title: Row(children: [ SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset('assets/icon5.png', fit: BoxFit.fill)
                ) ] ),
                value: 2,
                groupValue: _radio2Value,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: _onRadio2Changed
            ),
          ),
        ] )
      ] ) );
    }

    // テキスト入力
    if( textFieldTest ) {
      body.add( Column(children: [
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: EdgeInsets.only(left: contentWidth / 40,
                top: 0.0,
                right: contentWidth / 40,
                bottom: 0.0),
            hintText: 'テキストを入力',
          ),
          autocorrect: false,
          keyboardType: TextInputType.text,
          onChanged: _text1Changed,
          onSubmitted: _text1Submitted,
        ),
        Row(children: [
          Padding(padding: EdgeInsets.only(
              top: contentWidth / 80, bottom: contentWidth / 80),
              child: Text("入力中：$_changeText1",
                style: const TextStyle(color: Colors.grey),))
        ] ),
        Row(children: [
          Padding(padding: EdgeInsets.only(
              top: contentWidth / 80, bottom: contentWidth / 80),
              child: Text("入力決定：$_submitText1",
                style: const TextStyle(color: Colors.grey),))
        ] ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: EdgeInsets.only(left: contentWidth / 40,
                top: 0.0,
                right: contentWidth / 40,
                bottom: 0.0),
            hintText: '英数字を入力',
          ),
          autocorrect: false,
          keyboardType: TextInputType.number,
          onChanged: _text2Changed,
          onSubmitted: _text2Submitted,
        ),
        Row(children: [
          Padding(padding: EdgeInsets.only(
              top: contentWidth / 80, bottom: contentWidth / 80),
              child: Text("入力中：$_changeText2",
                style: const TextStyle(color: Colors.grey),))
        ] ),
        Row(children: [
          Padding(padding: EdgeInsets.only(
              top: contentWidth / 80, bottom: contentWidth / 80),
              child: Text("入力決定：$_submitText2",
                style: const TextStyle(color: Colors.grey),))
        ] ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: EdgeInsets.only(left: contentWidth / 40,
                top: 0.0,
                right: contentWidth / 40,
                bottom: 0.0),
            hintText: '伏せ字英数字を入力',
          ),
          autocorrect: false,
          keyboardType: TextInputType.number,
          obscureText: true,
          onChanged: _text3Changed,
          onSubmitted: _text3Submitted,
        ),
        Row(children: [
          Padding(padding: EdgeInsets.only(
              top: contentWidth / 80, bottom: contentWidth / 80),
              child: Text("入力中：$_changeText3",
                style: const TextStyle(color: Colors.grey),))
        ] ),
        Row(children: [
          Padding(padding: EdgeInsets.only(
              top: contentWidth / 80, bottom: contentWidth / 80),
              child: Text("入力決定：$_submitText3",
                style: const TextStyle(color: Colors.grey),))
        ] ),
        const SizedBox(height: 10),
      ] ) );
    }

    // ドロップダウンメニュー
    if( dropdownTest ) {
      body.add( Row( children: [
        SizedBox( width: contentWidth * 0.7, height: contentWidth / 8,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: contentWidth / 40,
                  top: 0.0,
                  right: contentWidth / 40,
                  bottom: 0.0),
              border: const OutlineInputBorder(),
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
      ] ) );
    }

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 0
        ),
        resizeToAvoidBottomInset: false, // 自前で高さ対応する
        body: SingleChildScrollView(
            controller: scrollController,
            reverse: true, // スクロールの向きを逆にする
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of( context ).viewInsets.bottom,
              ),
              child: Column( children: body ),
            )
        )
    );
  }
}
