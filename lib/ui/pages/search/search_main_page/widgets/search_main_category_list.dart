import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/book_category.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_view_model.dart';
import 'package:flutter_blog/ui/pages/search/search_category_book_list_page/search_category_book_list_page.dart';

class SearchMainCategoryList extends StatelessWidget {
  const SearchMainCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// mock 데이터
    List<BookCategory> bookCategorys = [
      BookCategory(
          id: 1,
          categoryName: "트렌드",
          categoryAbout: "사회적 트렌드, 기술 및 디지털 트렌드, 경제 밎 비즈니스 트렌드",
          categoryPicUrl: "book7.png"),
      BookCategory(
          id: 2,
          categoryName: "라이프",
          categoryAbout: "음식, 술·음료, 스포츠, 헬스·요가, 뷰티, 인테리어",
          categoryPicUrl: "book14.png"),
      BookCategory(
          id: 3,
          categoryName: "힐링",
          categoryAbout: "스트레스 관리, 명상, 요가, 자연 치유, 예술 치유",
          categoryPicUrl: "book24.png"),
      BookCategory(
          id: 4,
          categoryName: "지적교양",
          categoryAbout: "인문학, 과학, 역사, 문학, 미술, 철학",
          categoryPicUrl: "book28.png"),
      BookCategory(
          id: 5,
          categoryName: "소설",
          categoryAbout: "추리·스릴러, 킬러 스파이, 법의학 스릴러, SF",
          categoryPicUrl: "book31.png"),
    ];

    return ListView.builder(
      itemCount: bookCategorys.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchCategoryBookListPage(
                          title: bookCategorys[index].categoryName,
                          categoryId: bookCategorys[index].id,
                        )));
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: gapMedium, horizontal: gapXlarge),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kBackGray),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: gapLarge, horizontal: gapLarge),
                    child: Container(
                      width: getScreenWidth(context) * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${bookCategorys[index].categoryName}",
                              style: subTitle2()),
                          SizedBox(height: gapSmall),
                          Text("${bookCategorys[index].categoryAbout}",
                              overflow: TextOverflow.ellipsis), // 말 줄임표
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: gapLarge),
                    child: Container(
                      height: 100,
                      width: 70,
                      child: CachedNetworkImage(
                        imageUrl: dio.options.baseUrl +
                            "/images/${bookCategorys[index].categoryPicUrl}",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
