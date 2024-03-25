import 'bank_account.dart';

class Client{
  String name;
  String address;
  String phone;
  late BankAccount myAccount;

  Client({required this.phone,required this.name,required this.address});
  
}