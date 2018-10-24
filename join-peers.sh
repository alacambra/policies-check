#!/bin/bash
#set -x
export CORE_PEER_LOCALMSPID="LacambraMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/Users/albertlacambra/git/fabric-material/policies-check/crypto-config/peerOrganizations/lacambra.tech/peers/peer0.lacambra.tech/tls/server.crt
export CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra/git/fabric-material/policies-check/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp
export FABRIC_CFG_PATH=/Users/albertlacambra/git/fabric-samples/config/
export CORE_PEER_ADDRESS=localhost:27051

BIN=/Users/albertlacambra/git/fabric-material/policies-check/bin/bin

${BIN}/peer channel create -o localhost:7050 -c policies-channel -f ./channel-artifacts/policies-channel.tx

CODE=$?
if [ ${CODE} -ne 0 ]; then
    echo "channel install failed:" + ${CODE}
    exit -1
fi

CORE_PEER_ADDRESS=localhost:27051
${BIN}/peer channel fetch 0 block.block -c policies-channel -o localhost:7050

CORE_PEER_ADDRESS=localhost:28051
${BIN}/peer channel fetch 0 block.block -c policies-channel -o localhost:7050

CORE_PEER_ADDRESS=localhost:29051
${BIN}/peer channel fetch 0 block.block -c policies-channel -o localhost:7050