const mongoose = require("mongoose");

const EmployeeModel = mongoose.Schema({
    _id: {
        type: Number
    },
    employeeName: {
        type: String,required:true
    },
    employeeSalary: {
        type: Number,required:true,min:0
    },
    employeeJoiningDate: {
        type: String,required:true
    },
});

module.exports = mongoose.model("employees", EmployeeModel);