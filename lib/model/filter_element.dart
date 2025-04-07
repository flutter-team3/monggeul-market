import 'package:monggeul_market/model/category.dart';

class FilterElement {
  String word;
  Category? category;
  FilterElement(this.word, this.category);

  FilterElement changeCategory(Category? category){
    this.category = category;
    return resetWord();
  }

  FilterElement resetWord(){
    word = '';
    return this;
  }

  FilterElement setWord(String word){
    this.word = word;
    return this;
  }
}