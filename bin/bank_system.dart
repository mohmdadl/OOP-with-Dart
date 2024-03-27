import 'dart:io';
import 'bank_account.dart';
import 'client.dart';
import 'savings_bank_account.dart';

void main() {
  System system = System();
  system.showMenu();
}

class System {
  late List<BankAccount> accounts;
  late List<Client> clients;

  System() {
    accounts = [];
    clients = [];
    showMenu();
  }

  void showMenu() {
    while (true) {
      print('How Can We Help You ?');
      print('1-Create Account ');
      print('2-Show All Accounts Details');
      print('3-Show My Account Details');
      print('4-Remove My Account');
      print('5-Withdraw Money');
      print('6-Deposit Money');
      print('7-Exit');
      print('Enter Your Choice ..');
      int input = int.parse(stdin.readLineSync()!);
      if (input == 1) {
        print('Create Account option selected');
        createAccount();
      }
      else if (input == 2) {
        print('Show All Accounts Details option selected');
        showAll();
      } else if (input == 3) {
        print('Show My Account Details option selected');
        showMyAccountDetails();
      } else if (input == 4) {
        print('Remove My Account option selected');
        removeAccount();

      } else if (input == 5) {
        print('Withdraw Money option selected');
        withdraw();
      } else if (input == 6) {
        print('Deposit Money option selected');
        deposit();
      } else if (input == 7) {
        print('Exiting...');
        return;
      } else {
        print('Invalid option, please try again.');
      }
    }
  }

  // addTestData() {
  //   for (int i = 0; i < 20; i++) {
  //     BankAccount bankAccount = BankAccount(Balance: i * 20);
  //     Client client = Client(
  //         phone: '01152649782', name: 'client${i + 1}', address: 'address');
  //
  //     bankAccount.owner = client;
  //     client.myAccount = bankAccount;
  //
  //     accounts.add(bankAccount);
  //     clients.add(client);
  //   }
  //   // print('clients:${clients.length},accounts:${accounts.length}');
  // }

  createAccount() {
    //clientData
    print('Ok lets collect some information about you to create a new account for you .. ');
    print('what is your third name?');
    String name=stdin.readLineSync()!;
    print('what is your phone number?');
    String phone=stdin.readLineSync()!;
    print('what is your address?');
    String address=stdin.readLineSync()!;
    Client newclient=Client(phone: phone, name: name, address: address);
    //Account
    print('Cool! how much initial balance you want to deposit,sir?');
    double initialBalane=double.parse(stdin.readLineSync()!);
    BankAccount newAccount=BankAccount(Balance: initialBalane);
    //pointers
    newclient.myAccount=newAccount;
    newAccount.owner=newclient;
    //add in list
    accounts.add(newAccount);
    clients.add(newAccount.owner);//or newclient direct .
    print('congratulations! your account is created successfully,\nwith ${newAccount.Balance}pound as initial balance\nand account ID ${newAccount.ID}.\n=======================');
  }

  showAll() {
    for (int i = 0; i < accounts.length; i++) {
      accounts[i].view();
      print('=============');
    }
  }

  showMyAccountDetails() {
    print('for search by ID enter(1) and for search by name enter(2) ');
    int input = int.parse(stdin.readLineSync()!);
    if (input == 1) {
      searchByID();
    } else if (input == 2) {
      searchByName();
    } else {
      print('invalid input!');
    }
  }

  searchByID() {
    print("Please Enter Your ID:");
    int input = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < accounts.length; i++) {
      if (input == accounts[i].ID) {
        accounts[i].view();
        return;
      }
    }
    print('invalid ID !');
    return;
  }

  searchByName() {
    print("Please Enter Your Name:");
    String input = stdin.readLineSync()!;
    for (int i = 0; i < 20; i++) {
      if (input == accounts[i].owner.name) {
        accounts[i].view();
        return;
      }
    }
    print('invalid name! try again at another time.');
    return;
  }

  removeAccount() {
    print("Please Enter Your Account ID:");
    int input = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < accounts.length; i++) {
      if (input == accounts[i].ID) {
        accounts.removeAt(i);
        clients.removeAt(i);
        print('account deleted successfully');
        return;
      }
    }
    print('invalid input!');
    return;
  }

  withdraw_basic() {
    print("Please Enter Your Account ID:");
    int inputID = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < accounts.length; i++) {
      if (inputID == accounts[i].ID) {
        print('Please Enter the amount you need to withdraw:');
        double amount = double.parse(stdin.readLineSync()!);
        accounts[i].withdraw(amount);
        return;
      }
    }
    print('invalid ID!');
    return;
  }

  withdraw_saving() {
    SavingsBankAccount savingBankAccount = SavingsBankAccount();
    Client client =
        Client(phone: '0100000', name: 'rich man', address: 'elrhamna');
    savingBankAccount.owner = client;
    client.myAccount = savingBankAccount;

    print("Please Enter Your Account ID:");
    int inputID = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < accounts.length; i++) {
      if (inputID == accounts[i].ID) {
        accounts[i] = savingBankAccount;

        print('Please Enter the amount you need to deposit:');
        double amount = double.parse(stdin.readLineSync()!);

        savingBankAccount.deposit(amount);
        return;
      }
    }
    print('invalid ID !');
    return;
  }

  withdraw() {
    print('enter 1 for Basic Bank Account\nenter 2 for Saving Bank Account');
    int accountKind = int.parse(stdin.readLineSync()!);

    if (accountKind == 1) {
      withdraw_basic();
    } else if (accountKind == 2) {
      withdraw_saving();
    } else {
      print('invalid number!');
    }
  }

  deposit_basic() {
    print("Please Enter Your Account ID:");
    int inputID = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < accounts.length; i++) {
      if (inputID == accounts[i].ID) {
        print('Please Enter the amount you need to deposit:');
        double amount = double.parse(stdin.readLineSync()!);
        accounts[i].deposit(amount);
        return;
      }
    }
    print('invalid ID!');
    return;
  }

  deposit_saving() {
    SavingsBankAccount savingBankAccount = SavingsBankAccount();
    Client client =
        Client(phone: '0100000', name: 'rich man', address: 'elrhamna');
    savingBankAccount.owner = client;
    client.myAccount = savingBankAccount;

    print("Please Enter Your Account ID:");
    int inputID = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < accounts.length; i++) {
      if (inputID == accounts[i].ID) {
        accounts[i] = savingBankAccount;
        print('Please Enter the amount you need to withdraw:');
        double amount = double.parse(stdin.readLineSync()!);

        savingBankAccount.deposit(amount);
        return;
      }
    }
    print('invalid ID!');
    return;
  }

  deposit() {
    print('enter 1 for Basic Bank Account\nenter 2 for Saving Bank Account');
    int accountKind = int.parse(stdin.readLineSync()!);

    if (accountKind == 1) {
      deposit_basic();
    } else if (accountKind == 2) {
      deposit_saving();
    } else {
      print('invalid number!');
    }
  }
}
