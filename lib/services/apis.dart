import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trogon/models/categories.dart';
import 'package:trogon/models/coursefull.dart';
import 'package:trogon/models/topcourses.dart';

class Apis{

  Future<List<TopCourse>> getCourseData() async {
    String uri = "https://futursity.com/course/api/top_courses";

    var response = await http.get(
      Uri.parse(uri),
    );
    print("courseResponse" + response.body.toString());
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return (items as List)
          .map((li) => TopCourse.fromJson(li))
          .toList();
    } else {
      print("exception" + response.body.toString());
      throw Exception('Failed to load internet');
    }
  }

  Future<List<Categories>> categoriesApi() async {
    String uri = "https://futursity.com/course/api/categories";

    var response = await http.get(
      Uri.parse(uri),
    );
    print("categoriesResponse" + response.body.toString());
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return (items as List)
          .map((li) => Categories.fromJson(li))
          .toList();
    } else {
      print("exception" + response.body.toString());
      throw Exception('Failed to load internet');
    }
  }

  Future<List<CourseFull>> coursePass(String courseID,String token) async {
    String uri = "https://futursity.com/course/api/course_details_by_id?course_id=$courseID&auth_token=$token";

    var response = await http.get(
      Uri.parse(uri),
    );
    print("categoriesResponse" + response.body.toString());
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      return (items as List)
          .map((li) => CourseFull.fromJson(li))
          .toList();
    } else {
      print("exception" + response.body.toString());
      throw Exception('Failed to load internet');
    }
  }


}