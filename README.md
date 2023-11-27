![KakaoTalk_20231124_173356384](https://github.com/muaga/flutter-last-project/assets/135561587/494a577c-5f3c-4a00-a737-0e0a714cc397)

# 밀리의 서재 클론 코딩

## 프로젝트 2조
- 남은혜(팀장)
- 김대욱
- 김언약
- 진성훈

## 🎥 시연영상 [유튜브 링크]
https://youtu.be/5HnM500tUzE

## 🔧 기술스택

### Backend
<img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring-Boot&logoColor=white">

### Frontend
<img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=Flutter&logoColor=white">

### IDE
<img src="https://img.shields.io/badge/visualstudio-1A1F71?style=for-the-badge&logo=visualstudio&logoColor=white"> <img src="https://img.shields.io/badge/androidstudio-24A47F?style=for-the-badge&logo=androidstudio&logoColor=white">

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
![엔티티](https://github.com/muaga/flutter-last-project/assets/135561511/cf60723f-e415-4f65-8137-37b2f29aa271)

## 사용자 시나리오
- 회원가입  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/60361739-5832-4cfa-b39b-701d927d3147)
  
- 로그인  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/b62a00fb-b017-478c-9c20-6e061ca3f6ae)

- 로그아웃  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/b36a6f4c-0a51-4c47-a2eb-6844df83916d)

- 메인 - NOW  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/ec7da6e2-be06-41dd-b9a9-3e60b97a5cb7)

- 메인 - 스토리    
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/11b2be63-6328-433c-ac0e-263964bfa0e8)

- 피드  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/634ba7d4-deeb-42c9-a40c-eea1a55ca682)

- 검색  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/0c14ed8b-956d-443c-aaa3-9c7a02015cac)

- 내 서재  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/6944b773-7fa3-488a-a648-a7dbb1c7cf0a)

- 포스트 작성 및 상세보기  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/0f7e10da-5111-4b09-b29e-6c23641afb94)

- 댓글 작성  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/54d33d70-8cd0-4e73-a834-0f0cbdceec58)

- 도서 상세보기  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/10a97bf9-98c0-4249-af6e-15873fe61298)

- 도서 화면  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/6648cde5-c0af-4f6a-9ea1-c717522b830c)

- 관리  
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/e113d41c-ab0a-497f-9356-ac1926bd5f95)
  ![image](https://github.com/muaga/flutter-last-project/assets/135561511/a5f55a24-70e6-42ec-8d53-ba3347e8ed47)

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
- 회원가입 시 중복체크
- 비밀번호 찾기
- 유저 프로필 사진 등록 및 수정
- 정기 구독권 결제 기능
- 알림 설정
- epubViewer를 사용한 독서화면 서비스 추가
- OAuth를 사용한 간편 로그인 기능

## 📋 느낀 점
- Riverpod의 강력한 기능을 배우고 적용할 수 있었지만 활용하는 부분에 있어서 스스로 많이 부족했다고 느꼈습니다 로직이 조금만 복잡해져도 어디로 접근해야할지 많이 어려웠는데 내가 바꾸고 싶은 상태가 어디에 있는지 행위가 무엇인지 명확하게 알아야 함을 느꼈습니다
- 통신을 연결함에 있어서 API문서 참고하는 부분이 중요하다고 느꼈고 이 과정에서 백엔드와의 소통의 중요성을 깨달았습니다
- 앱 그림을 그리는데 컨벤션과 명칭의 중요성을 느꼈습니다 내가 만들어 놓고도 어디에 있는지 찾지 못한 경우가 있었습니다 공통 컴포넌트를 만들었다고 끝나는 것이 아니라 팀원들과 빠르게 공유한다면 협업의 능률을 올릴 수 있을것 같습니다
