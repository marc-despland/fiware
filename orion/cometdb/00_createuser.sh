#!/bin/bash

export COMETDB_PASSWORD=`cat $COMETDB_PASSWORD_FILE`
#export MONGO_INITDB_ROOT_PASSWORD=`cat $MONGO_INITDB_ROOT_PASSWORD_FILE`

mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD $MONGO_INITDB_DATABASE << EOF
db = db.getSiblingDB('sth_default')
db.createUser({ user: 'comet', pwd: '$COMETDB_PASSWORD', roles: [ { role: "userAdmin", db: "sth_default" }, { role: "readWrite", db: "sth_default" },{ role: "dbAdmin", db: "sth_default" } ] });
db.updateUser("comet", { roles: [ { role: "userAdminAnyDatabase", db: "admin" }, { role: "readWriteAnyDatabase", db: "admin" },{ role: "dbAdminAnyDatabase", db: "admin" },{ role: "userAdmin", db: "sth_default" }, { role: "readWrite", db: "sth_default" },{ role: "dbAdmin", db: "sth_default" } ,{ role: "userAdmin", db: "sth_myservice" }, { role: "readWrite", db: "sth_myservice" },{ role: "dbAdmin", db: "sth_myservice" }] });
EOF