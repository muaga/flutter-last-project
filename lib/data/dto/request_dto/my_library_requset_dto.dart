class MyLibraryMainModel {
  final int bookLikeCount;
  final List<LikeBookList> likeBookList;
  final List<ReadingBookList> readingBookList;
  final PostList postList;

  MyLibraryMainModel({
    required this.bookLikeCount,
    required this.likeBookList,
    required this.readingBookList,
    required this.postList,
  });

  factory MyLibraryMainModel.fromJson(Map<String, dynamic> json) =>
      MyLibraryMainModel(
        bookLikeCount: json["bookLikeCount"],
        likeBookList: List<LikeBookList>.from(
            json["likeBookList"].map((x) => LikeBookList.fromJson(x))),
        readingBookList: List<ReadingBookList>.from(
            json["readingBookList"].map((x) => ReadingBookList.fromJson(x))),
        postList: PostList.fromJson(json["postList"]),
      );

  Map<String, dynamic> toJson() => {
    "bookLikeCount": bookLikeCount,
    "likeBookList": List<dynamic>.from(likeBookList.map((x) => x.toJson())),
    "readingBookList":
    List<dynamic>.from(readingBookList.map((x) => x.toJson())),
    "postList": postList.toJson(),
  };
}

class LikeBookList {
  final int bookLikeId;
  final int bookLikeUserId;
  final int bookId;
  final String likeBookPicUrl;
  final String likeBookTitle;
  final String likeWriter;

  LikeBookList({
    required this.bookLikeId,
    required this.bookLikeUserId,
    required this.bookId,
    required this.likeBookPicUrl,
    required this.likeBookTitle,
    required this.likeWriter,
  });

  factory LikeBookList.fromJson(Map<String, dynamic> json) => LikeBookList(
    bookLikeId: json["bookLikeId"],
    bookLikeUserId: json["bookLikeUserId"],
    bookId: json["bookId"],
    likeBookPicUrl: json["likeBookPicUrl"],
    likeBookTitle: json["likeBookTitle"],
    likeWriter: json["likeWriter"],
  );

  Map<String, dynamic> toJson() => {
    "bookLikeId": bookLikeId,
    "bookLikeUserId": bookLikeUserId,
    "bookId": bookId,
    "likeBookPicUrl": likeBookPicUrl,
    "likeBookTitle": likeBookTitle,
    "likeWriter": likeWriter,
  };
}

class PostList {
  final int replyCount;
  final ReplyList replyList;
  final int boardConut;
  final List<BoardList> boardList;

  PostList({
    required this.replyCount,
    required this.replyList,
    required this.boardConut,
    required this.boardList,
  });

  factory PostList.fromJson(Map<String, dynamic> json) => PostList(
    replyCount: json["replyCount"],
    replyList: ReplyList.fromJson(json["replyList"]),
    boardConut: json["boardConut"],
    boardList: List<BoardList>.from(
        json["boardList"].map((x) => BoardList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "replyCount": replyCount,
    "replyList": replyList.toJson(),
    "boardConut": boardConut,
    "boardList": List<dynamic>.from(boardList.map((x) => x.toJson())),
  };
}

class BoardList {
  final int boardId;
  final String boardTitle;
  final String boardCreatedAt;

  BoardList({
    required this.boardId,
    required this.boardTitle,
    required this.boardCreatedAt,
  });

  factory BoardList.fromJson(Map<String, dynamic> json) => BoardList(
    boardId: json["boardId"],
    boardTitle: json["boardTitle"],
    boardCreatedAt: json["boardCreatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "boardId": boardId,
    "boardTitle": boardTitle,
    "boardCreatedAt": boardCreatedAt
  };
}

class ReplyList {
  final List<BookReplyList> bookReplyList;
  final List<BoardReplyList> boardReplyList;

  ReplyList({
    required this.bookReplyList,
    required this.boardReplyList,
  });

  factory ReplyList.fromJson(Map<String, dynamic> json) => ReplyList(
    bookReplyList: List<BookReplyList>.from(
        json["bookReplyList"].map((x) => BookReplyList.fromJson(x))),
    boardReplyList: List<BoardReplyList>.from(
        json["boardReplyList"].map((x) => BoardReplyList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookReplyList":
    List<dynamic>.from(bookReplyList.map((x) => x.toJson())),
    "boardReplyList":
    List<dynamic>.from(boardReplyList.map((x) => x.toJson())),
  };
}

class BoardReplyList {
  final int boardReplyId;
  final String boardReplyContent;
  final String boardReplyCreatedAt;
  final String bookPicUrl;
  final String bookTitle;
  final String bookWriter;

  BoardReplyList({
    required this.boardReplyId,
    required this.boardReplyContent,
    required this.boardReplyCreatedAt,
    required this.bookPicUrl,
    required this.bookTitle,
    required this.bookWriter,
  });

  factory BoardReplyList.fromJson(Map<String, dynamic> json) => BoardReplyList(
    boardReplyId: json["boardReplyId"],
    boardReplyContent: json["boardReplyContent"],
    boardReplyCreatedAt: json["boardReplyCreatedAt"],
    bookPicUrl: json["bookPicUrl"],
    bookTitle: json["bookTitle"],
    bookWriter: json["bookWriter"],
  );

  Map<String, dynamic> toJson() => {
    "boardReplyId": boardReplyId,
    "boardReplyContent": boardReplyContent,
    "boardReplyCreatedAt": boardReplyCreatedAt,
    "bookPicUrl": bookPicUrl,
    "bookTitle": bookTitle,
    "bookWriter": bookWriter,
  };
}

class BookReplyList {
  final int bookReplyId;
  final String bookReplyContent;
  final String bookReplyCreatedAt;
  final String bookPicUrl;
  final String bookTitle;
  final String bookWriter;

  BookReplyList({
    required this.bookReplyId,
    required this.bookReplyContent,
    required this.bookReplyCreatedAt,
    required this.bookPicUrl,
    required this.bookTitle,
    required this.bookWriter,
  });

  factory BookReplyList.fromJson(Map<String, dynamic> json) => BookReplyList(
    bookReplyId: json["bookReplyId"],
    bookReplyContent: json["bookReplyContent"],
    bookReplyCreatedAt: json["bookReplyCreatedAt"],
    bookPicUrl: json["bookPicUrl"],
    bookTitle: json["bookTitle"],
    bookWriter: json["bookWriter"],
  );

  Map<String, dynamic> toJson() => {
    "bookReplyId": bookReplyId,
    "bookReplyContent": bookReplyContent,
    "bookReplyCreatedAt": bookReplyCreatedAt,
    "bookPicUrl": bookPicUrl,
    "bookTitle": bookTitle,
    "bookWriter": bookWriter,
  };
}

class ReadingBookList {
  final int readingBookId;
  final int readingBookUserId;
  final int bookId;
  final String bookReadingPicUrl;
  final String bookReadingTitle;
  final String readingWriter;
  final String scroll;

  ReadingBookList({
    required this.readingBookId,
    required this.readingBookUserId,
    required this.bookId,
    required this.bookReadingPicUrl,
    required this.bookReadingTitle,
    required this.readingWriter,
    required this.scroll,
  });

  factory ReadingBookList.fromJson(Map<String, dynamic> json) =>
      ReadingBookList(
        readingBookId: json["readingBookId"],
        readingBookUserId: json["readingBookUserId"],
        bookId: json["bookId"],
        bookReadingPicUrl: json["bookReadingPicUrl"],
        bookReadingTitle: json["bookReadingTitle"],
        readingWriter: json["readingWriter"],
        scroll: json["scroll"],
      );

  Map<String, dynamic> toJson() => {
    "readingBookId": readingBookId,
    "readingBookUserId": readingBookUserId,
    "bookId": bookId,
    "bookReadingPicUrl": bookReadingPicUrl,
    "bookReadingTitle": bookReadingTitle,
    "readingWriter": readingWriter,
    "scroll": scroll,
  };
}