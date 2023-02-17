class BookModel {
  final String bookId, userId, title, author, genre, platform, date;
  final bool isCompleted, islikely;
  final int readNum, completedNum;

  BookModel.fromJson(Map<String, dynamic> json)
      : bookId = json['bookId'],
        userId = json['userId'],
        title = json['title'],
        author = json['author'],
        genre = json['genre'],
        platform = json['platform'],
        date = json['date'],
        isCompleted = json['isCompleted'],
        islikely = json['islikely'],
        readNum = json['readNum'],
        completedNum = json['completedNum'];
}
