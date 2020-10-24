#!/bin/sh

docker run --name ehrdb --network ehrbase-net -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e EHRBASE_USER=ehrbase -e EHRBASE_PASSWORD=ehrbase ehrbaseorg/ehrbase-postgres:latest

docker run --name ehrbase --network ehrbase-net -d -p 18080:8080 -e AUTH_TYPE=NONE -e DB_URL=jdbc:postgresql://ehrdb:5432/ehrbase -e DB_USER=ehrbase -e DB_PASS=ehrbase -e SYSTEM_NAME=local.ehrbase.org ehrbaseorg/ehrbase:latest

