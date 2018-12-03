#!/bin/bash

export CORE_PEER_LOCALMSPID="lacambraMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/Users/albertlacambra/git/fabric-material/policies-check/crypto-config/peerOrganizations/lacambra.tech/peers/peer0.lacambra.tech/tls/server.crt
export CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra/git/fabric-material/policies-check/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp
export CORE_LOGGING_PEER=debug 
 
BIN=/Users/albertlacambra/git/fabric-material/policies-check/bin/bin

CC_NAME=fabcar
CC_VERSION=1
CC_PATH=/Users/albertlacambra/git/fabric-samples/chaincode/fabcar/java/deployment

CC_NAME=sample
CC_VERSION=5
CC_PATH=/Users/albertlacambra/git/fabric-sdk-java/src/test/fixture/sdkintegration/javacc/sample1
CC_INIT='{"Args":["a", "1", "b", "2"]}'

export CORE_PEER_ADDRESS=localhost:27051
${BIN}/peer chaincode install -l java -n ${CC_NAME} -p ${CC_PATH} -v ${CC_VERSION}
${BIN}/peer chaincode list --installed
${BIN}/peer chaincode list --instantiated -C policies-channel


${BIN}/peer chaincode instantiate -n ${CC_NAME} -v ${CC_VERSION} -l java  -o localhost:7050 -c '{"Args":["init", "a", "500", "b", "510"]}' -C policies-channel
${BIN}/peer chaincode list --installed
${BIN}/peer chaincode list --instantiated -C policies-channel