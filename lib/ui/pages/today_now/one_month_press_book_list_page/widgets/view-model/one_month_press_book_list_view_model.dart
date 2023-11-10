import 'package:flutter_blog/data/dto/request_dto/book_request_dto.dart';
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
  Future<void> notifyInit(BookReqDTO dto) async {
    ResponseDTO responseDTO = await BookRepository().fetchBookList(dto);
    state = OneMonthPressBookListModel(books: responseDTO.data);
  }
}

/// 3. 창고 관리자(view가 빌드되기 직전에 생성됨)
final OneMonthPressBookListProvider = StateNotifierProvider.family<
    OneMonthPressBookListViewModel,
    OneMonthPressBookListModel?,
    BookReqDTO>((ref, dto) {
  return OneMonthPressBookListViewModel(null)..notifyInit(dto);
});
