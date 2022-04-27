class Type {
  int id;
  String name;

//fazendo a conversão dos dados
  Type.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}