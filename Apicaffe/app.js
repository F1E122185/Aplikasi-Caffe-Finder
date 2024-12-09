const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bodyParser = require('body-parser');
const dbConfig = require('./config/DbConfig');

const app = express();
const port = process.env.PORT || 5050;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Koneksi ke MongoDB
mongoose.connect('mongodb://localhost:27017/caffe')

  
    .then(() => console.log("MongoDB Connected"))
    .catch(err => console.error("MongoDB Connection Error:", err));

// Routes
app.use('/user', require('./routes/user'));

// Jalankan server
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});


