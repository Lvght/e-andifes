#!/bin/bash
mkdir schema;
chmod 777 schema;
docker pull schemaspy/schemaspy:latest;
docker run --rm -v $(pwd)/schema:/output -v $(pwd)/database/config/schemaspy.conf:/schemaspy.properties --network e-andifes_default schemaspy/schemaspy:latest;

cd schema && python3 -m http.server 8000