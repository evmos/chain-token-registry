# Evmos Chain and Token Registry

Welcome to Evmos Chain and Token Registry. Here you will find the requirements for submitting chain network and token registration. Please insure a chainConfig and token(s) are ready before submitting the governance proposal.

There are two folders: `tokens` and `chainConfig`. Inside `chainConfig`, network details should be filled out for mainnet and testnet (if available). We will be pulling from the Cosmos Chain Config repo for the RPC, REST, and GRPC/JSON-RPC located [here](https://github.com/cosmos/chain-registry). **However, if the network has a preferred endpoint they believe can handle more workload/traffic, please add the link to the configuration. If not, we will use the list from Cosmos to bootstrap the network.** Feel free to reach out to let us know if certain endpoint has no indexer or other restrictions.

As for the `tokens` folder, each token should have its own JSON file and governance proposal. All fields should be filled. Once the governance proposal passes, the PR will be merged to `main` around one business day.
