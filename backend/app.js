const express = require('express')
const bodyparser = require('body-parser')
const mongoose = require("mongoose")

const connection = mongoose.connect("mongodb://localhost:27017/module10");

const employeeRoute = require("./routes/employee_route");

const app = express()
app.use(bodyparser.json());

app.use('/employee', employeeRoute);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server stared at ${PORT}`)
})