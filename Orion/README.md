This is a fork of the https://github.com/telefonicaid/fiware-orion version with small modification to make it work with OpenShift.

More documentation could be found here : http://fiware-orion.readthedocs.io/


# Requirement
You have to create first a MongoDB 3.2 with persistent storage.
Orion will use several databases (one per services) so by default it connects against **admin** database. So we will create a user on admin database with the role readWriteAnyDatabase


Connect with the admin account on the admin database:
```
mongo -uadmin -pTnnpyurMc7WR7lmE admin
```

Then create the user
```
db.createUser({ user: "orion" , pwd: "f64RGhasN9vW", roles: ["readWriteAnyDatabase"]})

```

And tests it :
```
mongo -uorion -pf64RGhasN9vW admin
```

# Creation of the image stream

You can use the following template to create the ImageStream

```
{
    "kind": "ImageStream",
    "apiVersion": "v1",
    "metadata": {
        "name": "fiware-orion",
        "creationTimestamp": null,
        "annotations": {
            "openshift.io/display-name": "Fiware Orion"
        }
    },
    "spec": {
        "dockerImageRepository": "docker.io/marcdespland/orion",
        "tags": [
            {
                "name": "latest",
                "annotations": {
                    "description": "Fiware Orion ContextBroker",
                    "iconClass": "icon-git",
                    "openshift.io/display-name": "Fiware Orion ContextBroker",
                    "supports": "orion",
                    "tags": "fiware, orion, contextBroker",
                    "version": "1.7.0"
                },
                "from": {
                    "kind": "DockerImage",
                    "name": "docker.io/marcdespland/orion:1.7.0"
                },
                "importPolicy": {}
            }
        ]
    },
    "status": {
        "dockerImageRepository": ""
    }
}

```

# Creation of an Orion instance

Create The instance using the Openshift console : **Add to project** > **Deploy Image** > **ImageStream Tag** and, choose your project, fiware-orion and 1.7.0

Create 4 environnements variables :
* MONGOHOST		: The service of your mongodb
* MONGOUSER		: the user created
* MONGOPWD		: its password
* MONGODB 		: orion (it will be teh default database)


To test your Orion instance, first check there is no error on the log, then connect to the terminal and try the following request
```
curl localhost:1026/v1/contextTypes -s -S  --header 'Accept: application/json'

{
  "statusCode" : {
    "code" : "404",
    "reasonPhrase" : "No context element found"
  }
}
```

and

```
curl localhost:1026/version -s -S  --header 'Accept: application/json'
{
"orion" : {
  "version" : "1.7.0-next",
  "uptime" : "0 d, 0 h, 12 m, 24 s",
  "git_hash" : "1ed1b9d23afeb6c95858ad25adbb01ef019491d2",
  "compile_time" : "Fri Jun 30 12:03:27 UTC 2017",
  "compiled_by" : "root",
  "compiled_in" : "b99744612d0b"
}                
}
```