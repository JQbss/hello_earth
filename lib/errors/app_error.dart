abstract class AppError {
  const AppError();
}

class ApiError extends AppError {

  const ApiError();

  String? getMessage(String key) => '';
}