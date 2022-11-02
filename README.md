# Evmos Chain and Token Registry

Welcome to Evmos Chain and Token Registry. Here you will find the requirements for submitting chain network and token registration. Please insure the Pull Request has chainConfig file and any token(s). The token contract will not be available until the governance passes. Please query this field on `https://api.evmos.org/#/Query/TokenPairs` and match the IBC fields. 

There are two folders: `tokens` and `chainConfig`. Inside `chainConfig`, network details should be filled out for mainnet and testnet (if available). We will be pulling from the Cosmos Chain Config repo for the RPC, REST, and GRPC/JSON-RPC located [here](https://github.com/cosmos/chain-registry). Please make sure the listings on the Cosmos Chain Registry is up to date. Additionally, if there are any fields (rpc, etc.) has high reliability, please feel free to list them as the first element in the array. Feel free to reach out to let us know if certain endpoint has no indexer or other restrictions.

To query for `clientId` field for `chainConfig` take a look at the IBC Relayer page on Mintscan Evmos. 

As for the `tokens` folder, each token should have its own JSON file and governance proposal. All fields should be filled. Once the governance proposal passes, the PR will be merged to `main` around one business day.
