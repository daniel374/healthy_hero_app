class Receta {
  int _id;
  String _descripcion;
  String _nombre;
  int _likes;

  // constructor for
  Receta(this._id, this._descripcion, this._nombre, this._likes);
  //setters

  set id(int id){
    this._id = id;
  }

  set nombre(String nombre){
    this._nombre = nombre;
  }

  set descripcion(String descripcion){
    this._descripcion = descripcion;
  }

  set likes(int likes){
    this._likes = likes;
  }

  //getters
  int get id => this._id;
  String get nombre => this._nombre;
  String get descripcion => this._descripcion;
  int get likes => this._likes;

}