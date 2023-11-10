mixin MixinApp {
  static const String _textError = "*Campo obrigatório!";

  String? validator(value) {
    if (value == "") {
      return _textError;
    }
    return null;
  }
}
