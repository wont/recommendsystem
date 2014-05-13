 curl -XPUT 'http://localhost:9200/news/content/_mapping' -d '
{
    "content" : {
        "properties" : {
            "content" : {"type" : "string", 
                    "indexAnalyzer" : "ik",
                    "searchAnalyzer" : "ik",
                    "include_in_all" : "true",
                    "boost" : 1
            },
            "contenttitle" : {"type" : "string", 
                    "indexAnalyzer" : "ik",
                    "searchAnalyzer" : "ik",
                    "include_in_all" : "true",
                    "boost" : 2
            },
            "docno":{"type":"string"
            },
            "url":{"type":"string"
            }
        }
    }
}
'
