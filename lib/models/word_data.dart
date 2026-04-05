class Meaning {
  Meaning(
      {required this.id,
      required this.definition,
      required this.example,
      required this.speechPart,
      required this.synonyms});
  String? id;
  String definition;
  String? example;
  String speechPart;
  List<String> synonyms;
}

class FullInfo {
  FullInfo(
      {required this.word,
      required this.transcript,
      required this.meaning,
      required this.freq,
      required this.examples});
  String word;
  String transcript;
  int freq;
  var meaning = <Meaning>[];
  List<String> examples;
}
