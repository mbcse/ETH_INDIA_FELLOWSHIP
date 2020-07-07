# Supplying Assets to the Compound Protocol
The Compound Protocol is a series of interest rate markets running on the Ethereum blockchain. When users and applications supply an asset to the Compound protocol, they begin earning a variable interest income instantly. Interest accrues every Ethereum block (~15 seconds), and users can withdraw their principal plus interest anytime.
Under the hood, users are contributing their assets to a large pool of liquidity (a “market”) that is available for other users to borrow, and they share in the interest that borrowers pay back to the pool.
When users supply assets, they receive cTokens from Compound in exchange. cTokens are ERC20 tokens that can be redeemed for their underlying assets at any time. As interest accrues to the assets supplied, cTokens are redeemable at an exchange rate (relative to the underlying asset) that constantly increases over time, based on the rate of interest earned by the underlying asset.
Non-technical users can interact with the Compound protocol using an interface like Dharma or app.compound.finance; developers can create their own applications that interact with Compound’s smart contracts.

**In this guide, we’re going to walk through supplying assets via Web3.js JSON RPC and via proxy smart contracts that live on the blockchain. These are the 2 ways in which developers can write software to utilize the Compound protocol.
There are examples in JavaScript and also Solidity.**
## Table of Contents for This Guide
- Compound Markets
- Connecting to the Ethereum Network
- Supplying to Compound on a Localhost Network
- Supplying to Compound on a Public Network
- How to Supply ETH to Compound via Web3.js
- How to Supply a Supported ERC20 Token to Compound via Solidity