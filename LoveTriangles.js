/**Solution to Love Triangles task (https://github.com/SIARHEI-SMANTSAR/love-triangle)
 *
 * @param preferences - an array of integers. Indices of people, whom they love
 * @returns number of love triangles
 */
module.exports = function getLoveTrianglesCount(preferences = []) {
  let count = 0;
  for (const [key, value] of Object.entries(preferences)) {
    //First link
    pkey = Number(key) + 1;
    //console.log(pkey + "❤" + value);

    //It links itself
    if (value == pkey) {
      continue;
    }
    //Second link
    mkey = Number(value) - 1;
    secondKey = value;
    secondValue = preferences[mkey];
    //console.log(secondKey + "❤" + secondValue);

    //Third link
    mkey = Number(secondValue) - 1;
    thirdKey = secondValue;
    thirdValue = preferences[mkey];
    //console.log(thirdKey + "❤" + thirdValue);

    //Count triangle
    if (thirdValue == pkey) {
      count = count + 1;
    }
    //console.log("-----");
  }
  return count / 3; //Discard repeats (3 from Love 3angle)
};
