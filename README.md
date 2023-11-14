![밀리의 서재](https://github.com/muaga/flutter-last-project/assets/135561511/185d4cf1-4e8a-4b40-aed6-064c08574f57)

# 밀리의 서재 클론 코딩

## 프로젝트 2조
- 남은혜(팀장)
- 김대욱
- 김언약
- 진성훈

## 🎥 시연영상 [유튜브 링크] ()
## 🔧 기술스택

### Backend
<img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring-Boot&logoColor=white">

### Frontend
<img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=Flutter&logoColor=white">

### 협업도구
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"> <img src="https://img.shields.io/badge/postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"> <img src="https://img.shields.io/badge/figma-C11920?style=for-the-badge&logo=figma&logoColor=white"> <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white"> <img src="https://img.shields.io/badge/slack-764ABC?style=for-the-badge&logo=slack&logoColor=white">

### 데이터베이스
<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white"> <img src="https://img.shields.io/badge/h2-F9DC3E?style=for-the-badge&logo=h2&logoColor=white">


### 라이브러리
```  flutter_native_splash: ^2.3.4 # 스플래시 화면을 위한 라이브러리
  cached_network_image: ^3.1.0 # 네트워크 통신으로 이미지를 통신하는 라이브러리
  flutter_svg: ^2.0.6
  flutter_lints: ^2.0.1
  validators: ^3.0.0
  intl: ^0.18.1
  cupertino_icons: ^1.0.0
  dio: ^5.2.0 # 서버와 통신하기 위해 필요한 라이브러리
  flutter_riverpod: ^2.3.6 # 상태관리 Riverpod 라이브러리
  logger: ^1.3.0 # 콘솔창에서 결과물을 쉽게 확인할 수 있도록 하는 Log 라이브러리
  flutter_secure_storage: ^8.0.0 # 어플리케이션 Secure Storage를 쉽게 사용할 수 있도록 도와주는 라이브러리
  flutter_gif: ^0.0.4 # gif 라이브러리
  slide_to_act: ^2.0.2
  carousel_slider: ^4.2.1 # 이미지 슬라이더
  webview_flutter: ^4.4.2 #webView 이동
  iamport_flutter: ^0.10.0
```

## 💻 기능 설명(기능 영상 포함)
밀리의 서재는 월정액으로 구독권을 구매한 후, 도서를 대여해 읽을 수 있는 전자책 서비스를 제공하고 책에 대한 포스트 작성과 댓글을 통해 소통이 가능한 서비스 앱으로써 해당 앱을 클론 코딩 했습니다.

### 유저 관련 기능
- 회원가입
- 로그인 시 휴대폰 로컬에 user 일부 정보, 구독권 사용 유무, JWT 저장
- 로그아웃
- 닉네임 변경
- 비밀번호 변경
- 이메일 변경
- 회원탈퇴
- 공지사항 및 FAQ 조회
- 구독권 구매

 ### 도서 관련 기능
- 서점 베스트 순 도서 목록 조회
- 한 달 이내 출간된 도서 목록 조회
- 밀리의 서재 이벤트 배너
- 카테고리별 도서 목록 조회
- 도서 검색
- 도서 추천 검색어로 검색
- 도서 상세 보기
- 도서 관련 댓글 작성 가능
- 좋아하는 도서 스크랩

### 독서 관련 기능
- 구독권 결제 후 독서 가능
- 전자책 독서 기능
- 읽고 있는 도서로 자동 스크랩
- 좋아하는 페이지 북마크 가능
- 북마크한 페이지 목록 조회
- 북마크한 페이지로 이동 가능
- 전자책 진입 시 마지막으로 읽은 페이지로 진입 가능

### 포스트 관련 기능
- 모든 유저의 포스트 목록 조회
- 포스트 검색
- 포스트 관련 댓글 작성 가능
- 좋아하는 포스트 스크랩

### 내 서재 관련 기능
- 스크랩한 도서 목록 조회 및 삭제
- 읽고 있는 도서 목록 조회 및 삭제
- 내가 작성한 댓글 조회 및 삭제
- 내가 작성한 포스트 조회 및 수정, 삭제
- 댓글 작성 및 포스트 작성

## 🔗 엔티티 연관관계

## 📝 노션
https://chiseled-acoustic-3be.notion.site/2-82dc0df9935b4000afae6183f08a9b6d?pvs=4    

일정관리, 역할분담, 계획수립, 소통 등 노션을 통해 진행하였다.

## 🧩 블로그 테스트 정리

#### 공부내용 블로그 정리 
https://chiseled-acoustic-3be.notion.site/efedc2f9e4a74a04863509a841df5437?pvs=4   

#### Github에 푸시한 테스트 코드
https://github.com/muaga/flutter-test-code

https://github.com/muaga/spring-substring-test   

https://github.com/muaga/flutter-viewmodel   

https://github.com/saki8661/flutter_millie    


## 🔩 보완할 점
- 학교 인증을 위해 받은 증명서를 관리자 페이지에서 확인 후 인증 처리
- 대댓글
- 글/댓글 신고 -> 5회 이상 신고당한 게시글/댓글은 관리자 페이지에서 유저 탈퇴(경고) 처리
- 게시글을 통해 글을 쓴 유저에게 쪽지 보내기 기능
- 쪽지 보내는 사용자 차단 기능
- 글 쓰기에서 파일 업로드 기능 + 썸네일
- 글 쓰기에서 해시 태그 기능 + 해시 태그로 검색 기능
- 완성 후 배포해보기
- 학점계산기 

## 📋 느낀 점
- 주소 설계, 변수명 등 설계 과정에 미흡한 점 때문에 놓친 시간이 많았던 점이 아쉽다. 다음 프로젝트에선 이 부분을 보완하여 더 꼼꼼한 설계가 필요해보인다.
- Github로 협업하며 PR 과정에서 머지 충돌이 많이 일어났다. 어떤 파일에서 어떤 부분이 변경되고 추가되었는지 확인했음에도 충돌이 나는 것으로 보아 커뮤니케이션이 부족했음을 깨달았다. 짧은 시간이라도 더 많은 회의와 소통이 필요함을 느꼈다.
- 회의 할 때 진행사항 확인을 위주로 진행했는데 내가 짠 코드를 소개하고 설명하면서 내 코드의 빈틈을 볼 수 있었다. 팀원의 피드백으로 한번 더 코드를 수정하는데 도움이 됐다. 정답이라고 생각하고 짰던 코드도 다시보니 지저분하게 보이기도 했다. 코드 리팩토링 과정은 꼭 필요한 것 같다.
- 실제 프로젝트 파일에 적용하기 전에 테스트 과정이 필수적이라고 느꼈다. 무거운 프로그램에서 돌려보기 전에 잘 작동하는 코드인지 테스트하지 않으면 어디에서부터 수정해야할지 막막했기 때문이다.
- 웹 사이트의 대부분의 기능이 CRUD 범주 안에 들어간다는 것이 신기했고, 계속해서 반복함으로써 개념이 더 확실하게 잡혔다.
- 프로젝트를 통해 공부했던 내용을 실제로 활용해 보며 부족한 점을 파악하고 보완하기 좋은 기회가 되었다.
