/**
 * @param {string} username
 * @param {boolean} mockExpired
 * @returns {string}
 */
module.exports = function (username, mockExpired = false) {
    return 'JWT-TOKEN-' + username;
}