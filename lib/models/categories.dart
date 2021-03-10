class Categories {
  String id;
  String code;
  String name;
  String parent;
  String slug;
  String dateAdded;
  String lastModified;
  String fontAwesomeClass;
  String thumbnail;
  int numberOfCourses;

  Categories(
      {this.id,
        this.code,
        this.name,
        this.parent,
        this.slug,
        this.dateAdded,
        this.lastModified,
        this.fontAwesomeClass,
        this.thumbnail,
        this.numberOfCourses});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    parent = json['parent'];
    slug = json['slug'];
    dateAdded = json['date_added'];
    lastModified = json['last_modified'];
    fontAwesomeClass = json['font_awesome_class'];
    thumbnail = json['thumbnail'];
    numberOfCourses = json['number_of_courses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['parent'] = this.parent;
    data['slug'] = this.slug;
    data['date_added'] = this.dateAdded;
    data['last_modified'] = this.lastModified;
    data['font_awesome_class'] = this.fontAwesomeClass;
    data['thumbnail'] = this.thumbnail;
    data['number_of_courses'] = this.numberOfCourses;
    return data;
  }
}
