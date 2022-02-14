import 'dart:math';

String toStringWithFixedNumber(int number, int biggerThan) {
  if (biggerThan <= 0) throw 'count must be bigger than 0';
  int temp = pow(10, biggerThan).toInt();
  if(temp<number) {
    return number.toString();
  } else {
    if(number/temp>0.1){
      return number.toString();
    } else {
      int shift=0;
      for(shift ; shift<=1;shift++){

        temp=temp*10;
        shift++;
      }
      return number.toString().padLeft(shift, '0');
    }

  }
}
