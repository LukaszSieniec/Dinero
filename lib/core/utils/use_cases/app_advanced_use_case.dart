abstract class AppAdvancedUseCase<T, Param1, Param2> {
  Future<T> execute({
    Param1? param1,
    Param2? param2,
  });
}
