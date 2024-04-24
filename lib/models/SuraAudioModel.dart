class SuraAudioModel {
  SuraAudioModel({
      this.code, 
      this.status, 
      this.data,});

  SuraAudioModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? code;
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.number, 
      this.name, 
      this.englishName, 
      this.englishNameTranslation, 
      this.revelationType, 
      this.numberOfAyahs, 
      this.ayahs, 
      this.edition,});

  Data.fromJson(dynamic json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
    if (json['ayahs'] != null) {
      ayahs = [];
      json['ayahs'].forEach((v) {
        ayahs?.add(Ayahs.fromJson(v));
      });
    }
    edition = json['edition'] != null ? Edition.fromJson(json['edition']) : null;
  }
  num? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  num? numberOfAyahs;
  List<Ayahs>? ayahs;
  Edition? edition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['name'] = name;
    map['englishName'] = englishName;
    map['englishNameTranslation'] = englishNameTranslation;
    map['revelationType'] = revelationType;
    map['numberOfAyahs'] = numberOfAyahs;
    if (ayahs != null) {
      map['ayahs'] = ayahs?.map((v) => v.toJson()).toList();
    }
    if (edition != null) {
      map['edition'] = edition?.toJson();
    }
    return map;
  }

}

class Edition {
  Edition({
      this.identifier, 
      this.language, 
      this.name, 
      this.englishName, 
      this.format, 
      this.type, 
      this.direction,});

  Edition.fromJson(dynamic json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  dynamic direction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = identifier;
    map['language'] = language;
    map['name'] = name;
    map['englishName'] = englishName;
    map['format'] = format;
    map['type'] = type;
    map['direction'] = direction;
    return map;
  }

}

class Ayahs {
  Ayahs({
      this.number, 
      this.audio, 
      this.audioSecondary, 
      this.text, 
      this.numberInSurah, 
      this.juz, 
      this.manzil, 
      this.page, 
      this.ruku, 
      this.hizbQuarter, 
      this.sajda,});

  Ayahs.fromJson(dynamic json) {
    number = json['number'];
    audio = json['audio'];
    audioSecondary = json['audioSecondary'] != null ? json['audioSecondary'].cast<String>() : [];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }
  num? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  num? numberInSurah;
  num? juz;
  num? manzil;
  num? page;
  num? ruku;
  num? hizbQuarter;
  bool? sajda;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['audio'] = audio;
    map['audioSecondary'] = audioSecondary;
    map['text'] = text;
    map['numberInSurah'] = numberInSurah;
    map['juz'] = juz;
    map['manzil'] = manzil;
    map['page'] = page;
    map['ruku'] = ruku;
    map['hizbQuarter'] = hizbQuarter;
    map['sajda'] = sajda;
    return map;
  }

}