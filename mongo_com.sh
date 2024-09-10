$ mongoimport -h localhost:27020 --db=test --collection=cities --type=json --file=/home/demon/Documents/mongo_cities100.json
> db.cities.aggregate([{ $geoNear: { near: { type: "Point", coordinates: [42.54277, 1.73361] }, distanceField: "dist.calculated", maxDistance: 80500, includeLocs: "dist.location", spherical: true } }])
