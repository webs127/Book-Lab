class VolumeInfo {
  final String title;
  final String? subtitle;
  final List authors;
  final int? pageCount;
  final String? description;
  VolumeInfo(
      {required this.title, required this.subtitle, required this.authors, required this.pageCount, required this.description});

  factory VolumeInfo.fromJson(Map<String, dynamic> volume) => VolumeInfo(
      title: volume["title"],
      subtitle: volume["subtitle"],
      authors: volume["authors"]??["NA"],
    pageCount: volume["pageCount"], 
    description: volume["description"]
  );
}

class Items {
  final VolumeInfo volumeinfo;
  final String id;

  Items({required this.id, required this.volumeinfo});

  factory Items.fromJson(Map<String, dynamic> items) => Items(
      id: items["id"], volumeinfo: VolumeInfo.fromJson(items["volumeInfo"]));
}

class Book {
  final List<Items> items;
  final int total;

  Book({required this.items, required this.total});

  factory Book.fromJson(Map<String, dynamic> books) {
    var list = books["items"] as List;
    List<Items> items = list.map((e) => Items.fromJson(e)).toList();
    return Book(
      total: books["totalItems"],
      items: items,
    );
  }
}
