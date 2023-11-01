import '../Mode/ModCategories.dart';
import '../Mode/ModDiet.dart';
import '../Mode/ModPopuler.dart';

class VM_Home{

  List<CategoryModel>? l_ListCategoryModel = [];
  List<DietModel>? l_DietModel = [];
  List<PopularDietsModel> l_PopularDiets = [];

  void getdata() {
    l_ListCategoryModel = CategoryModel.getCategories();
  }

  void getdiets() {
    l_DietModel = DietModel.getDiets();
  }

  void getPopulerdiets() {
    l_PopularDiets = PopularDietsModel.getPopularDiets();
  }

}