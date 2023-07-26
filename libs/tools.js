const fs = require('fs');

module.exports = {
  /**
   * Sorts an array of numbers in ascending order.
   * 
   * @param {number[]} ary - The input array
   * @returns {number[]} - The sorted array
   */
  sort(ary) {
    ary = ary.sort((a, b) => a - b);
    return ary;
  },

  /**
   * Inverts an array of numbers in descending order.
   * 
   * @param {number[]} ary - The input array
   * @returns {number[]} - The inverted array
   */
  invert(ary) {
    ary = ary.sort((a, b) => b - a);
    return ary;
  },

  /**
   * Reads a JSON file from the specified path and returns the parsed JSON object.
   * 
   * @param {string} path - The path to the JSON file
   * @returns {Object} - The parsed JSON object
   */
  getJ(path) {
    const rawdata = fs.readFileSync(path, 'utf8');
    return JSON.parse(rawdata);
  },

  /**
   * Writes a JSON object to the specified path as a JSON file.
   * 
   * @param {string} path - The path to write the JSON file
   * @param {Object} obj - The JSON object to write
   */
  setJ(path, obj) {
    this.path(path);
    const json = JSON.stringify(obj);
    fs.writeFileSync(path, json);
  },

  /**
   * Waits for the specified number of milliseconds.
   * 
   * @param {number} ms - The number of milliseconds to wait
   */
  wait(ms) {
    const start = Date.now();
    let now = start;
    while (now - start < ms) {
      now = Date.now();
    }
  },

  /**
   * Generates a random number within the specified range (inclusive).
   * 
   * @param {number} min - The minimum value of the range
   * @param {number} max - The maximum value of the range
   * @returns {number} - The randomly generated number
   */
  random(min, max) {
    const out = Math.floor(Math.random() * (max - min + 1)) + min;
    return out;
  },

  /**
   * Creates a directory path if it does not exist.
   * 
   * @param {string} path - The path to create
   */
  path(path) {
    const folder = path.split('/');
    folder.pop();
    if (!fs.existsSync(path)) {
      for (let i = 2; i <= folder.length; i++) {
        let rest = '';
        for (let j = 0; j < i; j++) {
          rest = rest + folder[j] + '/';
        }
        if (!fs.existsSync(rest)) fs.mkdirSync(rest);
      }
    }
  },

  /**
   * Deletes a directory and its contents recursively.
   * 
   * @param {string} path - The path to the directory
   */
  delPath(path) {
    fs.rmSync(path, {
      recursive: true,
    });
  },

  /**
   * Removes a specific value from an array.
   * 
   * @param {any[]} arr - The input array
   * @param {any} value - The value to remove
   * @param {boolean} options - A flag indicating whether to log a message
   * @returns {any[]} - The modified array without the specified value
   */
  popA(arr, value, options) {
    arr = arr.filter((item) => item !== value);
    if (options) console.log(`tools> ${value} removed from Array`);
    return arr;
  },

};
