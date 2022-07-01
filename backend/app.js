const express = require('express')
const bodyparser = require('body-parser')
const mongoose = require("mongoose")

const connection = mongoose.connect("mongodb://192.168.102.56:27017/employeeCrud");

const employeeRoute = require("./routes/employee_route");

const app = express()
app.use(bodyparser.json());

app.use('/employee', employeeRoute);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server stared at ${PORT}`)
})