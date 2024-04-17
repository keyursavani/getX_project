class CountryList {
  int? count;
  List<Entries>? entries;

  CountryList({ count,  entries});

  CountryList.fromJson(dynamic json) {
    count = json['count'];
    if (json['entries'] != null) {
      entries = <Entries>[];
      json['entries'].forEach((v) {
        entries!.add(Entries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final  data = <String, dynamic>{};
    data['count'] =  count;
    if ( entries != null) {
      data['entries'] =  entries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entries {
  String? aPI;
  String? description;
  String? auth;
  bool? hTTPS;
  String? cors;
  String? link;
  String? category;

  Entries(
      { aPI,
         description,
         auth,
         hTTPS,
         cors,
         link,
         category});

  Entries.fromJson(dynamic json) {
    aPI = json['API'];
    description = json['Description'];
    auth = json['Auth'];
    hTTPS = json['HTTPS'];
    cors = json['Cors'];
    link = json['Link'];
    category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['API'] =  aPI;
    data['Description'] =  description;
    data['Auth'] =  auth;
    data['HTTPS'] =  hTTPS;
    data['Cors'] =  cors;
    data['Link'] =  link;
    data['Category'] =  category;
    return data;
  }
}
