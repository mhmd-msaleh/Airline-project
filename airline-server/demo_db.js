// var mysql = require('mysql');

// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "", 
//   database: "air-line"
// });

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
//   con.query("select * from FLIGHT", function (err, result) {
//     if (err) throw err;
//     console.log(result);
//   });
// // });
var db = require('./Database'); 
var data = db.getUser("mhmd1234", "password")
console.log(data)

// function callBackSum(a, b, callback){
//     setTimeout( () => {
//         let sum = a+b; 
//         callback(sum); 
//     }, 2000);
// };

// callBackSum(3, 3, (sum) => {
//     console.log("sum is : "+sum); 
// })