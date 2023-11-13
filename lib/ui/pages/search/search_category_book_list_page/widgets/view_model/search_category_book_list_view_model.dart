import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 데이터
class SearchCategoryBookListModel {
  final int bookCount;
  final int bookCategoryId;
  final List<ByCategoryPage>? byCategoryPages;
  SearchCategoryBookListModel(
      {required this.bookCount,
      required this.bookCategoryId,
      this.byCategoryPages});

  factory SearchCategoryBookListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["byCategoryPages"];
    List<ByCategoryPage> byCategoryPages =
        temp.map((e) => ByCategoryPage.fromJson(e)).toList();

    return SearchCategoryBookListModel(
        bookCount: json["bookCount"],
        bookCategoryId: json["bookCategoryId"],
        byCategoryPages: byCategoryPages);
  }
}

class ByCategoryPage {
  final int bookId;
  final String bookPicUrl;
  final String bookTitle;
  final String bookWriter;

  ByCategoryPage(
      {required this.bookId,
      required this.bookPicUrl,
      required this.bookTitle,
      required this.bookWriter});

  ByCategoryPage.fromJson(Map<String, dynamic> json)
      : bookId = json["bookId"],
        bookPicUrl = json["bookPicUrl"],
        bookTitle = json["bookTitle"],
        bookWriter = json["bookWriter"];
}

/// 2. 창고
class SearchCategoryBookListViewModel
    extends StateNotifier<SearchCategoryBookListModel?> {
  SearchCategoryBookListViewModel(SearchCategoryBookListModel? state, this.ref)
      : super(state);
  Ref ref;

  // 통신을 통해 reponseDTO에 데이터 받아오고 최초 상태 변경하기
  Future<SearchCategoryBookListModel> notifyInit(int categoryId) async {
    ResponseDTO responseDTO =
        await BookRepository().fetchCategoryBookList(categoryId);
    SearchCategoryBookListModel model = responseDTO.data;
    state = SearchCategoryBookListModel(
        bookCategoryId: model.bookCategoryId,
        bookCount: model.bookCount,
        byCategoryPages: model.byCategoryPages);

    return SearchCategoryBookListModel(
        bookCount: model.bookCount,
        bookCategoryId: model.bookCategoryId,
        byCategoryPages: model.byCategoryPages);
  }
}

/// 3. 창고 관리자(view가 빌드되기 직전에 생성됨)
final searchCategoryProvider = StateNotifierProvider.family<
    SearchCategoryBookListViewModel,
    SearchCategoryBookListModel?,
    int>((ref, categoryId) {
  return SearchCategoryBookListViewModel(null, ref)..notifyInit(categoryId);
});
