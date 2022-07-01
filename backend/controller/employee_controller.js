const { mongo } = require("mongoose");
const Employee = require("../model/employee_model");
const incrementId = require("../utils/idIncrement");
module.exports = {
    async create(req, res) {
        try {
            var employee = await new Employee(req.body);
            employee.save();
            res.status(200).send(employee);
        } catch (error) {
            console.log(error);
            res.status(400).send("Error in create");
        }
    },
    async get(req, res) {
        try {
            var employee = await Employee.find().select("-_id -__v");

            res.status(200).send(employee);
        } catch (error) {
            console.log(error);
            res.status(400).send("Error in create");
        }
    },
    async delete(req, res) {
        try {
            await Employee.deleteOne({ employeeId: parseInt(req.params.id) });
            res.send("Deleted!!!");
        } catch (error) {
            console.log(error);
            res.status(400).send("Error in create");
        }
    },
    async update(req, res) {
        try {
            await Employee.updateOne({ employeeId: req.body.employeeId }, req.body, { new: true });

            res.send("update!!!");
        } catch (error) {
            console.log(error);
            res.status(400).send("Error in create");
        }
    },
}
