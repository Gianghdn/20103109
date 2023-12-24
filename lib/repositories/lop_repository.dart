


import 'package:connettion/models/lop.dart';
import 'package:connettion/services/api_services.dart';

class LopRepository {
  

  Future<List<Lop>>getDslop() async {
    List<Lop> list = [];
    list.add(Lop(ten: "--hãychọn--"));
    final response = await ApiService().getDslop() ; // replace with your API URL
    
    
    if(response !=null){
      var data = response.data['data'];
      for (var item in data){
        var lop = Lop.fromJson(item);
        list.add(lop);
      }
      //Profile().student = Student.fromStudent(student);
    }
    return list;
  }

}
