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
