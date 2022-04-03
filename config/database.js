// database module
var mysql = require('mysql');
var config = {
    host: 'containers-us-west-35.railway.app',
    user: 'root', // your mysql user
    password: '7t1r4pUr7erCjDCcpt7c', // your mysql password
    port: 7427, //port mysql
    database: 'railway',
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