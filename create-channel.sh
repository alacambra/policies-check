#!/bin/bash

source channel-source-vars.sh

#Required peer globals:
CORE_PEER_LOCALMSPID="lacambraMSP"
FABRIC_CFG_PATH=.
#CORE_PEER_TLS_ROOTCERT_FILE=crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp
BIN=/Users/albertlacambra/git/fabric-material/fab-1.3-1org/bin/bin
rm ./channel-artifacts/*

# Create genesys block:
${BIN}/configtxgen -channelID syschannel -profile MultiOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

# Create channel configuration file:
${BIN}/configtxgen -outputCreateChannelTx ./channel-artifacts/${CHANNEL_NAME}.tx -profile MultiOrgsChannel -channelID ${CHANNEL_NAME}