import '../../model/category.dart';
import '../../model/product.dart';

class AppConstants {
  static List<Product> productList = [
    // 도마뱀
    Product(
      name: '도마뱀 전용 사료팩',
      description: '도마뱀이 먹기 좋은 영양 가득 사료입니다.',
      price: 15000,
      category: Category.lizard,
    ), // Lizard Food Pack
    Product(
      name: '히트 램프 전구',
      description: '테라리움 내 적정 온도를 유지해주는 전용 전구입니다.',
      price: 22000,
      category: Category.lizard,
    ), // Heat Lamp Bulb
    Product(
      name: '전용 물그릇',
      description: '도마뱀이 편하게 사용할 수 있는 얕은 물그릇입니다.',
      price: 7000,
      category: Category.lizard,
    ), // Lizard Water Dish

    // 고슴도치
    Product(
      name: '고슴도치 전용 건사료',
      description: '고슴도치를 위한 균형 잡힌 건사료입니다.',
      price: 14000,
      category: Category.hedgehog,
    ), // Hedgehog Dry Food
    Product(
      name: '고슴도치 전용 샴푸',
      description: '피부에 자극이 없는 순한 샴푸입니다.',
      price: 9000,
      category: Category.hedgehog,
    ), // Hedgehog Shampoo

    // 사슴벌레
    Product(
      name: '사슴벌레 먹이젤리',
      description: '사슴벌레 전용 과일맛 젤리입니다.',
      price: 5000,
      category: Category.stagBeetle,
    ), // food
    Product(
      name: '작은 통나무 장난감',
      description: '사슴벌레가 기어다니기 좋은 통나무입니다.',
      price: 7000,
      category: Category.stagBeetle,
    ), // toy

    // 앵무새
    Product(
      name: '앵무새 씨앗 믹스',
      description: '앵무새가 좋아하는 곡물로 구성된 사료입니다.',
      price: 13000,
      category: Category.parrot,
    ), // Parrot Seeds Mix
    Product(
      name: '그네 장난감',
      description: '앵무새의 운동과 놀이를 위한 로프 그네입니다.',
      price: 10000,
      category: Category.parrot,
    ), // Swing Toy

    // 라쿤
    Product(
      name: '라쿤 간식팩',
      description: '고기 풍미 가득한 라쿤 전용 간식입니다.',
      price: 11000,
      category: Category.raccoon,
    ), // Raccoon Treats
    Product(
      name: '라쿤 전용 침대',
      description: '포근하고 넓은 실내용 침대입니다.',
      price: 27000,
      category: Category.raccoon,
    ), // Raccoon Bed
  ];

}