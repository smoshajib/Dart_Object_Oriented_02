abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$${amount.toStringAsFixed(2)}');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      balance += balance * interestRate;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance + overdraftLimit >= amount) {
      balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

void main() {
  // Create a SavingsAccount instance
  SavingsAccount savingsAccount = SavingsAccount(123456, 1000.0, 0.05);

  // Deposit and withdraw from savings account
  savingsAccount.deposit(500.0);
  savingsAccount.withdraw(200.0);

  // Create a CurrentAccount instance
  CurrentAccount currentAccount = CurrentAccount(987654, 2000.0, 1000.0);

  // Deposit and withdraw from current account
  currentAccount.deposit(1000.0);
  currentAccount.withdraw(3000.0);
}
