const express = require('express')
const router = express.Router()
const employeeController = require("../controller/employee_controller");

router.post("/add", employeeController.create);
router.get("/", employeeController.get);
router.delete("/delete/:id", employeeController.delete);
router.put("/update", employeeController.update);

module.exports = router;