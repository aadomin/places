import 'package:flutter/material.dart';

void main() async {
  testMultiplication();
  testEquality();
  testCurrency();
  testSimpleAddition();
  testPlusReturnsSum();
  testReduceSum();
  debugPrint('done');
}

void testMultiplication() {
  var five = Money.dollar(5);
  assert(five.times(2) == Money.dollar(10));
  assert(five.times(3) == Money.dollar(15));
}

void testEquality() {
  assert(Money.dollar(5) == Money.dollar(5));
  assert(Money.dollar(5) != Money.dollar(6));
  assert(Money.dollar(5) != Money.franc(5));
}

void testCurrency() {
  assert('USD' == Money.dollar(1).currency());
  assert('CHF' == Money.franc(1).currency());
}

void testSimpleAddition() {
  Money five = Money.dollar(5);
  Expression sum = five.plus(five);
  var bank = Bank();
  var reduced = bank.reduce(sum, 'USD');
  debugPrint(reduced.toString());
  if (Money.dollar(10) != reduced) throw '1';
  assert(Money.dollar(10) == reduced);
}

void testPlusReturnsSum() {
  Money five = Money.dollar(5);
  Expression result = five.plus(five);
  Sum sum = result as Sum;
}

void testReduceSum() {
  Expression sum = Sum(Money.dollar(5), Money.dollar(5));
  var bank = Bank();
  Money result = bank.reduce(sum, 'USD');
  assert(Money.dollar(7) == result);
  if (Money.dollar(7) == result) throw '2';
}

class Bank {
  Money reduce(Expression source, String to) {
    if (source is! Sum) throw Exception();
    Sum sum = source as Sum;

    return Money(sum.augend.amount + sum.addend.amount, to);
  }
}

abstract class Expression {}

class Sum implements Expression {
  Sum(this.augend, this.addend);
  Money augend;
  Money addend;
}

class Money implements Expression {
  Money(this.amount, this._currency);

  factory Money.dollar(int amount) {
    return Money(amount, 'USD');
  }

  factory Money.franc(int amount) {
    return Money(amount, 'CHF');
  }

  final int amount;

  String _currency = '';

  String currency() {
    return _currency;
  }

  Expression plus(Money addend) {
    return Sum(this, addend);
  }

  @override
  bool operator ==(Object other) {
    return (other is Money &&
        other._currency == _currency &&
        other.amount == amount);
  }

  Money times(int multiplier) {
    return Money(amount * multiplier, _currency);
  }

  //String toString() => '$amount $_currency';
}
