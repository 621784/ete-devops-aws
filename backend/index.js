const express = require("express");

const cors = require("cors");

require("dotenv").config();
 
const app = express();

app.use(cors());

app.use(express.json());
 
/* ROOT TEST ROUTE */

app.get("/", (req, res) => {

  res.json({ message: "Foundation Day Backend Running Successfully " });

});
 
/*  HEALTH CHECK (FOR AWS / PROMETHEUS / LB)  */

app.get("/health", (req, res) => {

  res.json({ status: "UP" });

});
 
/*  FRONTEND CONNECTION TEST API */

app.get("/api/message", (req, res) => {

  res.json({

    app: "Foundation Day",

    status: "Connected",

    time: new Date().toISOString(),

  });

});
 
/*SERVER PORT CONFIG */

const PORT = process.env.PORT || 5000;
 
app.listen(PORT, "0.0.0.0", () => {

  console.log(`Backend running on port ${PORT}`);

});

 