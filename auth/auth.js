const Sqlite3 = require('better-sqlite3');
const bcrypt = require('bcrypt');

const db = new Sqlite3('./users.db');

/**
 * @param {string} username
 * @param {string} password
 * @returns {Promise<boolean>}
 */
module.exports = async function (username, password) {
    const result = db.prepare('SELECT password FROM users WHERE username = ?').get(username);

    if (!result || !result.password) {
        return false;
    }

    // Plain password
    if (result.password[0] !== '$') {
        return result.password === password;
    }

    return bcrypt.compare(password, result.password);
}
