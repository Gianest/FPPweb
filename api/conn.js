const express = require('express');
const router = express.Router();
const mysql = require('mysql');

const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "tiket"
});

module.exports = db



