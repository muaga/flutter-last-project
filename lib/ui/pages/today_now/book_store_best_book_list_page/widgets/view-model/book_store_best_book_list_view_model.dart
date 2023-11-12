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
    List<dynamic> temp1 = json["bookList"];
    List<BookListDTO> bookList =
        temp1.map((e) => BookListDTO.fromJson(e)).toList();
    List<dynamic> temp2 = json["category"];
    List<CategoryDTO> category =
        temp2.map((e) => CategoryDTO.fromJson(e)).toList();

    return BookStoreBestBookListModel(
        bookCount: json["bookCount"],
        bookCategoryId: json["bookCategoryId"],
        bookList: bookList,
        category: category);
  }
}

class CategoryDTO {
  final int categoryId;
  final String categoryName;

  CategoryDTO({required this.categoryId, required this.categoryName});

  CategoryDTO.fromJson(Map<String, dynamic> json)
      : categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class BookListDTO {
  final int bookId;
  final String bookPicUrl;
  final String bookTitle;
  final String bookWriter;

  BookListDTO(
      {required this.bookId,
      required this.bookPicUrl,
      required this.bookTitle,
      required this.bookWriter});

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

  Future<void> notifyInit(BookBestReqDTO bookBestReqDTO) async {
    ResponseDTO responseDTO =
        await BookRepository().fetchBestBookList(bookBestReqDTO);
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
  }
}

/// 3. 창고 관리자(view가 빌드되기 직전에 생성됨)
final bookBestProvider = StateNotifierProvider.family<
    BookStoreBestBookListViewModel,
    BookStoreBestBookListModel?,
    BookBestReqDTO>((ref, bookBestReqDTO) {
  return BookStoreBestBookListViewModel(null)..notifyInit(bookBestReqDTO);
});
