
class NewsDetailsModel {
  NewsDetailsModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  NewsDetailsModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
    int? id,
    String? title,
    String? summary,
    String? description,
    List<String>? image,
    String? date,
    String? newsSubcategory,
    String? newsCategory,
    String? newsCategoryslug,
    String? reporterName,
    int? viewers,
    List<Comments>? comments,}){
    _id = id;
    _title = title;
    _summary = summary;
    _description = description;
    _image = image;
    _date = date;
    _newsSubcategory = newsSubcategory;
    _newsCategory = newsCategory;
    _newsCategoryslug = newsCategoryslug;
    _reporterName = reporterName;
    _viewers = viewers;
    _comments = comments;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _summary = json['summary'];
    _description = json['description'];
    _image = json['image'] != null ? json['image'].cast<String>() : [];
    _date = json['date'];
    _newsSubcategory = json['news_subcategory'];
    _newsCategory = json['news_category'];
    _newsCategoryslug = json['news_categoryslug'];
    _reporterName = json['reporter_name'];
    _viewers = json['viewers'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
  }
  int? _id;
  String? _title;
  String? _summary;
  String? _description;
  List<String>? _image;
  String? _date;
  String? _newsSubcategory;
  String? _newsCategory;
  String? _newsCategoryslug;
  String? _reporterName;
  int? _viewers;
  List<Comments>? _comments;

  int? get id => _id;
  String? get title => _title;
  String? get summary => _summary;
  String? get description => _description;
  List<String>? get image => _image;
  String? get date => _date;
  String? get newsSubcategory => _newsSubcategory;
  String? get newsCategory => _newsCategory;
  String? get newsCategoryslug => _newsCategoryslug;
  String? get reporterName => _reporterName;
  int? get viewers => _viewers;
  List<Comments>? get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['summary'] = _summary;
    map['description'] = _description;
    map['image'] = _image;
    map['date'] = _date;
    map['news_subcategory'] = _newsSubcategory;
    map['news_category'] = _newsCategory;
    map['news_categoryslug'] = _newsCategoryslug;
    map['reporter_name'] = _reporterName;
    map['viewers'] = _viewers;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Comments {
  Comments({
    int? id,
    int? newsId,
    String? name,
    String? email,
    String? comment,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _newsId = newsId;
    _name = name;
    _email = email;
    _comment = comment;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _newsId = json['news_id'];
    _name = json['name'];
    _email = json['email'];
    _comment = json['comment'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _newsId;
  String? _name;
  String? _email;
  String? _comment;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get newsId => _newsId;
  String? get name => _name;
  String? get email => _email;
  String? get comment => _comment;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['news_id'] = _newsId;
    map['name'] = _name;
    map['email'] = _email;
    map['comment'] = _comment;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}