class MyPressed {
  bool pressed = false;
  Function()? _onPressed;
  Function(void Function())? _setState;
  MyPressed(Function() onPressed){
    _onPressed = onPressed;
  }
  void attach(Function(void Function()) setState){
    _setState = setState;
  }
  void _setPressed(bool flag){
    if( _setState != null ){
      _setState!((){
        pressed = flag;
      });
    } else {
      pressed = flag;
    }
  }
  void onPressed(){
    if( !pressed ){
      _setPressed(true);
      _onPressed!();
      Future.delayed(const Duration(seconds: 1), (){
        _setPressed(false);
      });
    }
  }
}
