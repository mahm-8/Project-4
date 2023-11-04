import 'package:store_watch/models/customer.dart';
import 'package:store_watch/models/product.dart';

List<Customer> customerList = [];
late Customer currentCustomer;



List<Product> orderProducts = [];
List<Product> listProduct = [];
double globalPrice = 0;
void calculateGlobalPrice() {
  globalPrice = 0;
  for (var element in listProduct) {
    globalPrice += element.count! * double.parse(element.price);
  }
}

void calculateGlobalPric() {
  globalPrice = 0;
  for (var element in orderProducts) {
    globalPrice += element.count! * double.parse(element.price);
  }
}