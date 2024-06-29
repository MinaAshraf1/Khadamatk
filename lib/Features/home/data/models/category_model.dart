class Category {
  final int id;
  final String name;
  final String imageUrl;
  const Category(
      {required this.id, required this.imageUrl, required this.name});
  static const List<Category> categories = [
    Category(
      id: 1,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREmaRtPeXW39hx9xYYgNmVLGpqIafJUYwDNg&s',
      name: 'معامل تحاليل',
    ),
    Category(
      id: 2,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYGR9E4eLktrvpCeoS9N7VafEF5npvnW4zA&s',
      name: 'صيدليات',
    ),
    Category(
      id: 3,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEmTokcY-ssy44ykysFt3gKSWjKtwlvq3Y5g&s',
      name: 'دكاتره',
    ),
    Category(
      id: 4,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo8dYljt_z0X12FoBlTG3JQ-utUTelcYbffw&s',
      name: 'بلاستيشن',
    ),
    Category(
      id: 5,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrD7tFDch_wzVpRKJb9hpzs3eX2WBitjTZ3w&s',
      name: 'مطاعم',
    ),
    Category(
      id: 6,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKxzdJsDtpaiPkb4F-OevoHZfdtY5URsfjUw&s',
      name: 'سوبر ماركت',
    ),
    Category(
      id: 7,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIOqyIB9op-Cq_Z_IhZwE7VPGrWl2NMY7Png&s',
      name: 'ورك سبيس',
    ),
  ];
}
