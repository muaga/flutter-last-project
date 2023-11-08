// 창고 데이터
import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/model/book.dart';
import 'package:flutter_blog/data/repository/book_data_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookReadModel {
  late int scroll;
  late List<String> bookdata;
  BookReadModel({required this.scroll, required this.bookdata});

  factory BookReadModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["bookdata"];
    List<String> bookdata = temp.map((e) => e.toString()).toList();

    return BookReadModel(scroll: json["scroll"], bookdata: bookdata);
  }
}

// 창고
class BookReadViewModel extends StateNotifier<BookReadModel?> {
  BookReadViewModel(super._state, this.ref);

  Ref ref;

  Future<void> notifyInit(int bookId) async {
    SessionUser sessionUser = ref.read(sessionStore);

    ResponseDTO responseDTO = await BookDataRepository()
        .fetchBookDataDetail(bookId, sessionUser.jwt!);
    BookReadModel model = responseDTO.data;
    state = BookReadModel(scroll: model.scroll, bookdata: model.bookdata);
  }
}

// 창고 관리자 = bookId를 인수로 받음
final bookReadProvider =
    StateNotifierProvider.family<BookReadViewModel, BookReadModel?, int>(
        (ref, bookId) {
  return BookReadViewModel(null, ref)..notifyInit(bookId);
});
