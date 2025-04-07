# 몽글마켓 - 반려동물 용품 쇼핑몰 앱

<p align="center">
  <img src="assets/images/app_icon.png" alt="몽글마켓 앱 아이콘" width="150"/>
</p>

## 📌 프로젝트 소개

이 프로젝트는 Flutter 기반의 반려동물 용품 쇼핑몰 애플리케이션입니다. 사용자는 카테고리별로 상품을 탐색하고, 장바구니에 담아 구매할 수 있는 쇼핑 경험을 제공합니다. 특히 다양한 반려동물 종류(고슴도치, 도마뱀, 앵무새, 너구리, 사슴벌레)에 맞춘 용품을 카테고리별로 제공하여 특별한 반려동물을 위한 상품을 쉽게 찾을 수 있습니다.

## 📱 스크린샷

<div style="display: flex; overflow-x: auto; border: 2px solid #ccc; padding: 6px; border-radius: 8px;">  
  <img src="images/1.png" width="240" style="margin-right: 5px;" />  
  <img src="images/2.png" width="240" style="margin-right: 5px;" />  
  <img src="images/3.png" width="240" style="margin-right: 5px;" />  
  <img src="images/4.png" width="240" style="margin-right: 5px;" />  
  <img src="images/5.png" width="240" style="margin-right: 5px;" />  
  <img src="images/6.png" width="240" style="margin-right: 5px;" />  
  <img src="images/7.png" width="240" style="margin-right: 5px;" />  
  <img src="images/8.png" width="240" style="margin-right: 5px;" />  
  <img src="images/9.png" width="240" />  
</div>

## 🎯 주요 기능

- **상품 목록 표시**: 모든 상품을 리스트 형태로 보여주며, 각 상품은 이미지, 이름, 가격을 포함합니다.
- **카테고리별 필터링**: `drawer` 메뉴에서 카테고리를 선택하여 해당 카테고리의 상품만 볼 수 있습니다.
- **상품 상세 정보**: 상품을 클릭하면 상세 정보 페이지로 이동하여 자세한 설명을 볼 수 있습니다.
- **수량 조절**: 상세 페이지에서 + 및 - 버튼으로 구매할 상품 수량을 조절할 수 있습니다.
- **장바구니 기능**: 상품을 장바구니에 담고, 수량을 변경하거나 삭제할 수 있습니다.
- **상품 등록**: 새로운 상품을 등록할 수 있는 기능을 제공합니다.
- **구매 프로세스**: 장바구니 내에서 구매 버튼을 통해 구매 프로세스를 시작할 수 있습니다.

## ✨ 추가 기능

### 1. 상태 관리

- **Provider 패턴**: InheritedWidget 기반의 상태 관리 패턴을 구현하여 앱 전체에서 상품 및 장바구니 상태를 효율적으로 관리합니다.
- **필터링 시스템**: 카테고리별 상품 필터링 기능을 제공하여 사용자가 원하는 종류의 상품만 쉽게 찾을 수 있습니다.

### 2. 향상된 UI/UX

- **이미지 캐싱**: `CachedNetworkImage`를 활용하여 이미지 로딩을 커스터마이징하고 데이터 사용량을 절약합니다.
- **로딩 인디케이터**: 이미지 로딩 중에 로딩 인디케이터를 표시하여 사용자 경험을 개선합니다.
- **애니메이션**: 장바구니가 비어있을 때 Lottie 애니메이션을 표시하여 시각적 피드백을 제공합니다.

### 3. 구매 연동 기능

- **외부 쇼핑 플랫폼 연결**: 구매 버튼 클릭 시 네이버 쇼핑 홈페이지로 이동하여 관련 상품을 검색할 수 있는 기능을 제공합니다.
- **URL 런처**: `url_launcher` 패키지를 활용하여 외부 웹사이트 연결을 구현합니다.

### 4. 카테고리 시스템

- **시각적 카테고리**: 각 카테고리별 아이콘과 레이블을 제공하여 직관적인 탐색 경험을 제공합니다.
- **드로어 메뉴**: 측면 드로어에서 카테고리를 선택할 수 있어 사용자가 쉽게 상품을 필터링할 수 있습니다.

### 5. 유틸리티 기능

- **가격 포맷팅**: 숫자를 한국 원화 형식(예: 15,000원)으로 포맷팅하는 유틸리티 함수를 제공합니다.
- **팝업**: 재사용 가능한 알림 팝업을 통해 사용자에게 일관된 피드백을 제공합니다.

## 📋 프로젝트 구조

```
lib/
├── app/                       # 앱 전체에서 재사용 가능한 설정 및 파일
│   ├── constants/             # 앱 상수 정의
│   │   ├── app_colors.dart    # 색상 정의
│   │   ├── app_constants.dart # 상수 값 정의
│   │   └── app_styles.dart    # 스타일 정의
│   └── app_theme.dart         # 앱 테마 설정
│
├── model/                     # 데이터 모델
│   ├── product.dart           # 상품 모델
│   ├── category.dart          # 카테고리 모델
│   └── cart_item.dart         # 장바구니 아이템 모델
│
├── provider/                  # 상태 관리
│   ├── cart_provider.dart     # 장바구니 상태 관리
│   └── product_provider.dart  # 상품 상태 관리
│
├── ui/                        # 사용자 인터페이스
│   ├── home/                  # 홈 화면
│   │   ├── home_page.dart
│   │   └── widgets/
│   │       ├── product_list_widget.dart
│   │       └── product_for_list.dart
│   │
│   ├── product_detail/        # 상품 상세 페이지
│   │   ├── product_detail_page.dart
│   │   └── widgets/
│   │       └── template.dart
│   │
│   ├── product_register/      # 상품 등록 페이지
│   │   └── product_register_page.dart
│   │
│   └── cart/                  # 장바구니 페이지
│       ├── cart_page.dart
│       └── widgets/
│           ├── total_price_row.dart
│           └── cart_item_texts.dart
│
├── util/                      # 유틸리티 함수
│   └── util.dart
│
├── widgets/                   # 공통 위젯
│   ├── app_cached_image.dart  # 이미지 캐싱 위젯
│   └── cart_item_amount.dart  # 수량 조절 위젯
│
└── main.dart                  # 앱 진입점
```

## 📦 의존성 패키지

프로젝트에서 사용된 주요 패키지:

- **intl**: 국제화 및 포맷팅 지원
- **lottie**: 애니메이션 표시
- **url_launcher**: 외부 URL 및 앱 실행 지원
- **cached_network_image**: 네트워크 이미지 캐싱
- **flutter_native_splash**: 네이티브 스플래시 화면 구현

## 👥 팀원

| 이름                           | GitHub                                      |
| ---------------------------- | ------------------------------------------- |
| 임대한 (Penjan Antonio Eng Lim) | [daehan-lim](https://github.com/daehan-lim) |
| 유일송                          | [ilsong963](https://github.com/ilsong963)   |
| 김기현                          | [arcmee](https://github.com/arcmee)         |
| 김민지                          | [rockocell](https://github.com/rockocell)   |
| 김소희                          | [ruby400](https://github.com/ruby400)       |

## 📄 라이센스

이 프로젝트는 MIT 라이센스 하에 제공됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.