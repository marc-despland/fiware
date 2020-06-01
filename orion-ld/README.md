

https://github.com/FIWARE/tutorials.Linked-Data

https://forge.etsi.org/swagger/ui/?url=https://forge.etsi.org/rep/NGSI-LD/NGSI-LD/raw/master/spec/updated/full_api.json

curl -X POST -H "Content-Type: application/ld+json" http://127.0.0.1:1028/ngsi-ld/v1/entities -d "@./building-ngsi-ld.json"