import 'bank_account.dart';
import 'client.dart';

class SavingsBankAccount extends BankAccount {
  double minimumBalance;
  late Client owner;

  SavingsBankAccount({this.minimumBalance = 1000, double Balance = 1000})
      : super(Balance: Balance);

  @override
  double withdraw(double amount) {
    if ((amount + minimumBalance) > Balance) {
      print(
          'not sufficient balance\nminimum balance:$minimumBalance\nBalance:$Balance');

      return 0;
    }
    return super.withdraw(amount);
  }

  @override
  double deposit(double amount) {
    if(amount<100){
      print('the amount to deposit is 100 or more');
      return 0;
    }
    return super.deposit(amount);
  }

@override
  void view() {
    print('minimum balance: $minimumBalance');
    super.view();
  }
  
}
