// database module
var mysql = require('mysql');
var config = {
    host: process.env.MYSQLHOST,
    user: process.env.MYSQLUSER, // your mysql user
    password: process.env.MYSQLPASSWORD, // your mysql password
    port: process.env.MYSQLPORT, //port mysql
    database: process.env.MYSQLDATABASE,
    connectionLimit: 10, // this is the max number of connections before your pool starts waiting for a release
    multipleStatements: true

};

// init database
var pool = mysql.createPool(config);

//Fetch data
function RunQuery(sql, callback) {
    pool.getConnection(function(err, conn) {
        if (err) {
            ShowErrors(err);
        }
        conn.query(sql, function(err, rows, fields) {
            if (err) {
                ShowErrors(err);
            }
            conn.release();
            callback(rows);
        });
    });
}

//Throw errors
function ShowErrors(err) {
    throw err;
}

module.exports = {
    RunQuery: RunQuery
};