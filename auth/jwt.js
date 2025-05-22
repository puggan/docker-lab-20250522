const fs = require('fs');
const jwt = require('jsonwebtoken');
const privateKey = fs.readFileSync('jwt-private.key', 'utf8');

/**
 * @param {string} username
 * @param {boolean} mockExpired
 * @returns {string}
 */
module.exports = function (username, mockExpired = false) {
    return jwt.sign({username}, privateKey, {algorithm: 'RS256', expiresIn: mockExpired ? '-1h' : '15m'});
}