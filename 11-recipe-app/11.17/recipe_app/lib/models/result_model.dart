class ResultModel<T> {
  ResultModel({
    required this.data,
    this.hasErrored = false,
    this.hasLoaded = false,
  });

  List<T> data = [];
  bool hasErrored = false;
  bool hasLoaded = false;
}
