/* global use, db */

use('disqueraejemplo');


db.bands.insertMany([
  { name: "Coldplay", country: "UK", url: "https://www.coldplay.com/", members: "S G D" },
  { name: "Daft Punk", country: "FR", url: "https://daftpunk.com/", members: "S TT D" },
  { name: "AC/DC", country: "AU", url: "https://www.acdc.com/", members: "S F D" },
  { name: "Depeche Mode", country: "UK", url: "https://www.depechemode.com/", members: "S S D" },
  { name: "Red Hot Chili Peppers", country: "US", url: "https://redhotchilipeppers.com/", members: "S T D" }
]);


db.bands.updateOne(
  { name: "Coldplay" },
  { $set: { albums: [
      { title: "Parachutes", dateCreated: new Date(2000,6,10), solds: 700, rating: 5 },
      { title: "A Rush of Blood to the Head", dateCreated: new Date(2002,7,26), solds: 70, rating: 4 }
  ] } }
);

db.bands.updateOne(
  { name: "Daft Punk" },
  { $set: { albums: [
      { title: "Homework", dateCreated: new Date(1997,0,20), solds: 547, rating: 2 },
      { title: "Discovery", dateCreated: new Date(2001,2,13), solds: 234, rating: 3 }
  ] } }
);

db.bands.updateOne(
  { name: "AC/DC" },
  { $set: { albums: [
      { title: "Highway to Hell", dateCreated: new Date(1979,6,27), solds: 756, rating: 3 },
      { title: "Back in Black", dateCreated: new Date(1980,6,25), solds: 2908, rating: 1 }
  ] } }
);

db.bands.updateOne(
  { name: "Depeche Mode" },
  { $set: { albums: [
      { title: "Violator", dateCreated: new Date(1990,2,19), solds: 500, rating: 2 },
      { title: "Music for the Masses", dateCreated: new Date(1987,8,28), solds: 2800, rating: 4 }
  ] } }
);

db.bands.updateOne(
  { name: "Red Hot Chili Peppers" },
  { $set: { albums: [
      { title: "Californication", dateCreated: new Date(1999,5,8), solds: 2900, rating: 5 },
      { title: "Blood Sugar Sex Magik", dateCreated: new Date(1991,8,24), solds: 4000, rating: 3 }
  ] } }
);


db.bands.find().pretty();



//Reto 2 contar albumes 
db.bands.aggregate([
  { 
    $unwind: "$albums" 
  },
  { 
    $group: {
      _id: "$name",albumCount: { $sum: 1 },totalSales: { $sum: "$albums.solds" }
    } 
  },
  { 
    $sort: { albumCount: -1 } 
  }
]);


//Top 2 Albumes
db.bands.aggregate([
  { 
    $unwind: "$albums" 
  },
  { 
    $project: { band: "$name",album: "$albums.title",solds: "$albums.solds",rating: "$albums.rating"} 
  },
  { 
    $sort: { solds: -1 } 
  },
  { 
    // Limite 2
    $limit: 2 
  }
]);


// Obtener rating por Pais

db.bands.aggregate([
  { 
    $unwind: "$albums" 
  },
  { $group: {_id: { band: "$name" }, avgRating: { $avg: "$albums.rating" }, totalSolds: { $sum: "$albums.solds" },} 
  },
  { 
    $sort: { avgRating: -1 } 
  }
]);