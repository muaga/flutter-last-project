import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// 1. 창고 데이터
class BookStoreBestBookListModel {
  int bookCount;
  int bookCategoryId;
  List<BookListDTO>? bookList;
  List<CategoryDTO>? category;
  BookStoreBestBookListModel(
      {required this.bookCount,
      required this.bookCategoryId,
      this.bookList,
      this.category});

  factory BookStoreBestBookListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? temp1 = json["bookList"];
    List<BookListDTO> bookList = [];
    if (temp1 != null) {
      bookList = temp1.map((e) => BookListDTO.fromJson(e)).toList();
    }

    List<dynamic>? temp2 = json["category"];
    List<CategoryDTO> category = [];
    if (temp2 != null) {
      category = temp2.map((e) => CategoryDTO.fromJson(e)).toList();
    }

    return BookStoreBestBookListModel(
        bookCount: json["bookCount"],
        bookCategoryId: json["bookCategoryId"],
        bookList: bookList,
        category: category);
  }
}

class CategoryDTO {
  int? categoryId;
  String? categoryName;

  CategoryDTO({this.categoryId, this.categoryName});

  CategoryDTO.fromJson(Map<String, dynamic> json)
      : categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class BookListDTO {
  int? bookId;
  String? bookPicUrl;
  String? bookTitle;
  String? bookWriter;

  BookListDTO({this.bookId, this.bookPicUrl, this.bookTitle, this.bookWriter});

  BookListDTO.fromJson(Map<String, dynamic> json)
      : bookId = json["bookId"],
        bookPicUrl = json["bookPicUrl"],
        bookTitle = json["bookTitle"],
        bookWriter = json["bookWriter"];
}

/// 2. 창고
class BookStoreBestBookListViewModel
    extends StateNotifier<BookStoreBestBookListModel?> {
  BookStoreBestBookListViewModel(super._state);

  Future<BookStoreBestBookListModel> notifyInit(
      BookBestReqDTO bookBestReqDTO) async {
    ResponseDTO responseDTO =
        await BookRepository().fetchBestBookList(bookBestReqDTO);
    Logger().d("responseDTO : ${responseDTO}");

    BookStoreBestBookListModel model = responseDTO.data;
    state = BookStoreBestBookListModel(
        bookCategoryId: model.bookCategoryId,
        bookCount: model.bookCount,
        bookList: model.bookList,
        category: model.category);
    Logger().d("상태 : ${state?.bookCategoryId}");
    Logger().d("상태 : ${state?.bookCount}");
    Logger().d("상태 : ${state?.bookList}");
    Logger().d("상태 : ${state?.category}");

    return BookStoreBestBookListModel(
        bookCount: model.bookCount,
        bookCategoryId: model.bookCategoryId,
        bookList: model.bookList);
  }
}

/// 3. 창고 관리자(view가 빌드되기 직전에 생성됨)
final bookBestProvider = StateNotifierProvider.family<
    BookStoreBestBookListViewModel,
    BookStoreBestBookListModel?,
    BookBestReqDTO>((ref, bookBestReqDTO) {
  return BookStoreBestBookListViewModel(null)..notifyInit(bookBestReqDTO);
});
