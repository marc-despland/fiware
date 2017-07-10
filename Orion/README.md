This is a fork of the https://github.com/telefonicaid/fiware-orion version with small modification to make it work with OpenShift.


# Requirement
You have to create first a MongoDB 3.2 with persistent storage.
Orion will use several databases (one per services) so by default it connects against **admin** database. So we will create a user on admin database with the role readWriteAnyDatabase

Conenct with the admin account on the admin database:
```

```

Then create the user

```

```

# Creation of the image stream



# Creation of an Orion instance
