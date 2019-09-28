class Pronostic {

  int id;
  String bookmaker;
  String sport;
  String date_match;
  String match_prono;
  String pronostic;
  double cote;
  String explication;
  int resultat;

  Pronostic(int i, String b, String s, String dT, String m, String p, double c, String e, int r) {
    this.id = i;
    this.bookmaker = b;
    this.sport = s;
    this.date_match = dT;
    this.match_prono = m;
    this.pronostic = p;
    this.cote = c;
    this.explication = e;
    this.resultat = r;
  }

  @override
  String toString() {
    return 'Pronostic{"id": "$id", "bookmaker": "$bookmaker", "sport": "$sport", "date_match": "$date_match", "match_prono": "$match_prono", "pronostic": "$pronostic", "cote": "$cote", "explication": "$explication", "resultat": "$resultat"}';
  }

  Pronostic.fromJson(Map<String, dynamic> json)
      : bookmaker = json['bookmaker'],
        sport = json['sport'],
        date_match = json['date_match'],
        match_prono = json['match_prono'],
        pronostic = json['pronostic'],
        cote = json['cote'],
        explication = json['explication'],
        resultat = json['resultat'];

  Map<String, dynamic> toJson() =>
      {
        'bookmaker': bookmaker,
        'sport': sport,
        'date_match': date_match,
        'match_prono': match_prono,
        'pronostic' : pronostic,
        'cote' : cote,
        'explication' : explication,
        'resultat': resultat
      };

}