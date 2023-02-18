class BookModel {
  final String bookId, userId, title, author, genre, platform, frstDt, lstDt;
  final bool isCompleted, islikely;
  final int readNum, completedNum;

  BookModel.fromJson(Map<String, dynamic> json)
      : bookId = json['bookId'],
        userId = json['userId'],
        title = json['title'],
        author = json['author'],
        genre = json['genre'],
        platform = json['platform'],
        frstDt = json['frstDt'],
        lstDt = json['lstDt'],
        isCompleted = json['isCompleted'],
        islikely = json['islikely'],
        readNum = json['readNum'],
        completedNum = json['completedNum'];
}
