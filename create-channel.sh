#Required peer globals:
CORE_PEER_LOCALMSPID="lacambraMSP"
FABRIC_CFG_PATH=.
#CORE_PEER_TLS_ROOTCERT_FILE=crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp
BIN=/Users/albertlacambra/git/fabric-material/policies-check/bin/bin
rm ./channel-artifacts/*

# Create genesys block:
${BIN}/configtxgen -channelID syschannel -profile MultiOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

# Create channel configuration file:
${BIN}/configtxgen -outputCreateChannelTx ./channel-artifacts/policies-channel.tx -profile MultiOrgsChannel -channelID policies-channel