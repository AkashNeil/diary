# Quickstart guide for mongoDB

![Image of mongoDB](https://webassets.mongodb.com/_com_assets/cms/MongoDB-Logo-5c3a7405a85675366beb3a5ec4c032348c390b3f142f5e6dddf1d78e2df5cb5c.png)

### Getting started with mongoDB (on Mac OSX) :green_apple:
1. Download.
2. Unzip.
3. Create the directory **/data/db** in **/**.
4. In the terminal, I ran the command **Users/Neil/Documents/mongodb-osx-x86_64-3.6.4/bin/mongod**. Modify your's accordingly and run it. You will see the mongoDB server up and running.
5. I started the shell with the command **./bin/mongo** after having **cd** to the **Users/Neil/Documents/mongodb-osx-x86_64-3.6.4/** directory.

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



#### Notes:
* Use 'pwd()' instead of 'pwd' in the mongo shell.
* Create a script in a folder for e.g. 'hello.sh' then call it in the shell using the command 'load('hello.sh')'.
* A document must have an \_id field. The id cannot be an array.
* The maximum document size is currently 16MB. However this might change in the future.
* In mongoDB, we have no tables, we have collections instead.
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
  * projection - which fields (this is an optional parameter)
* 

#### Some helpful links:
* https://www.mongodb.org/dl/osx?_ga=2.10762484.1797709089.1524685437-1944241512.1524160976
* https://stackoverflow.com/questions/12339334/installing-mongodb-in-mac
* https://stackoverflow.com/questions/10203589/cant-use-mongo-command-shows-command-not-found-on-mac
* https://coderwall.com/p/8jhtza/a-little-detour-for-mongodb-installation-on-mac-osx
* https://www.mongodb.com/mongodb-accelerator-kit
