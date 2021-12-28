import 'package:agenna/app/services/connectivity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:agenna/app/models/visiting_model.dart';
import 'package:agenna/app/repositories/user_repository.dart';
import 'package:agenna/app/repositories/visiting_repository.dart';
import 'package:agenna/app/widgets/ui_function.dart';

class HomeController extends GetxController{
final isloading=false.obs;

VisitingRepository? _visitingRepository;
final visiting =<Visiting_model>[].obs;
final userparam=''.obs;
final usertoken=''.obs;

 final box=GetStorage();
  HomeController(){
    _visitingRepository=VisitingRepository();

  }

  @override
  Future<void> onInit() async {

    userparam.value=box.read('unique_id');
    usertoken.value=box.read('token');
    isloading.value=true;
    await Getvistings(userparam.value.toString(),usertoken.value.toString());

    super.onInit();
    isloading.value=false;
  }

  Future refreshHome({bool showMessage = false}) async {
    isloading.value=true;
    await Getvistings(userparam.value.toString(),usertoken.value.toString());
    isloading.value=false;
    if (showMessage) {
      Get.showSnackbar(UiFunction.SuccessSnackBar(message: "Home page refreshed successfully".tr));
    }
  }


  Future Getvistings(String param,String token) async{

    try{

      visiting.value = await _visitingRepository!.VisitingsList(param.toString(),token.toString());

    }catch(e){
      if(Get.find<ConnetivityController>().connectionStatus==0)
      {
        Get.showSnackbar(UiFunction.ErrorSnackBar(message: "no internet".tr));
      }
      else {
        Get.showSnackbar(UiFunction.ErrorSnackBar(message: e.toString()));
      }

    }
  }
}