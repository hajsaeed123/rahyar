import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import '../models/book.dart'; import '../models/study_session.dart'; import '../models/topic_evaluation.dart';
class DbHelper {
 DbHelper._(); static final DbHelper instance=DbHelper._(); Database? _db;
 Future<Database> get database async { if(_db!=null)return _db!; final base=await getDatabasesPath(); _db=await openDatabase(p.join(base,'rahyar_study.db'),version:1,onCreate:(db,_) async {
 await db.execute('CREATE TABLE books(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT NOT NULL,author TEXT NOT NULL DEFAULT "",color INTEGER NOT NULL DEFAULT 0,goal_minutes INTEGER NOT NULL DEFAULT 30,created_at TEXT NOT NULL)');
 await db.execute('CREATE TABLE sessions(id INTEGER PRIMARY KEY AUTOINCREMENT,book_id INTEGER,book_title TEXT,start_at TEXT NOT NULL,end_at TEXT NOT NULL,note TEXT NOT NULL DEFAULT "",FOREIGN KEY(book_id) REFERENCES books(id) ON DELETE SET NULL)');
 await db.execute('CREATE TABLE evaluations(id INTEGER PRIMARY KEY AUTOINCREMENT,book_id INTEGER,topic TEXT NOT NULL,rating INTEGER NOT NULL CHECK(rating BETWEEN 1 AND 5),notes TEXT NOT NULL DEFAULT "",image_path TEXT,audio_path TEXT,evaluated_at TEXT NOT NULL,FOREIGN KEY(book_id) REFERENCES books(id) ON DELETE SET NULL)'); await db.execute('CREATE INDEX sessions_start_idx ON sessions(start_at)'); await db.execute('CREATE INDEX eval_date_idx ON evaluations(evaluated_at)'); }); return _db!; }
 Future<int> createBook(Book x)async=>(await database).insert('books',x.toMap()..remove('id'));
 Future<List<Book>> getBooks()async=>(await (await database).query('books',orderBy:'created_at DESC')).map(Book.fromMap).toList();
 Future<int> updateBook(Book x)async=> (await database).update('books',x.toMap()..remove('id'),where:'id=?',whereArgs:[x.id]);
 Future<int> deleteBook(int id)async=>(await database).delete('books',where:'id=?',whereArgs:[id]);
 Future<int> createSession(StudySession x)async=>(await database).insert('sessions',x.toMap()..remove('id'));
 Future<List<StudySession>> getSessions({int? bookId})async=>(await (await database).query('sessions',where:bookId==null?null:'book_id=?',whereArgs:bookId==null?null:[bookId],orderBy:'start_at DESC')).map(StudySession.fromMap).toList();
 Future<int> updateSession(StudySession x)async=>(await database).update('sessions',x.toMap()..remove('id'),where:'id=?',whereArgs:[x.id]);
 Future<int> deleteSession(int id)async=>(await database).delete('sessions',where:'id=?',whereArgs:[id]);
 Future<int> createEvaluation(TopicEvaluation x)async{if(x.rating<1||x.rating>5)throw ArgumentError('rating must be 1..5');return (await database).insert('evaluations',x.toMap()..remove('id'));}
 Future<List<TopicEvaluation>> getEvaluations({int? bookId})async=>(await (await database).query('evaluations',where:bookId==null?null:'book_id=?',whereArgs:bookId==null?null:[bookId],orderBy:'evaluated_at DESC')).map(TopicEvaluation.fromMap).toList();
 Future<int> updateEvaluation(TopicEvaluation x)async=>(await database).update('evaluations',x.toMap()..remove('id'),where:'id=?',whereArgs:[x.id]);
 Future<int> deleteEvaluation(int id)async=>(await database).delete('evaluations',where:'id=?',whereArgs:[id]);
 Future<void> close()async{await _db?.close();_db=null;}
}
