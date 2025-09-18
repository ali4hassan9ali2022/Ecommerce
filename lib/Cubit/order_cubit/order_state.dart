import 'package:e_commerce/Models/order_model.dart';

abstract class OrderState {}

class OrderInitialState extends OrderState {}

class LoadingOrderState extends OrderState {}

class SuccessOrderState extends OrderState {
  SuccessOrderState();
}

class FailureOrderState extends OrderState {
  final String errMessage;

  FailureOrderState({required this.errMessage});
}

class LoadingFetchOrderState extends OrderState {}

class SuccessFetchOrderState extends OrderState {
  final List<OrderModel> orders;
  SuccessFetchOrderState({required this.orders});
}

class FailureFetchOrderState extends OrderState {
  final String errMessage;

  FailureFetchOrderState({required this.errMessage});
}
