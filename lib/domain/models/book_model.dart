class BookModel {
  final num? id;
  final String? bookId;
  final String? author;
  final String? title;
  final String? description;
  final String? isn;
  final String? isbn;
  final String? cover;
  final String? downloadLink;
  final num? cost;
  final num? categoryId;
  final num? subCategoryId;
  final String? contentType;
  final num? userId;
  final String? uploadedBy;
  final num? status;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? visibilityStatus;
  final DateTime? deleteDate;
  final String? language;
  final String? isFree;
  final String? pubYear;
  final String? publisher;
  final num? readTime;
  final num? amountEarned;
  final num? pages;
  final String? bookType;
  final String? bookEarning;
  // final UserModel? user;

  BookModel({
    this.id,
    this.bookId,
    this.author,
    this.title,
    this.description,
    this.isn,
    this.isbn,
    this.cover,
    this.downloadLink,
    this.cost,
    this.categoryId,
    this.subCategoryId,
    this.contentType,
    this.userId,
    this.uploadedBy,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.visibilityStatus,
    this.deleteDate,
    this.language,
    this.isFree,
    this.pubYear,
    this.publisher,
    this.readTime,
    this.amountEarned,
    this.pages,
    this.bookType,
    this.bookEarning,
    // this.user,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      bookId: json['book_id'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      isn: json['isn'],
      isbn: json['ISBN'],
      cover: json['cover'],
      downloadLink: json['download_link'],
      cost: json['cost'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      contentType: json['content_type'],
      userId: json['user_id'],
      uploadedBy: json['uploaded_by'],
      status: json['status'],
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      visibilityStatus: json['visibility_status'],
      deleteDate: json['delete_date'] != null
          ? DateTime.parse(json['delete_date'])
          : null,
      language: json['language'],
      isFree: json['isFree'],
      pubYear: json['pub_year'],
      publisher: json['publisher'],
      readTime: json['readtime'],
      amountEarned: json['amountearned'],
      pages: json['pages'],
      bookType: json['book_type'],
      bookEarning: json['book_earning'],
      // user: UserModel.fromJson(json['user']),
    );
  }
}
