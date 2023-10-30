import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. 창고 데이터
class OneMonthPressBookListModel {
  List<Book> books;
  OneMonthPressBookListModel({required this.books});
}

/// 2. 창고
class OneMonthPressBookListViewModel
    extends StateNotifier<OneMonthPressBookListModel?> {
  OneMonthPressBookListViewModel(
      super._state); // super._state = PostListModel 타입

  // final mContext = navigatorKey.currentContext;
  // Ref ref;

  // 통신을 통해 reponseDTO에 데이터 받아오고 최초 상태 변경하기
  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await BookRepository().fetchBookList();
    state = OneMonthPressBookListModel(books: responseDTO.data);
  }
}

/// 3. 창고 관리자(view가 빌드되기 직전에 생성됨)
final bookListProvider = StateNotifierProvider<OneMonthPressBookListViewModel,
    OneMonthPressBookListModel?>((ref) {
  return OneMonthPressBookListViewModel(null)..notifyInit();
  // ..notifyInit() : 언젠가 null -> 상태가 들어오면 변경이 될 것이다.
});
