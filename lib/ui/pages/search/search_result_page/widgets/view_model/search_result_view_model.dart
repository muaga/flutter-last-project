// 창고 데이터
import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultModel {
  String keyword;
  int? bookCount;
  List<BookKeywordDTO>? bookKeywordList;
  int? boardCount;
  List<BoardKeywordDTO>? boardKeywordList;

  SearchResultModel(
      {required this.keyword,
      this.bookCount,
      this.boardCount,
      this.boardKeywordList,
      this.bookKeywordList});

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp1 = json["bookKeywordList"];
    List<BookKeywordDTO> bookKeywordList =
        temp1.map((e) => BookKeywordDTO.fromJson(e)).toList();
    List<dynamic> temp2 = json["boardKeywordList"];
    List<BoardKeywordDTO> boardKeywordList =
        temp2.map((e) => BoardKeywordDTO.fromJson(e)).toList();

    return SearchResultModel(
        bookCount: json["bookCount"],
        boardCount: json["boardCount"],
        keyword: json["keyword"],
        boardKeywordList: boardKeywordList,
        bookKeywordList: bookKeywordList);
  }
}

class BookKeywordDTO {
  int bookId;
  String bookPicUrl;
  String bookTitle;
  String subTitle;

  BookKeywordDTO(
      {required this.bookId,
      required this.bookPicUrl,
      required this.bookTitle,
      required this.subTitle});

  BookKeywordDTO.fromJson(Map<String, dynamic> json)
      : bookId = json["bookId"],
        bookPicUrl = json["bookPicUrl"],
        bookTitle = json["bookTitle"],
        subTitle = json["subTitle"];
}

class BoardKeywordDTO {
  int boardId;
  String bookPicUrl;
  String content;
  String nickname;

  BoardKeywordDTO(
      {required this.boardId,
      required this.bookPicUrl,
      required this.content,
      required this.nickname});

  BoardKeywordDTO.fromJson(Map<String, dynamic> json)
      : boardId = json["boardId"],
        bookPicUrl = json["bookPicUrl"],
        content = json["content"],
        nickname = json["nickname"];
}

// 창고
class SearchResultViewModel extends StateNotifier<SearchResultModel?> {
  SearchResultViewModel(super._state, this.ref);

  Ref ref;

  Future<SearchResultModel> notifyInit(
      BookSearchReqDTO bookSearchReqDTO) async {
    ResponseDTO responseDTO =
        await BookRepository().fetchSearchBookOrBoard(bookSearchReqDTO);
    SearchResultModel model = responseDTO.data;
    state = SearchResultModel(
        keyword: model.keyword,
        boardCount: model.boardCount,
        bookCount: model.bookCount,
        boardKeywordList: model.boardKeywordList,
        bookKeywordList: model.bookKeywordList);
<<<<<<< HEAD:lib/ui/pages/search/search_result_page/widgets/view_model/search_result_view_model.dart
    return SearchResultModel(
        keyword: model.keyword,
        bookCount: model.bookCount,
        boardCount: model.boardCount,
        bookKeywordList: model.bookKeywordList,
        boardKeywordList: model.boardKeywordList);
=======
    Logger().d(model.keyword);
    Logger().d(model.boardCount);
    Logger().d(model.bookCount);
    Logger().d(model.boardKeywordList);
    Logger().d(model.bookKeywordList);
    Logger().d("상태 : ${state?.keyword}");
    Logger().d("상태 : ${state?.boardCount}");
    Logger().d("상태 : ${state?.bookCount}");
    Logger().d("상태 : ${state?.boardKeywordList}");
    Logger().d("상태 : ${state?.bookKeywordList}");

>>>>>>> dev:lib/ui/pages/search/search_result_page/widgets/view_model/search_main_view_model.dart
  }
}

// 창고 관리자
final searchProvider = StateNotifierProvider.family<SearchResultViewModel,
    SearchResultModel?, BookSearchReqDTO>((ref, bookSearchReqDTO) {
  return SearchResultViewModel(null, ref)..notifyInit(bookSearchReqDTO);
});
