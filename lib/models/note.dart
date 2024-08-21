

class Note {
  int? id;
  String titre="";
  String message="";
  DateTime dateTime=DateTime.now();
  bool delete=false;
  
  Note(this.titre, this.message, this.dateTime);
  
  Note.fromJson(Map<dynamic, dynamic> map) {
    id=map["id"];
    titre=map["titre"];
    message=map["message"];
    dateTime=DateTime(
        map["dateTime"]["annee"],
        map["dateTime"]["mois"],
        map["dateTime"]["jour"],
        map["dateTime"]["heure"],
        map["dateTime"]["minutes"],
        map["dateTime"]["secondes"],
    );
  }
}

