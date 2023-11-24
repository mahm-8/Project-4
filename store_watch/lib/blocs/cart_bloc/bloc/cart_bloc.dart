import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/global.dart';
import '../../../models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddCartEvent>((event, emit) {
      if (!orderProducts.contains(event.product)) {
        orderProducts.add(event.product);
      } else {
        event.product.count = event.product.count! + 1;
      }
    });
    on<IncreaseEvent>((event, emit) {
      double price = double.parse(event.product.price);
      event.product.count = event.product.count + 1;

      price =
          (double.parse(event.product.price) * event.product.count.toDouble());
      emit(PriceState(price));
    });
    on<DecreaseEvent>((event, emit) {
      double price = double.parse(event.product.price);
      if (event.product.count! > 1) {
        event.product.count = event.product.count - 1;
        price = (double.parse(event.product.price) *
            event.product.count.toDouble());
        emit(PriceState(price));
      }
    });
    on<DeleteCartEvent>((event, emit) {
      event.product.count = 0;
      globalPrice = globalPrice -
          (double.parse(event.product.price) * event.product.count!);
      orderProducts.remove(event.product);
      emit(CartInitial());
    });
    on<DecreaseDeleteEvent>((event, emit) {
      if (event.product.count! > 1) {
        event.product.count = event.product.count! - 1;
        globalPrice -= double.parse(event.product.price);
      } else if (event.product.count! == 1) {
        event.product.count = 0;
        globalPrice = globalPrice -
            (double.parse(event.product.price) * event.product.count!);
        orderProducts.remove(event.product);
      }
      emit(CartInitial());
    });
  }
}
