#Required peer globals:
#CORE_PEER_LOCALMSPID="Org1MSP"
#CORE_PEER_TLS_ROOTCERT_FILE=crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
#CORE_PEER_MSPCONFIGPATH=crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp

rm ./channel-artifacts/*

# Create genesys block:
configtxgen -profile MultiOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

# Create channel configuration file:
configtxgen -outputCreateChannelTx ./channel-artifacts/policies-channel.tx -profile MultiOrgsChannel -channelID policies-channel