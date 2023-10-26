import 'package:validators/validators.dart';

// TODO : 유효성 검사 전 문구 체크하기
Function validateUsername() {
  return (String? value) {
    if (value!.isEmpty) {
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
    if (value!.isEmpty) {
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

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

// RegExp _validCharacters = RegExp(r'^[a-zA-Z가-힣]+$');
Function validateNickname() {
  return (String? value) {
    if (value!.isEmpty) {
      return "닉네임에 공백이 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "닉네임 형식에 맞지 않습니다. 알파벳 대/소문자와 한글만 허용됩니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
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
    if (value!.isEmpty) {
      return "내용은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}
