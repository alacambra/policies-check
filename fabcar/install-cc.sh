source ./fabcar-source-vars.sh

CORE_PEER_ADDRESS=192.168.99.100:27051 CORE_PEER_LOCALMSPID="lacambraMSP" CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra1/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp/ CORE_PEER_TLS_ENABLED=false peer channel fetch 0 block.block -c ${CHANNEL_NAME} -o 192.168.99.100:7050

CORE_PEER_ADDRESS=192.168.99.100:27051 CORE_PEER_LOCALMSPID="lacambraMSP" CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra1/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp/  CORE_PEER_TLS_ENABLED=false peer channel join -b block.block

CORE_PEER_LOCALMSPID=lacambraMSP CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra1/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp/  CORE_PEER_ADDRESS=192.168.99.100:27051 CORE_LOGGING_PEER=info peer chaincode install -l java -n policies -p /Users/albertlacambra1/git/lacambra.tech/policies/polcies-trayning-cc/deployment -v 2

CORE_PEER_LOCALMSPID=lacambraMSP CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra1/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp/  CORE_PEER_ADDRESS=192.168.99.100:27051 CORE_LOGGING_PEER=debug peer chaincode instantiate -n policies -v 1 -l java  -o 192.168.99.100:7050 -c '{"Args":["init"]}' -C ${CHANNEL_NAME} "OR   ('lacambraMSP.admin', 'lacambraMSP.peer')" 

CORE_PEER_LOCALMSPID=lacambraMSP CORE_PEER_MSPCONFIGPATH=/Users/albertlacambra1/fabric-material/fab-1.3-1org/crypto-config/peerOrganizations/lacambra.tech/users/Admin@lacambra.tech/msp/  CORE_PEER_ADDRESS=192.168.99.100:27051 CORE_LOGGING_PEER=debug peer chaincode upgrade -n policies -l java  -o 192.168.99.100:7050 -c '{"Args":["init"]}' -C ${CHANNEL_NAME} -P "OR   ('lacambraMSP.admin', 'lacambraMSP.peer')" -v 2