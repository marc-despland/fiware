#!/bin/bash
set -eu
#export MONGO_INITDB_ROOT_PASSWORD=`cat $MONGO_INITDB_ROOT_PASSWORD_FILE`
export SERVICEDB_PASSWORD=`cat $SERVICEDB_PASSWORD_FILE`
mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD $MONGO_INITDB_DATABASE << EOF
use $SERVICEDB_DATABASE
db.createUser({ user: 'servicedb', pwd: "$SERVICEDB_PASSWORD", roles: [ { role: 'userAdmin', db: "$SERVICEDB_DATABASE"}, { role: 'readWrite', db: "$SERVICEDB_DATABASE"}, {role: 'dbAdmin', db: "$SERVICEDB_DATABASE"} ] } );
EOF
