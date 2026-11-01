class StudySession {
  final int? id; final int? bookId; final String? bookTitle; final DateTime startAt; final DateTime endAt; final String note;
  const StudySession({this.id,this.bookId,this.bookTitle,required this.startAt,required this.endAt,this.note=''});
  int get durationSeconds=>endAt.difference(startAt).inSeconds;
  Map<String,Object?> toMap()=>{'id':id,'book_id':bookId,'book_title':bookTitle,'start_at':startAt.toIso8601String(),'end_at':endAt.toIso8601String(),'note':note};
  factory StudySession.fromMap(Map<String,Object?> m)=>StudySession(id:m['id'] as int?,bookId:m['book_id'] as int?,bookTitle:m['book_title'] as String?,startAt:DateTime.parse(m['start_at'] as String),endAt:DateTime.parse(m['end_at'] as String),note:m['note'] as String? ?? '');
}
