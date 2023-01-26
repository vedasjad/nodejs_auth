const mongoose = require("mongoose");

const audiSchema = mongoose.Schema({
  audiId: {//theatreId + audiName
    required: true,
    type: String,
    trim: true,
  },
  numberOfRows: {
      required: true,
      type: String,
      trim: true,
  },
  numberOfColumns: {
    required: true,
    type: String,
    trim: true,
  },
  typesOfSeats:{
    required : true,
    type: String,
    trim: true,
  },
  seats: {
    required: true,
    type: Array,
    trim: true,
  },
});

const Audi = mongoose.model("Audi", audiSchema);
module.exports = Audi;