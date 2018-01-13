export default class Helper {

  /// converts object into string and back to object
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
}
