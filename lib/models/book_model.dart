class BookModel {
  final String bookId, userId, title, genre, platform;
  final bool isCompleted, islikely;
  final int readNum, completedNum;

  BookModel.fromJson(Map<String, dynamic> json)
      : bookId = json['bookId'],
        userId = json['userId'],
        title = json['title'],
        genre = json['genre'],
        platform = json['platform'],
        isCompleted = json['isCompleted'],
        islikely = json['islikely'],
        readNum = json['readNum'],
        completedNum = json['completedNum'];
}
