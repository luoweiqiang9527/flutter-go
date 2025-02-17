///
/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/4/28
/// Time: 3:19 PM
/// email: zhu.yan@alibaba-inc.com
///
class Suggestion {
  String query;
  List<Suggestions> suggestions;
  int code;

  Suggestion({this.query, this.suggestions, this.code});

  Suggestion.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    if (json['suggestions'] != null) {
      suggestions = List<Suggestions>();
      json['suggestions'].forEach((v) {
        suggestions.add(Suggestions.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['query'] = query;
    data['suggestions'] = suggestions.map((v) => v.toJson()).toList();
      data['code'] = code;
    return data;
  }
}

class Suggestions {
  Data data;
  String value;

  Suggestions({this.data, this.value});

  Suggestions.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.toJson();
      data['value'] = value;
    return data;
  }
}

class Data {
  String category;

  Data({this.category});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    return data;
  }
}
