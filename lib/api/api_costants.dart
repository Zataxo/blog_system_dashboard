class ApiConstants {
  static const String baseUrl = "http://localhost:3000";
  static final Uri loginUser = Uri.parse("$baseUrl/user/login");
  static final Uri signUp = Uri.parse("$baseUrl/user/signUp");

  static final headerWithOutToken = {'Content-Type': 'application/json'};
}
