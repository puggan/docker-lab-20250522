#!/usr/bin/env bash
set -e
cd -- "$(dirname -- "$0")"
if [ -f "users.db" ]; then
    exit 1
fi
sqlite3 users.db <<EOF
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL
);

INSERT INTO users (username, password) VALUES ('demo', 'demo');
EOF
