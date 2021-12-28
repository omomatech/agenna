import 'package:agenna/app/models/notefication.dart';
import 'package:agenna/app/repositories/note_repository.dart';
import 'package:agenna/app/services/connectivity.dart';
import 'package:agenna/app/widgets/ui_function.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NoteListController extends GetxController{
  final urlimage="http://ec2-3-15-175-95.us-east-2.compute.amazonaws.com:8000";
  final notes =<NoteficationModel>[].obs;
  NoteRepository? _noteRepository;
  final isloading=false.obs;
  final token=''.obs;
  final box=GetStorage();
  NoteListController(){
    _noteRepository=NoteRepository();
  }

  @override
  Future<void> onInit() async {
   token.value =await box.read('token');
   await Getnotes(token.value.toString());
    super.onInit();
  }
  Future RefreshNote({bool showMessage = false}) async {
    isloading.value=true;
    await Getnotes(token.value.toString());
    isloading.value=false;
    if (showMessage) {
      Get.showSnackbar(UiFunction.SuccessSnackBar(message: "Home page refreshed successfully".tr));
    }
  }

  Future Getnotes(String token) async{

    try{

      notes.value = await _noteRepository!.NoteList(token);

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