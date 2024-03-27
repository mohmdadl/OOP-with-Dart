import 'client.dart';

class BankAccount {
  late int ID;
  double Balance;
  static int id_generator=1;
  late Client owner;

  BankAccount({this.Balance = 0}){
    ID=id_generator;
    id_generator++;
  }

  double withdraw(double amount) {
    if (amount <= 0) {
      print('invalid value to withdraw');
      return 0;
    } else if (amount <= Balance) {
      Balance -= amount;
      print('withdraw done Successfully');
      return Balance;
    }else{
      print('not sufficient balance');
      return Balance;
    }

  }

  double deposit(double amount) {
    if (amount <= 0) {
      print('invalid value to deposit');
      return 0;
    }
    Balance += amount;
    print('deposit done successfully');
    return Balance;
  }

  void view(){
    print('Account ID: $ID');
    print('Account Balance: $Balance');
    owner.view();
  }
}
