enum Category {
  lizard('도마뱀'),
  hedgehog('고슴도치'),
  stagBeetle('사슴벌레'),
  parrot('앵무새'),
  raccoon('라쿤'),
  all('전체');

  final String label; // Korean name
  const Category(this.label);
}
