class TopicEvaluation {
  final int? id; final int? bookId; final String topic; final int rating; final String notes; final String? imagePath; final String? audioPath; final DateTime evaluatedAt;
  const TopicEvaluation({this.id,this.bookId,required this.topic,required this.rating,this.notes='',this.imagePath,this.audioPath,required this.evaluatedAt});
  Map<String,Object?> toMap()=>{'id':id,'book_id':bookId,'topic':topic,'rating':rating,'notes':notes,'image_path':imagePath,'audio_path':audioPath,'evaluated_at':evaluatedAt.toIso8601String()};
  factory TopicEvaluation.fromMap(Map<String,Object?> m)=>TopicEvaluation(id:m['id'] as int?,bookId:m['book_id'] as int?,topic:m['topic'] as String,rating:m['rating'] as int,notes:m['notes'] as String? ?? '',imagePath:m['image_path'] as String?,audioPath:m['audio_path'] as String?,evaluatedAt:DateTime.parse(m['evaluated_at'] as String));
}
