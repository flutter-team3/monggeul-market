import 'package:intl/intl.dart';

/// 숫자를 ₩원화 형식으로 변환합니다.
/// 예: formatKrw(15000) → ₩15,000
String formatKrw(int number) {
  final formatCurrency = NumberFormat.currency(locale: 'ko_KR', symbol: '');
  return '${formatCurrency.format(number)}원';
}