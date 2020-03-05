# REST API using Spring Boot + Solr + war + docker

## Description:

1. solr image(solr-app) and application artifact(IndianTownsAPI.war) in tomcat image(app) are packaged together as 2 services in docker-compose.yml
2. Dockerfile has the steps to copy the generated war file and start tomcat. dockerfile tag is used in docker-compose.yml file to use Dockerfile
3. application.properties has spring.data.solr.host=http://**solr-app**:8983/solr to refer the solr-app image name.
4. This example has references to network concept in docker
5. packaging type used is war and it is copied into image's /usr/local/tomcat/webapps path
6. depends_on is specified as "solr-app" used so that tomcat image is built and dependent on "solr-app" image. 

## Setup:

 - Pull or download code from this repo
 - [Install Docker](https://docs.docker.com/install/) 
 - Once installed, start the Docker application in your system
 - Once started, run the following commands
 
 ```
 > mvn clean install
> docker-compose up --build
 ```

**Thats it !!!** 
### Setup verification:
You can verify the success of setup by visiting http://localhost:8983/solr in your browser & selecting the IndianTowns core

## How to use:

### REST Endpoints

```
http://localhost:8080/india/town/all?page=0&size=1

http://localhost:8080/india/town/paged/search?page=10&size=0&district=porbandar&state=gujarat

http://localhost:8080/india/town/paged/search?page=10&size=0&state=gujarat

http://localhost:8080/india/town/search?page=10&size=0&district=porbandar&state=gujarat

http://localhost:8080/india/town/search?page=10&size=0&state=gujarat

```

## Response Sample:

### UnPaged Response

http://localhost:8080/india/town/search?state=assam&district=Nalbari

```json
[  
   {  
      "category":"M.B",
      "state":"Assam",
      "district":"Nalbari",
      "town_name":"Nalbari"
   },
   {  
      "category":"M.B",
      "state":"Assam",
      "district":"Nalbari",
      "town_name":"Nalbari"
   },
   {  
      "category":"T.C",
      "state":"Assam",
      "district":"Nalbari",
      "town_name":"Tihu"
   }
]
```

### Paged Response
http://localhost:8080/india/town/paged/search?page=10&size=0&state=gujarat

```json
{
   "content":[
      {
         "category":"M.B",
         "state":"Assam",
         "district":"Nalbari",
         "town_name":"Nalbari"
      },
      {
         "category":"M.B",
         "state":"Assam",
         "district":"Nalbari",
         "town_name":"Nalbari"
      },
      {
         "category":"T.C",
         "state":"Assam",
         "district":"Nalbari",
         "town_name":"Tihu"
      }
   ],
   "pageable":{
      "sort":{
         "sorted":false,
         "unsorted":true,
         "empty":true
      },
      "offset":0,
      "pageSize":20,
      "pageNumber":0,
      "unpaged":false,
      "paged":true
   },
   "facetResultPages":[

   ],
   "facetQueryResult":{
      "content":[

      ],
      "pageable":"INSTANCE",
      "totalPages":1,
      "totalElements":0,
      "last":true,
      "size":0,
      "numberOfElements":0,
      "first":true,
      "number":0,
      "sort":{
         "sorted":false,
         "unsorted":true,
         "empty":true
      },
      "empty":true
   },
   "highlighted":[

   ],
   "maxScore":null,
   "fieldStatsResults":{

   },
   "suggestions":[

   ],
   "facetFields":[

   ],
   "facetPivotFields":[

   ],
   "allFacets":[
      null
   ],
   "alternatives":[

   ],
   "totalPages":1,
   "totalElements":3,
   "size":20,
   "numberOfElements":3,
   "first":true,
   "number":0,
   "sort":{
      "sorted":false,
      "unsorted":true,
      "empty":true
   },
   "last":true,
   "empty":false
}
```
