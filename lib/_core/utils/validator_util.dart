import 'package:logger/logger.dart';
import 'package:validators/validators.dart';

// TODO : 유효성 검사 전 문구 체크하기
Function validateUsername() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return "id에 공백이 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "id에 한글이나 특수 문자가 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "id의 길이를 초과하였습니다.";
    } else if (value.length < 3) {
      return "id의 최소 길이는 3자입니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return "패스워드 공백이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

bool isEmailOk(String str) {
  RegExp EmailOkPattern =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}*$');
  return EmailOkPattern.hasMatch(str);
}

Function validateEmail() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!isEmailOk(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

bool isKoreanOrEnglish(String str) {
  // 정규표현식을 사용하여 문자열이 한글 또는 영어 문자만 포함하는지 확인
  RegExp koreanOrEnglishPattern = RegExp(r'^[a-zA-Z가-힣]*$');
  return koreanOrEnglishPattern.hasMatch(str);
}

Function validateNickname() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return "닉네임에 공백이 들어갈 수 없습니다.";
    } else if (!isKoreanOrEnglish(value)) {
      return "닉네임 형식에 맞지 않습니다. 알파벳 대/소문자와 한글만 허용됩니다.";
    } else if (value.length > 10) {
      return "id의 최대 길이는 10자 입니다.";
    } else if (value.length < 2) {
      return "id의 최소 길이는 2자입니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  Logger().d("들어옴 = title");
  return (String? value) {
    if (value == null || value.isEmpty) {
      return "제목은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateContent() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return "내용은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}
