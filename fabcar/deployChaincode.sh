#!/bin/bash

source ./fabcar-source-vars.sh

export CORE_PEER_LOCALMSPID="lacambraMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/Users/albertlacambra/git/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/peers/peer0.lacambra.tech/tls/server.crt
export CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra/git/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp
export CORE_LOGGING_PEER=debug 
export CORE_PEER_ADDRESS=localhost:27051

${BIN}/peer chaincode install -l java -n ${CC_NAME} -p ${CC_PATH} -v ${CC_VERSION}
${BIN}/peer chaincode list --installed
${BIN}/peer chaincode list --instantiated -C ${CHANNEL_NAME}


${BIN}/peer chaincode instantiate -n ${CC_NAME} -v ${CC_VERSION} -l java  -o localhost:7050 -c '{"Args":["init"]}' -C ${CHANNEL_NAME}
${BIN}/peer chaincode list --installed
${BIN}/peer chaincode list --instantiated -C ${CHANNEL_NAME}