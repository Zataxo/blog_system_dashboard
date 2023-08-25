class ApiConstants {
  static const String baseUrl = "http://localhost:3000";
  static final Uri loginUser = Uri.parse("$baseUrl/user/login");

  static final headerWithOutToken = {'Content-Type': 'application/json'};
}
