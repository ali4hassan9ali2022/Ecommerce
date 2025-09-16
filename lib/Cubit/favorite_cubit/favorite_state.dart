abstract class FavoriteState {}
class FavoriteInitial extends FavoriteState{}
class LoadingAddProductToFavoriteState extends FavoriteState{
  final List<String> productId;


  LoadingAddProductToFavoriteState({required this.productId});}
class SuccessAddProductToFavoriteState extends FavoriteState{
  final String productId;

  SuccessAddProductToFavoriteState({required this.productId});
}
class FailureAddProductToFavoriteState extends FavoriteState{
  final String errMessage;

  FailureAddProductToFavoriteState({required this.errMessage});
}
class SuccessRemoveProductFromFavoriteState extends FavoriteState{
  final String productId;

  SuccessRemoveProductFromFavoriteState({required this.productId});
}