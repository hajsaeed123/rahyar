class Book {
  final int? id; final String title; final String author; final int color; final int goalMinutes; final String createdAt;
  const Book({this.id, required this.title, this.author='', this.color=0, this.goalMinutes=30, required this.createdAt});
  Map<String,Object?> toMap()=>{'id':id,'title':title,'author':author,'color':color,'goal_minutes':goalMinutes,'created_at':createdAt};
  factory Book.fromMap(Map<String,Object?> m)=>Book(id:m['id'] as int?,title:m['title'] as String,author:m['author'] as String? ?? '',color:m['color'] as int? ?? 0,goalMinutes:m['goal_minutes'] as int? ?? 30,createdAt:m['created_at'] as String);
}
