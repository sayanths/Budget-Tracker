
import 'package:money_management_app1/screens/transaction_model/transaction_model.dart';


String chartdrop = 'todayIncomeNotifier';

class ChartData {
  String? categories;
  double? amount;
  ChartData({required this.categories, required this.amount});
}

chartLogic(List<TransactionModel> model) {
  double value;
  String categoryName;
  List visited = [];
  List<ChartData> thedata = [];
  for (var i = 0; i < model.length; i++) {
    visited.add(0);
  }

  for (var i = 0; i < model.length; i++) {
    value = model[i].amount;
    categoryName = model[i].category.name;

    for (var j = i + 1; j < model.length; j++) {
      if (model[i].category.name == model[j].category.name) {
        value += model[j].amount;
        visited[j] = -1;
      }
    }
    if (visited[i] != -1) {
      thedata.add(ChartData(categories: categoryName, amount: value));
    }
  }
  return thedata;
}
