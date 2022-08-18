// ignore_for_file: public_member_api_docs, sort_constructors_first
class Review {
  const Review({
    required this.score,
    required this.comment,
    required this.date,
  });
  final double score;
  final String comment;
  final DateTime date;
}
