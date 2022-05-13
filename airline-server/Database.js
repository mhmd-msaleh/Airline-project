// const { json } = require("express");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "air-line"
});

// class Database {

//     constructor() {
//         connection.connect(function (err) {
//             if (err) {
//                 console.error(err);
//                 throw err;
//             } else {
//                 console.log("Connection to database was successful");
//             }
//         });
//     }
    
//     addUser(username, password, email){
//         var sql = "INSERT INTO USER(`Username`, `Password`, `Email`) VALUES(?,?,?)"; 
//         connection.query(sql, [username, password, email], 
//             function (err, result) {
//                 if (err) throw err;
//                 console.log("Number of records inserted: " + result.affectedRows); 
//             }
//         )
//     }

//     getUserData(username, password){
//         var sql = "select * from PASSENGER  "; 
//         var data = ''; 
//         connection.query(sql, (err, result, callback) => {
//             if(err) throw err
            
//         });
//     }

//     getPassengers(req, res) {
//         let queryString = 'select * from PASSENGER';
//         connection.query(queryString, (err, result) => {
//           if(err) throw err;
//           res.json(result); 
//         });
//       }
// }

// module.exports = new Database();



const db = connection.connect(
    function (err) {
        if (err) {
            console.error(err);
            throw err;
        } else {
            console.log("Connection to database was successful");
        }
    }
);

module.exports = {
    getUser: async (req, res) => {
       let queryString = `SELECT * from PASSENGER`;  
       const [user] = await db.query(queryString).catch(err => {throw err}); 
       res.json(user); 
    }
   }