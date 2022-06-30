
module.exports = incrementId = async (Schema) => {
    var data = await Schema.find();
    return data.length + 1;
}