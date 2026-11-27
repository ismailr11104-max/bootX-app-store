abstract class ApiService {
  Future<T> post<T>(String endpoint, {Map<String, dynamic>? body});
  Future<T> get<T>(String endpoint, {Map<String, dynamic>? queryParameters});
  Future<T> put<T>(String endpoint, {Map<String, dynamic>? body});
  Future<T> delete<T>(String endpoint, {Map<String, dynamic>? body});
}
