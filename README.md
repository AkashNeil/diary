# mongoDB

![Image of mongoDB](https://webassets.mongodb.com/_com_assets/cms/MongoDB-Logo-5c3a7405a85675366beb3a5ec4c032348c390b3f142f5e6dddf1d78e2df5cb5c.png)

### Getting started with mongoDB (on Mac OSX) :green_apple:
1. Download.
2. Unzip.
3. Create the directory **/data/db** in **/**.
4. In the terminal, I ran the command **Users/Neil/Documents/mongodb-osx-x86_64-3.6.4/bin/mongod**. Modify your's accordingly and run it. You will see the mongoDB server up and running.
5. I started the shell with the command **./bin/mongo** after having **cd** to the **Users/Neil/Documents/mongodb-osx-x86_64-3.6.4/** directory.

### Basic interaction with the shell
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




#### Notes:
* A document must have an \_id field. The id cannot be an array.
* The maximum document size is currently 16MB. However this might change in the future.
* In mongoDB, we have no tables, we have collections instead.
* If there is more than one collection with the same id, then the content of the latest one will always overwrite the previous ones. This occurs when we use the 'save' command. However if we use the 'insert' command, the shell will prevent you from using the same id! So, it is better you use 'insert' rather than 'save' when you are not sure about the uniqueness of your id. 

#### Some helpful links:
* https://www.mongodb.org/dl/osx?_ga=2.10762484.1797709089.1524685437-1944241512.1524160976
* https://stackoverflow.com/questions/12339334/installing-mongodb-in-mac
* https://stackoverflow.com/questions/10203589/cant-use-mongo-command-shows-command-not-found-on-mac
* https://coderwall.com/p/8jhtza/a-little-detour-for-mongodb-installation-on-mac-osx
* https://www.mongodb.com/mongodb-accelerator-kit
