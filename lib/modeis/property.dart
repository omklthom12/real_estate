// lib/models/property.dart

class Property {
  // الخصائص الأساسية التي تمثل أعمدة الجدول أو حقول المستند
  final String id;
  final String title;
  final String description;
  final String location;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final String imageUrl;
  final bool isForRent; // للإيجار أم للبيع

  // دالة البناء (Constructor) لإنشاء كائن العقار
  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.imageUrl,
    required this.isForRent,
  });

  // دالة لتحويل كائن العقار إلى Map، وهو ما تحتاجه للتعامل مع Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'imageUrl': imageUrl,
      'isForRent': isForRent,
    };
  }

  // دالة عكسية لتحويل البيانات المسترجعة من القاعدة إلى كائن عقار
  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      bedrooms: map['bedrooms'] ?? 0,
      bathrooms: map['bathrooms'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      isForRent: map['isForRent'] ?? false,
    );
  }
}