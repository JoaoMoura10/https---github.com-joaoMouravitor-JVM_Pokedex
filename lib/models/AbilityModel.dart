//Criando model das habilidades e seus atributos
class Ability {
  int id;
  String name;

  //fazendo a conversão dos dados
  Ability.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}