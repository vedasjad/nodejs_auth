const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const Theatre = require("../models/theatre");
const City = require("../models/city");
const Show = require("../models/show");
const Audi = require("../models/audi");
const authRouter = express.Router();
const jwt = require('jsonwebtoken');
const auth = require("../middleware/auth");

//fetchCities
 authRouter.post("/api/getCities",async(req,res)=>{
     try{
        const city =  await City.find();
        res.status(200).json(city);
     }catch(e){
        res.status(500).json({error:e.message});
     }
 });

 authRouter.post("/api/getShowsByTheatre", async (req, res) => {
    const {theatreId, date } = req.body;
    const shows =await Show.find({ theatreId: theatreId, date: date });
    try {
      res.status(200).json(shows);      
    } catch (error) {
      res.status(500).json(error);
    }
  });

//  authRouter.get("/api/:city/getTheatres",async(req,res)=>{
//      try{
//          const{city} = await req.params.city;

//          const theatresAvailable = await Theatre.find

//      }catch(e){
//          res.status(500).json({error:e.message});
//      }
//  });

//add theatre by admin
authRouter.post("/api/addTheatre", async(req,res)=>{
    try{
        const{theatreName,theatreId,city} = req.body;

        const existingTheatreId = await Theatre.findOne({theatreId});
        if(existingTheatreId){
            return res.status(400).json({msg: "Theatre with same name and city already exists!"});
        }

        let theatre = new Theatre({
            theatreId,
            theatreName,
            city,
        });

        theatre = await theatre.save();
        const existingCity = await City.findOne({city});
        if(existingCity==null){
            let newCity = new City({
                city,
            });
            newCity = await newCity.save();
        }
        res.json(theatre);

    }catch(e){
        res.status(500).json({error:e.message});
    }
});

//add audis
authRouter.post("/api/addAudi",async(req,res) => {
    try{
        const{audiId,numberOfRows,numberOfColumns,typesOfSeats,seats} = req.body;

        const existingAudi = await Audi.findOne({audiId});

        if(existingAudi){
            return res.status(400).json({msg: "Audi Already Exists!"});
        }

        let audi = new Audi({
            audiId,
            numberOfColumns,
            numberOfRows,
            typesOfSeats,
            seats,
        });

        audi = await audi.save();
        res.json(audi);

    }catch(e){
        res.status(500).json({error:e.message});
    }
});

//add shows
authRouter.post("/api/addShow", async (req, res) => {
    try {
      const {
        theatreId,
        date,
        movieName,
        releaseDate,
        time,
        audi,
        prices,
        bookedSeats,
      } = req.body;
      const movieId=movieName+releaseDate;
      const showId=theatreId+date+time;
      const existingShow = await Show.findOne({ showId });
  
      if (existingShow) {
        return res
          .status(400)
          .json({
            msg: "Show In same audi for same movie at same time already exists!",
          });
      }
      let Newshow = new Show({
        showId,
        theatreId,
        movieId,
        movieName,
        date,
        time,
        audi,
        bookedSeats,
        // typesOfPrices,
        prices,
      });
  
      show = await Newshow.save();
      res.status(201).json(show);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

  authRouter.post("/api/getShowsByMovie", async (req, res) => {
    const {movieId, date } = req.body;
    const shows =await Show.find({ movieId: movieId, date: date });
    try {
      res.status(200).json(shows);      
    } catch (error) {
      res.status(500).json(error);
    }
  });
//bookSeat
// authRouter.post("/api/bookSeats",async(req,res)=>{
//     try{
//         const{showId,bookedSeats} = req.body;

//         const isSeatBooked = await Show.showId.findOne({bookedSeats});

//         if(isSeatBooked){
//             return res.status(400).json({msg: "Show In same audi for same movie at same time already exists!"}); 
//         }

//         //update booked seats in the showId
//     }catch(e){
//         res.status(500).json({error:e.message});

//     }
// })

//Sign Up
authRouter.post("/api/signup",async(req,res)=>{
    try{
        const{name,email,password}=req.body;

        const existingUser = await User.findOne({email});
        if(existingUser){
            return res
                .status(400)
                .json({msg: "User with same email already exists!"});
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name,
        });
        user = await user.save();
        res.json(user);
    }catch(e){
        res.status(500).json({error:e.message});
    }
});

// Sign In

authRouter.post("/api/signin",async(req,res)=>{
    try{
        const {email,password} = req.body;
        
        const user = await User.findOne({email});
        if(!user){
            return res
            .status(400)
            .json({msg: "User with this email already exists!"});
        }

        const isMatch = await bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg: "Incorrect Password!"});
        }

        const token = jwt.sign({id: user._id},"passwordKey");
        res.json({token, ...user._doc});
    } catch(e){
        res.status(500).json({error:e.message});
    }

});

authRouter.post("/tokenIsValid",async(req,res)=>{
    try{
        const token = req.header("x-auth-token");
        if(!token)
          return res.json(false);

        const verified = jwt.verify(token,"passwordKey");
        if(!verified)
          return res.json(false);

        const user = await User.findById(verified.id);
        if(!user)
          return res.json(false);

        res.json(true);
        
    }catch(e){
        res.status(500).json({error: e.message});
    }
});


//get user data

authRouter.get("/",auth, async(req,res)=>{
    const user = await User.findById(req.user);
    res.json({...user._doc,token: req.token});
});

module.exports = authRouter;