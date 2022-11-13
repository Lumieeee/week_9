import 'package:get/get.dart';
import 'package:minggu_9/model/product.dart';

class Purchase extends GetxController{
  var products = <Product>[].obs;
  @override
  void onInit(){
    fetchProduct();
    super.onInit();
  }

  void fetchProduct()async{
    await Future.delayed(Duration(seconds: 1));

    var serverResponse = [
      Product(1, 'PDIP', 'aby', 'This is Product that we are going to show by getX', 300.0),
      Product(1, 'Demokrat', 'aby', 'This is Product that we are going to show by getX', 300.0),
      Product(1, 'Golkar', 'aby', 'This is Product that we are going to show by getX', 300.0),
      Product(1, 'Perindo', 'aby', 'This is Product that we are going to show by getX', 300.0),
      Product(1, 'PKS', 'aby', 'This is Product that we are going to show by getX', 300.0),
      Product(1, 'PSI', 'aby', 'This is Product that we are going to show by getX', 300.0),
    ];

    products.value = serverResponse;
  }

}