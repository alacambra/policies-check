#!/bin/bash

source channel-source-vars.sh

#set -x
export CORE_PEER_LOCALMSPID="lacambraMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/Users/albertlacambra/git/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/peers/peer0.lacambra.tech/tls/server.crt
export CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra/git/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp
export FABRIC_CFG_PATH=.
BIN=/Users/albertlacambra/git/fabric-material/fab-1.3-1org/bin/bin

export CORE_PEER_ADDRESS=localhost:27051

#Install channel into orderer
${BIN}/peer channel create -o localhost:7050 -c ${CHANNEL_NAME} -f ./channel-artifacts/${CHANNEL_NAME}.tx

CODE=$?

if [ ${CODE} -ne 0 ]; then 
    echo "channel install failed:" + ${CODE}
   # exit -1
fi

#Fetch block 0 from orderer
CORE_PEER_ADDRESS=localhost:27051 CORE_PEER_LOCALMSPID="lacambraMSP"  CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra1/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp/ CORE_PEER_TLS_ENABLED=false peer channel fetch 0 block.block -c ${CHANNEL_NAME} -o localhost:7050

#Join peers to channel
CORE_PEER_ADDRESS=localhost:27051
${BIN}/peer channel fetch 0 block.block -c ${CHANNEL_NAME} -o localhost:7050

${BIN}/peer channel join -b block.block -o localhost:7050

CORE_PEER_ADDRESS=localhost:28051
${BIN}/peer channel join -b block.block -o localhost:7050

CORE_PEER_ADDRESS=localhost:29051
${BIN}/peer channel join -b block.block -o localhost:7050