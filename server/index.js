const express = require("express");
const mongoose = require("mongoose");
mongoose.set('strictQuery', true);
const authRouter = require("./routes/auth");
const PORT = process.env.PORT || 3000;
require ("dotenv").config();
const app = express();
app.use(express.json());
app.use(authRouter);

const DB =
  "mongodb+srv://vedasjad:16feb2k19@cluster0.glc7vy2.mongodb.net/?retryWrites=true&w=majority";

mongoose.set("strictQuery", false);
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
