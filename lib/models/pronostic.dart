class Pronostic {

  String bookmaker;
  String sport;
  String date_match;
  String match_prono;
  String pronostic;
  String cote;
  String explication;

  Pronostic(String b, String s, String dT, String m, String p, String c, String e) {
    this.bookmaker = b;
    this.sport = s;
    this.date_match = dT;
    this.match_prono = m;
    this.pronostic = p;
    this.cote = c;
    this.explication = e;
  }

  @override
  String toString() {
    return 'Pronostic{"bookmaker": "$bookmaker", "sport": "$sport", "date_match": "$date_match", "match_prono": "$match_prono", "pronostic": "$pronostic", "cote": "$cote", "explication": "$explication"}';
  }

  Pronostic.fromJson(Map<String, dynamic> json)
      : bookmaker = json['bookmaker'],
        sport = json['sport'],
        date_match = json['date_match'],
        match_prono = json['match_prono'],
        pronostic = json['pronostic'],
        cote = json['cote'],
        explication = json['explication'];

  Map<String, dynamic> toJson() =>
      {
        'bookmaker': bookmaker,
        'sport': sport,
        'date_match': date_match,
        'match_prono': match_prono,
        'pronostic' : pronostic,
        'cote' : cote,
        'explication' : explication
      };

}