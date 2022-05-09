const express = require("express"); 
const app = express(); 
const db = require("./Database.js");
// const db = database();  
const html_dir = "/home/mohammed/htdocs/Airline-project/"; 

app.get("/", function(req, res){
    res.sendFile(html_dir+"index.html");
})

app.get("/login", (req, res) => {
    res.sendFile(html_dir+"login.html")
})

app.get("/login/submit", function(req, res){
    var data = req.query; 
    var username = data["username"];
    var password = data["password"]; 
    var ouput = db.getUserData(username, password); 
    console.log(ouput); 
    // res.send(ouput); 
})

app.get("/test", function(req, res){
    res.send(db.getPassengers())
})

app.listen(3000, function(){
    console.log("Listening on Port 3000"); 
})


