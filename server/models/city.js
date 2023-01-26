const mongoose = require("mongoose");

const citySchema = mongoose.Schema({
  city: {
    required: true,
    type: String,
    trim: true,
  },
});

const City = mongoose.model("City", citySchema);
module.exports = City;

