class User {

final String nom;
final String password;
User({
  required this.nom,
  required this.password
});

Map<String,dynamic> toJson(){
  return {
    "nom":this.nom,
    "password":this.password,
  };
}
factory User.fromJson(Map<String,dynamic> json){
  return User(nom: json['nom'], password:json['password']);
}

}