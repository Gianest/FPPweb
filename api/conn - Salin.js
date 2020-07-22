const express = require('express');
const router = express.Router();
const sqlite3 = require('sqlite3').verbose();
const dbFile = __dirname + "/db/tiket.db";

let db = new sqlite3.Database(dbFile, sqlite3.OPEN_READWRITE, (err) => {
    if(err) throw err;
    console.log("Koneksi ke database berhasil!");
});
module.exports = db



