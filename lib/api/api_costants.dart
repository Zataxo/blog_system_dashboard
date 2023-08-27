class ApiConstants {
  static const String baseUrl = "http://localhost:3000";
  static final Uri loginUser = Uri.parse("$baseUrl/user/login");
  static final Uri signUp = Uri.parse("$baseUrl/user/signUp");
  static final Uri getPosts = Uri.parse("$baseUrl/posts");
  static final Uri createPost = Uri.parse("$baseUrl/posts");
  static final Uri getCategories = Uri.parse("$baseUrl/category");
  static final Uri createCategory = Uri.parse("$baseUrl/category");

  static final headerWithOutToken = {'Content-Type': 'application/json'};
}
