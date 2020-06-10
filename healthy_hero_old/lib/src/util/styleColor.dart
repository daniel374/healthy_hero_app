class StyleColor {

  static hexColor(String colorHexCode) {
    String colornew = '0xff' + colorHexCode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

}