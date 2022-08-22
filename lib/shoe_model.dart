class Shoe {
  final String title;
  final String subTitle;
  final String price;
  final String imageSrc;

  const Shoe(
      {required this.title,
      required this.subTitle,
      required this.price,
      required this.imageSrc});
}

const List<Shoe> shoes = [
  Shoe(
      imageSrc: 'assets/image/image1.png',
      title: 'Adidas',
      subTitle: 'Human Race',
      price: '\$280'),
  Shoe(
      imageSrc: 'assets/image/image2.png',
      title: 'Nike',
      subTitle: 'Joyraide',
      price: '\$320'),
  Shoe(
      title: 'Nike',
      subTitle: 'Zoom Pegasus',
      price: '\$250',
      imageSrc: 'assets/image/image3.png'),
  Shoe(
      title: 'Adidas',
      subTitle: 'Street Ball',
      price: '\$160',
      imageSrc: 'assets/image/image4.png'),
  Shoe(
      imageSrc: 'assets/image/image6.png',
      title: 'Nike',
      subTitle: 'Joyraide',
      price: '\$320'),
  Shoe(
      title: 'Nike',
      subTitle: 'Zoom Pegasus',
      price: '\$250',
      imageSrc: 'assets/image/image7.png'),
  Shoe(
      title: 'Adidas',
      subTitle: 'Street Ball',
      price: '\$160',
      imageSrc: 'assets/image/image8.png'),
  Shoe(
      imageSrc: 'assets/image/image9.png',
      title: 'Adidas',
      subTitle: 'Human Race',
      price: '\$280'),
  Shoe(
      imageSrc: 'assets/image/image10.png',
      title: 'Nike',
      subTitle: 'Joyraide',
      price: '\$320'),
  Shoe(
      title: 'Nike',
      subTitle: 'Zoom Pegasus',
      price: '\$250',
      imageSrc: 'assets/image/image11.png'),
  Shoe(
      title: 'Adidas',
      subTitle: 'Street Ball',
      price: '\$160',
      imageSrc: 'assets/image/image12.png'),
  Shoe(
      imageSrc: 'assets/image/image13.png',
      title: 'Adidas',
      subTitle: 'Human Race',
      price: '\$280'),
];
