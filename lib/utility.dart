class MyPressed {
  bool pressed = false;
  bool auto;
  Function()? _onPressed;
  Function(void Function())? _setState;
  MyPressed(Function() onPressed, {this.auto = true}){
    _onPressed = onPressed;
  }
  void attach(Function(void Function()) setState){
    _setState = setState;
  }
  void setPressed(bool flag){
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
      setPressed(true);
      _onPressed!();
      if( auto ){
        Future.delayed(const Duration(seconds: 1), (){
          setPressed(false);
        });
      }
    }
  }
}
