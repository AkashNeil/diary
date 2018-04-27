db.a.findAndModify({
    "query": {
        "things" : 7
    },
    "update" : {
        "$set" : {
            "touched" : false
        }
    },
    "sort" : {
        "_id" : 1
    }
});