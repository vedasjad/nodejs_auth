const mongoose = require("mongoose");

const showSchema = mongoose.Schema({
  showId: { //theatreId + date + time
    required: true,
    type: String,
    trim: true,
  },
  theatreId: { //theatre name + cityname
      required: true,
      type: String,
      trim: true,
  },
  movieId: { //movie name + release date
    required: true,
    type: String,
    trim: true,
  },
  date: {
    required: true,
    type: String,
    trim: true,
  },
  time: {
    required: true,
    type: String,
    trim: true,
  },
  audi: {
    required: true,
    type: String,
    trim: true,
  },
  prices: {
    required: true,
    type: Array,
    trim: true,
  },
  bookedSeats:{
    required : true,
    type: Array,
    trim: true,
  }
});

const Show = mongoose.model("Show", showSchema);
module.exports = Show;