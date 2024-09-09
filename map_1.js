function distinctDigits(phone) {
    var
        number = phone.components.number + '',
        seen = [],
        result = [],
        i = number.length;
    while(i--) {
        seen[+number[i]] = 1;
    }
    for (i=0; i<10; i++) {
        if (seen[i]) {
            result[result.length] = i;
        }
    }
    return result;
}

map = function () {
    var digits = distinctDigits(this);
    emit({digits: digits, 
        country: this.components.country},
        {count: 1});
  }