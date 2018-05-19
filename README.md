# Quickstart guide for mongoDB

![Image of mongoDB](https://webassets.mongodb.com/_com_assets/cms/MongoDB-Logo-5c3a7405a85675366beb3a5ec4c032348c390b3f142f5e6dddf1d78e2df5cb5c.png)

### Getting started with mongoDB (on Mac OSX) :green_apple:
1. Download.
2. Unzip.
3. Create the directory **/data/db** in **/**.
4. In the terminal, I ran the command **Users/Neil/Documents/mongodb-osx-x86_64-3.6.4/bin/mongod**. Modify your's accordingly and run it. You will see the mongoDB server up and running.
5. I started the shell with the command **./bin/mongo** after having **cd** to the **Users/Neil/Documents/mongodb-osx-x86_64-3.6.4/** directory.

Optional:
To connect to MongoDB Atlas, I did the following:
1. MacBook-Pro:mongodb-osx-x86_64-3.6.4 Neil$ ./bin/mongo "mongodb+srv://bigdata-cibni.mongodb.net/test" --username Neil  
2. Enter password.


### Basic interaction with the shell to warm up
\> db  
test

\> show collections  

\> db.foo.save({\_id:1, x:10})  
WriteResult({ "nMatched" : 0, "nUpserted" : 1, "nModified" : 0, "\_id" : 1 })

\> show collections  
foo

\> db.bar.save({\_id:1, x:10})  
WriteResult({ "nMatched" : 0, "nUpserted" : 1, "nModified" : 0, "\_id" : 1 })

\> show collections  
bar  
foo

\> db.system.indexes.find()  

\> show collections  
bar  
foo

\> db.foo.find()  
{ "\_id" : 1, "x" : 10 }

\> ObjectId()  
ObjectId("5ae19784f739121c590fd964") 

\> db.rhino.insert({x:10})  
WriteResult({ "nInserted" : 1 })

\> db.rhino.insert({x:10})  
WriteResult({ "nInserted" : 1 })

\> db.rhino.find()  
{ "\_id" : ObjectId("5ae1a1cff739121c590fd96a"), "x" : 10 }  
{ "\_id" : ObjectId("5ae1a1d1f739121c590fd96b"), "x" : 10 }

\> db.user.insert({\_id:"bob@bob.com", Name: "Bob", Address: {Street: 'Blue Lantern', City: 'London'}, Music: \['Rock', 'Jazz']})  
WriteResult({ "nInserted" : 1 })  

\> db.user.find().pretty();    
{  
	"\_id" : "bob@bob.com",  
	"Name" : "Bob",  
	"Address" : {  
		"Street" : "Blue Lantern",  
		"City" : "London"  
	},  
	"Music" : \[  
		"Rock",  
		"Jazz"  
	]  
}    

_The format of the output above should look organised on your shell due to 'pretty()'._

--

\> db.a.save({\_id:1, x:10});  
WriteResult({ "nMatched" : 0, "nUpserted" : 1, "nModified" : 0, "\_id" : 1 })

\> db.a.update({\_id:1}, {$inc:{x:1}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "x" : 11 }

\> db.a.update({\_id:1},{$set:{y:3}});    
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.update({\_id:1},{$inc:{x:1}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find()  
{ "\_id" : 1, "x" : 12, "y" : 3 }

\> db.a.update({\_id:1},{$unset:{y:''}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();    
{ "\_id" : 1, "x" : 12 }

--

\> db.a.save({\_id:1, Naem:'bob'});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "Naem" : "bob" }

\> db.a.update({\_id:1}, {$rename: {'Naem': 'Name'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "Name" : "bob" }

--

\> db.a.save({\_id:1});    
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1 }

\> db.a.update({\_id:1}, {$push:{things: 'one'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ "one" ] }

\> db.a.update({\_id:1}, {$push:{things: 'two'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ "one", "two" ] }

\> db.a.update({\_id:1}, {$push:{things: 'two'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ "one", "two", "two" ] }

\> db.a.update({\_id:1}, {$addToSet:{things: 'three'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ "one", "two", "two", "three" ] }

\> db.a.update({\_id:1}, {$addToSet:{things: 'three'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 0 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ "one", "two", "two", "three" ] }

_Notice, the behaviour of '$addToSet' compared to '$push'._

--

\> db.a.update({\_id:1}, {$pull:{things: 'two'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();    
{ "\_id" : 1, "things" : [ "one", "three" ] }

_Notice how $pull removed all instances of 'two'._

--

\> db.a.find();    
{ "\_id" : 1, "things" : [ "one", "three" ] }

\> db.a.update({\_id:1}, {$pop:{things: 1}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ "one" ] }

\> db.a.update({\_id:1}, {$push:{things: 'two'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.update({\_id:1}, {$push:{things: 'two'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.update({\_id:1}, {$push:{things: 'two'}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ "one", "two", "two", "two" ] }

\> db.a.update({\_id:1}, {$pop:{things: 2}});  
WriteResult({  
	"nMatched" : 0,  
	"nUpserted" : 0,  
	"nModified" : 0,  
	"writeError" : {  
		"code" : 9,  
		"errmsg" : "$pop expects 1 or -1, found: 2"  
	}  
})  

\> db.a.update({\_id:1}, {$pop:{things: -1}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ "two", "two", "two" ] }

--

\> db.a.find();  
{ "\_id" : 1, "things" : [ 1, 2, 3 ] }
{ "\_id" : 2, "things" : [ 2, 3 ] }
{ "\_id" : 3, "things" : [ 3 ] }
{ "\_id" : 4, "things" : [ 3, 7 ] }

\> db.a.update({}, {$push: {things: 4}});  
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ 1, 2, 3, 4 ] }  
{ "\_id" : 2, "things" : [ 2, 3 ] }  
{ "\_id" : 3, "things" : [ 3 ] }  
{ "\_id" : 4, "things" : [ 3, 7 ] }

\> db.a.update({}, {$push: {things: 4}},{multi:true});  
WriteResult({ "nMatched" : 4, "nUpserted" : 0, "nModified" : 4 })

\> db.a.find();
{ "\_id" : 1, "things" : [ 1, 2, 3, 4, 4 ] }  
{ "\_id" : 2, "things" : [ 2, 3, 4 ] }  
{ "\_id" : 3, "things" : [ 3, 4 ] }  
{ "\_id" : 4, "things" : [ 3, 7, 4 ] }  

\> db.a.update({things:2}, {$push: {things: 700}},{multi:true});
WriteResult({ "nMatched" : 2, "nUpserted" : 0, "nModified" : 2 })

\> db.a.find();  
{ "\_id" : 1, "things" : [ 1, 2, 3, 4, 4, 700 ] }  
{ "\_id" : 2, "things" : [ 2, 3, 4, 700 ] }  
{ "\_id" : 3, "things" : [ 3, 4 ] }  
{ "\_id" : 4, "things" : [ 3, 7, 4 ] }  

_With the blank {} operator, it is supposed to push the number 4 in all of them. However, it did not because we also need {multi:true} for it to do multiple changes. And now if we want to update all where the number 2 is present, then we use {things:2} as shown above._

--

\>load('animals')  
true  

\> db.animals.insert(animals)  

\> db.animals.find()    
{ "\_id" : 1, "item" : "ABC2", "details" : { "model" : "14Q3", "manufacturer" : "M1 Corporation" }, "stock" : \[ { "size" : "M", "qty" : 50 } ], "category" : "clothing" }
{ "\_id" : 2, "item" : "MNO2", "details" : { "model" : "14Q3", "manufacturer" : "ABC Company" }, "stock" : \[ { "size" : "S", "qty" : 5 }, { "size" : "M", "qty" : 5 }, { "size" : "L", "qty" : 1 } ], "category" : "clothing" }
{ "\_id" : 3, "item" : "IJK2", "details" : { "model" : "14Q2", "manufacturer" : "M5 Corporation" }, "stock" : \[ { "size" : "S", "qty" : 5 }, { "size" : "L", "qty" : 1 } ], "category" : "houseware" }

--

\> db.animals.find({\_id: {$gt:1}}, {\_id:1})  
{ "\_id" : 2 }
{ "\_id" : 3 }

\> db.animals.find({\_id: {$lt:2}}, {\_id:1})  
{ "\_id" : 1 }

\> db.animals.find({\_id: {$lte:2}}, {\_id:1})  
{ "\_id" : 1 }  
{ "\_id" : 2 }  

\> db.animals.find({\_id: {$gte:2}}, {\_id:1})  
{ "\_id" : 2 }  
{ "\_id" : 3 }

\> db.animals.find({\_id: {$gt:1, $lt:3}}, {\_id:1})  
{ "\_id" : 2 }

--

\> db.animals.find({\_id: {$not: {$lte:2}}}, {\_id:1})  
{ "\_id" : 3 }

--

\> db.animals.find({\_id: {$in: \[1,3]}}, {\_id:1})  
{ "\_id" : 1 }  
{ "\_id" : 3 }  

\> db.animals.find({\_id: {$nin: \[1,3]}}, {\_id:1})  
{ "\_id" : 2 }  

--

\> db.real_animals.find({tags: {$in: \['cute','ocean']}}, {name:1})  
{ "\_id" : 1, "name" : "cat" }  
{ "\_id" : 2, "name" : "rabbit" }  
{ "\_id" : 3, "name" : "shark" }  
{ "\_id" : 4, "name" : "dolphin" }  
{ "\_id" : 5, "name" : "penguin" }  
{ "\_id" : 6, "name" : "duck" }  

_As seen above, the '$in' operator will bring those that match either conditions in the array._

--

\> db.real_animals.find({tags: {$all: \['cute','ocean']}}, {name:1})  
{ "\_id" : 4, "name" : "dolphin" }  
{ "\_id" : 5, "name" : "penguin" }  

_As seen above, the '$all' operator will bring those that match both conditions in the array._

--

\> db.real_animals.find({"info.canFly":true})  
{ "\_id" : 6, "name" : "duck", "tags" : \[ "land", "cute" ], "info" : { "type" : "bird", "canFly" : true } }  

_In the above dot notation 'info.canFly' has been used._

--

\> db.real_animals.find({info: {type: 'bird', canFly: true}}, {name:1})  
{ "\_id" : 6, "name" : "duck" }  

\> db.real_animals.find({info: {canFly: true, type: 'bird'}}, {name:1})  
No match! Because it wants to match in the same order and existance of all of them

\> db.real_animals.find({info: {type: 'bird'}}, {name:1})
No match!

\> db.real_animals.find({"info.canFly": true, "info.type": 'bird'}, {name:1})  
{ "\_id" : 6, "name" : "duck" }

_See how the use of dot notation makes a difference for a sub document._

--

\> db.real_animals.find({"info.canFly": null}, {name:1})  
{ "\_id" : 1, "name" : "cat" }  
{ "\_id" : 2, "name" : "rabbit" }  
{ "\_id" : 3, "name" : "shark" }  
{ "\_id" : 4, "name" : "dolphin" }  

\> db.real_animals.find({"info.canFly": {$exists: true}}, {name:1})  
{ "\_id" : 4, "name" : "dolphin" }  
{ "\_id" : 5, "name" : "penguin" }  
{ "\_id" : 6, "name" : "duck" }  

\> db.real_animals.find({"info.canFly": {$exists: false}}, {name:1})  
{ "\_id" : 1, "name" : "cat" }  
{ "\_id" : 2, "name" : "rabbit" }  
{ "\_id" : 3, "name" : "shark" }  

_Notice the difference between 'null' and '$exists'. The 'dolphin' record has a 'canFly' field but the 'cat' record does not have the 'canFly' field. However will 'null' both have been returned. With the $exists operator, only those that have that field will be returned._

--

\> db.real_animals.find({"info.type": 'bird', tags:'cute'}, {name:1})  
{ "\_id" : 5, "name" : "penguin" }  
{ "\_id" : 6, "name" : "duck" }  

\> db.real_animals.find({"info.type": 'bird', tags:'ocean'}, {name:1})  
{ "\_id" : 5, "name" : "penguin" }  

_Notice that the comma acts like an 'and'. E.g. {"info.type": 'bird' AND tags:'ocean'}_

--

\> db.real_animals.find({\_id:1},{\_id:1,name:1})
{ "\_id" : 1, "name" : "cat" }

\> db.real_animals.find({\_id:1},{\_id:0,name:0})
{ "tags" : \[ "land", "cute" ], "info" : { "type" : "mammal", "color" : "red" } }

\> db.real_animals.find({\_id:1},{name:0, info:0})
{ "\_id" : 1, "tags" : \[ "land", "cute" ] }

_Notice that the '_id' field has been returned even if it has not been mentioned. In fact, this is a special field and it is the only field that behaves this way. It we do not want the _id field to be returned, then we have to explicitly mention it._

\> db.real_animals.find({\_id:1},{\_id:0,name:1})  
{ "name" : "cat" }

\> db.real_animals.find({\_id:1},{\_id:0,name:1, info:0})    
Error: error: {
	"ok" : 0,
	"errmsg" : "Projection cannot have a mix of inclusion and exclusion.",
	"code" : 2,
	"codeName" : "BadValue"
}

_Also as shown above, we cannot have a mix of inclusion and exclusion._

--

\>db.real_animals.find({},{name:1})  
{ "\_id" : 1, "name" : "cat" }  
{ "\_id" : 2, "name" : "rabbit" }  
{ "\_id" : 3, "name" : "shark" }  
{ "\_id" : 4, "name" : "dolphin" }  
{ "\_id" : 5, "name" : "penguin" }  
{ "\_id" : 6, "name" : "duck" }  

\> var c = db.real_animals.find({},{name:1})  
\> c.size()  
6 

\> c.hasNext()  
true  

\> c.forEach(function(d){print(d.name)})  
cat  
rabbit  
shark  
dolphin  
penguin    
duck  

\> c.hasNext()  
false  

_The above demonstrates the cursor in mongodb._

--

\> db.real_animals.find({},{name:1}).sort({name:1})  
{ "\_id" : 1, "name" : "cat" }  
{ "\_id" : 4, "name" : "dolphin" }  
{ "\_id" : 6, "name" : "duck" }  
{ "\_id" : 5, "name" : "penguin" }  
{ "\_id" : 2, "name" : "rabbit" }  
{ "\_id" : 3, "name" : "shark" }  

\> db.real_animals.find({},{name:1}).sort({name:-1})  
{ "\_id" : 3, "name" : "shark" }  
{ "\_id" : 2, "name" : "rabbit" }  
{ "\_id" : 5, "name" : "penguin" }  
{ "\_id" : 6, "name" : "duck" }  
{ "\_id" : 4, "name" : "dolphin" }  
{ "\_id" : 1, "name" : "cat" }  

_The 'sort()' operator is used to order the result in ascending (use positive) or descending (use negative) order._

--

_We can also sort sub documents:_

\> db.real_animals.find({},{name:1, "info.type":1}).sort({"info.type":1, "name":-1})  
{ "\_id" : 5, "name" : "penguin", "info" : { "type" : "bird" } }  
{ "\_id" : 6, "name" : "duck", "info" : { "type" : "bird" } }  
{ "\_id" : 3, "name" : "shark", "info" : { "type" : "fish" } }  
{ "\_id" : 2, "name" : "rabbit", "info" : { "type" : "mammal" } }  
{ "\_id" : 4, "name" : "dolphin", "info" : { "type" : "mammal" } }  
{ "\_id" : 1, "name" : "cat", "info" : { "type" : "mammal" } }  

\> db.real_animals.find({},{name:1, "info.type":1}).sort({"info.type":1, "name":1})  
{ "\_id" : 6, "name" : "duck", "info" : { "type" : "bird" } }  
{ "\_id" : 5, "name" : "penguin", "info" : { "type" : "bird" } }  
{ "\_id" : 3, "name" : "shark", "info" : { "type" : "fish" } }  
{ "\_id" : 1, "name" : "cat", "info" : { "type" : "mammal" } }  
{ "\_id" : 4, "name" : "dolphin", "info" : { "type" : "mammal" } }  
{ "\_id" : 2, "name" : "rabbit", "info" : { "type" : "mammal" } }  

--

\> db.real_animals.find({},{\_id:1}).sort({\_id:-1}).limit(3)  
{ "\_id" : 6 }  
{ "\_id" : 5 }  
{ "\_id" : 4 }  

_The 'limit()' function restricts the output._

--

\> db.real_animals.find({},{\_id:1}).sort({\_id:-1}).skip(1).limit(3)  
{ "\_id" : 5 }  
{ "\_id" : 4 }  
{ "\_id" : 3 }  

_We can use the skip() function to skip a certain amount of document(s). In the above skipped one document and limited the result to 3._

--

\> db.real_animals.findOne({\_id:1})
{
	"\_id" : 1,
	"name" : "cat",
	"tags" : \[
		"land",
		"cute"
	],
	"info" : {
		"type" : "mammal",
		"color" : "red"
	}
}  

--

\> db.real_animals.ensureIndex({name:1})  
{
	"createdCollectionAutomatically" : false,
	"numIndexesBefore" : 1,
	"numIndexesAfter" : 2,
	"ok" : 1
}  

_The above '.ensureIndex' creates an index on name. '1' means ascending (A-Z), '-1' means descending (Z-A)._  

> db.real_animals.find({name:'cat'}).explain()
This will show details about the index, etc.

--

\> db.real_animals.dropIndex("name_1")  
{ "nIndexesWas" : 2, "ok" : 1 }  

\> db.real_animals.dropIndex("name_1")  
{
	"nIndexesWas" : 1,
	"ok" : 0,
	"errmsg" : "index not found with name [name_1]",
	"code" : 27,
	"codeName" : "IndexNotFound"
}  

_'.dropIndex' is used to drop an index. After the index is removed, mongo will let you know it about it if you try to remove it again._

--



#### Notes:
* Use 'pwd()' instead of 'pwd' in the mongo shell.
* The MongoDB Manual defines sharding as "a method for distributing data across multiple machines. MongoDB uses sharding to support deployments with very large data sets and high throughput operations.”
* A **cursor** is a pointer to the current location in the result set.
* **Projections** are just used to limit the result set.
* Create a script in a folder for e.g. 'hello.sh' then call it in the shell using the command 'load('hello.sh')'.
* A document must have an \_id field. The id cannot be an array.
* The maximum document size is currently 16MB. However this might change in the future.
* In mongoDB, we do not have tables, we have collections instead.
* If there is more than one collection with the same id, then the content of the latest one will always overwrite the previous ones. This occurs when we use the 'save' command. However if we use the 'insert' command, the shell will prevent you from using the same id! So, it is better you use 'insert' rather than 'save' when you are not sure about the uniqueness of your id.
* Prefer 'update' command over 'save'. The 'update' command is atomic within a document; no two clients can update the same document at the same time.
* db.foo.update(query,update,options);
  * foo = collection name
  * query = which document?
  * update = what change?
  * options = one? many? upsert?
* upsert is defined as operation that "creates a new document when no document matches the query criteria.
* $addToSet adds an element only if does not exist whereas $push will add the element even if it already exists.
* $pull removes all instances of a specified element from an array.
* $pop removes the last element in an array. If you want to remove the first element of an array, then use the $pop operator with a '-1' value.
* $pop, $push, $pull and $addToSet will all fail on a non-array.
* 'Find and Modify' enables us to find a specific entry and change it. For it's signature and more information: https://docs.mongodb.com/manual/reference/method/db.collection.findAndModify/
* db.collection.find(query, projection);
  * query - which documents
  * projection - which fields to return (this is an optional parameter)
* We can use comparison operators such as $gt, $lt, $lte, $gte. For e.g. 
  * db.animals.find({\_id: {$gte:2}}, {\_id:1})
  * db.animals.find({\_id: {$gt:1, $lt:3}}, {\_id:1})
* $in and $nin (not in) operators are a bit like 'equal' and 'not equal' respectively. 
* When used with an array, '$in' can be assumed to be 'either or' (any condition in the array can be true) while '$all' is like 'and', i.e. all conditions in the array must be true.
* Dot notation can be used to access data.
* Find
  * Query criteria
    * Single value field
    * Array field
    * Sub-document/dot notation
* Projection
  * Filed inclusion or exclusion
* Cursor
  * Sort
  * Skip
  * Limit
* Indexing strategies
  * Regular (B-Tree)
  * Geo
  * Text
  * Hashed
  * TTL 
* Unique index, Sparse index, Compound index, Covering index
* Type Check:
  * The { name : { $type: 10 } } query matches documents that contains the name field whose value is null only; i.e. the value of the name field is of BSON Type Null (i.e. 10) :   
    * db.users.find( { name : { $type: 10 } } )   
  * The query returns only the document where the name field has a null value:   
    * { "/_id" : 900, "name" : null }
* To import a json file:
  * exit the shell and type the command:
    * mongoimport --db dbName --collection collectionName --file fileName.json

#### Some helpful links:
* https://www.mongodb.org/dl/osx?_ga=2.10762484.1797709089.1524685437-1944241512.1524160976
* https://stackoverflow.com/questions/12339334/installing-mongodb-in-mac
* https://stackoverflow.com/questions/10203589/cant-use-mongo-command-shows-command-not-found-on-mac
* https://coderwall.com/p/8jhtza/a-little-detour-for-mongodb-installation-on-mac-osx
* https://www.mongodb.com/mongodb-accelerator-kit
