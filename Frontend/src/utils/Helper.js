export default class Helper {

  /// converts object into string (copied) and back to object
  /// because spread operator only goes one level deep :/
  static deepCopy(ojb) {
    return JSON.parse(JSON.stringify(ojb));
  }

  /// checks in given list if all elements have given property
  static doesListElementsHave(prop, list) {
    let elementsHaveProp = true;
    list.forEach(el => el[prop] === undefined ? elementsHaveProp = false : null);
    return elementsHaveProp;
  }

  /// sorts elements in given list on the sum of their array values at given prop */
  static sortDescOnDataSum(prop, list) {
    return list.sort((before, current) => {
      const a = before[prop].reduce((b, c) => b + c);
      const b = current[prop].reduce((b, c) => b + c);
      if (a < b) return -1;
      if (a > b) return 1;
      return 0;
    });
  }
}
