 mkdir -p ./mongoconfig
mongod --configsvr --replSet configReplSet --dbpath ./mongoconfig --port 27016
mongosh localhost:27016
rs.initiate({
       _id: "configReplSet",
       members: [
           { _id: 0, host: "localhost:27016" }
       ]
   });
   
     mkdir -p ./mongo1 ./mongo2
 mongod --shardsvr --replSet shardReplSet --dbpath ./mongo1 --port 27014
  mongod --shardsvr --replSet shardReplSet --dbpath ./mongo2 --port 27015
  mongosh localhost:27014
  rs.initiate({
       _id: "shardReplSet",
       members: [
           { _id: 0, host: "localhost:27014" },
           { _id: 1, host: "localhost:27015" }  // Add this member only when configuring the second shard
       ]
   });
mongos --configdb configReplSet/localhost:27016 --port 27020
mongosh localhost:27017
use admin;  // Switch to the admin database

   db.runCommand({ addShard: "shardReplSet/localhost:27014" });
   db.runCommand({ addShard: "shardReplSet/localhost:27015" });
   