class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.subTxt1 = "",
    this.subTxt2 = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  String subTxt1;
  String subTxt2;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/images/about.jpg',
      titleTxt: 'Q /Mutoshi (Kolwezi)',
      subTxt: '333,',
      subTxt1: 'Av. Butembo,',
      subTxt2: 'C /Manika.',
      reviews: 80,
      rating: 5.0,
    ),
    HotelListData(
      imagePath: 'assets/images/about1.jpg',
      titleTxt: 'Lubumbashi',
      subTxt: '971,',
      subTxt1: 'Av. Lumumba,',
      subTxt2: 'Galerie BAM BAM.',
      reviews: 37,
      rating: 5.0,
    ),
    HotelListData(
      imagePath: 'assets/images/about2.jpg',
      titleTxt: 'Lubumbashi',
      subTxt: 'local 22,',
      subTxt1: 'Golf Mall,',
      subTxt2: 'Golf Mall Shoprite.',
      reviews: 109,
      rating: 5.0,
    ),
  ];
}
