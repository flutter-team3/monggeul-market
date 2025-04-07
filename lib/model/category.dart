enum Category {
  lizard('도마뱀', 'assets/images/lizard.png'),
  hedgehog('고슴도치', 'assets/images/hedgehog.png'),
  stagBeetle('사슴벌레', 'assets/images/stag_beetle.png'),
  parrot('앵무새', 'assets/images/parrot.png'),
  raccoon('라쿤', 'assets/images/raccoon.png');

  final String label; // Korean name
  final String imgPath;
  const Category(this.label, this.imgPath);
}
