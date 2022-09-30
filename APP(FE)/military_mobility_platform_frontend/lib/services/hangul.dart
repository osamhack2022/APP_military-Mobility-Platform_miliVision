// https://taegon.kim/archives/9919 이 글을 참조해서 구현

bool isHangul(String c) {
  final hangulExp = RegExp(r'[가-힣]');
  return hangulExp.hasMatch(c);
}

bool isHangulConsonant(String c) {
  final hangulConsonantExp = RegExp(r'[ㄱ-ㅎ]');
  return hangulConsonantExp.hasMatch(c);
}

String _characterToPattern(String c) {
  const offset = 44032;
  const siotCode = 12613; // 'ㅅ' 의 유니코드 인덱스
  final consonant2letterCode = {
    'ㄱ': '가'.runes.first,
    'ㄲ': '까'.runes.first,
    'ㄴ': '나'.runes.first,
    'ㄷ': '다'.runes.first,
    'ㄸ': '따'.runes.first,
    'ㄹ': '라'.runes.first,
    'ㅁ': '마'.runes.first,
    'ㅂ': '바'.runes.first,
    'ㅃ': '빠'.runes.first,
    'ㅅ': '사'.runes.first,
  };

  if (isHangul(c)) {
    final code = c.runes.first - offset;
    if (code % 28 > 0) {
      return c;
    }
    final beginCode = (code / 28).floor() * 28 + offset;
    final endCode = beginCode + 27;
    return '[${String.fromCharCode(beginCode)}-${String.fromCharCode(endCode)}]';
  } else if (isHangulConsonant(c)) {
    final beginCode = consonant2letterCode[c] ??
        (c.runes.first - siotCode) * 588 + '사'.runes.first;
    final endCode = beginCode + 587;
    return '[$c${String.fromCharCode(beginCode)}-${String.fromCharCode(endCode)}]';
  } else {
    return RegExp.escape(c);
  }
}

RegExp getHangulMatcher(String s) {
  final pattern = s.split("").map((c) => _characterToPattern(c)).join();
  return RegExp(pattern);
}
