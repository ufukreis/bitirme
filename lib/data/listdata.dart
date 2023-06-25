import 'package:bitirme/data/1.dart';

List<money> geter() {
  money food = money();
  food.name = 'yemek';
  food.fee = '6';
  food.time = 'bugün';
  food.image = 'food.png';
  food.buy = false;
  money burgerking = money();
  burgerking.name = 'burgerking';
  burgerking.fee = '100';
  burgerking.time = '11.06.2023';
  burgerking.image = 'bk.png';
  return [food, burgerking];
}
