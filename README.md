# ThreeSigma-Challenge


## Challenge statement: 

#### Hands on exercise

You are supposed to write two different smart contracts:

- ThreeSigmaNFT.sol which should implement ERC721.
- Challenge.sol which has the vaults and timers for deposits of Ether and the ThreeSigmaNFT.

The Challenge.sol smart contract will receive 2 types of assets that can be deposited: 

- Native funds challenge (ETH).
- ThreeSigma NFT challenge (ERC721).

When users deposit assets of a certain type into the contract, a countdown timer is set for 1 day for that specific asset, meaning there are 2 individual independent countdown timers. The countdown resets every time assets of that type are deposited into the contract. If the timer runs out, the last user to have deposited assets will be awarded all the assets currently in the contract for that asset type .

#### Resources for the exercise

You will need to study about these topics in order to complete the smart contracts:

- [OpenZeppelin Github](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [ERC165](https://docs.openzeppelin.com/contracts/2.x/api/introspection#IERC165-supportsInterface-bytes4-)
- [ERC721](https://docs.openzeppelin.com/contracts/3.x/erc721)
- [onERC721Received](https://docs.openzeppelin.com/contracts/3.x/api/token/erc721#IERC721Receiver-onERC721Received-address-address-uint256-bytes-)
- [All about comments](https://medium.com/p/bc31c729975a)
- [All about arrays](https://jeancvllr.medium.com/solidity-tutorial-all-about-array-efdff4613694)
- [Introduction to mappings](https://medium.com/coinmonks/solidity-tutorial-all-about-mappings-29a12269ee14)
- [Introduction to structs](https://jeancvllr.medium.com/solidity-tutorial-all-about-structs-b3e7ca398b1e)

#### Requirements

- The Challenge.sol smart contract cannot extend the ThreeSigmaNFT.sol
- Your code must be commented
- Document how you approached the problem, as well as how you arrived at the implemented solution
- Document any CLI command or scripts that you utilized to deploy/interact with the smart contracts


## Resolution documentation:

Challenge smart contract functions:



|  Functions |  Description | Modifiers  | Arguments  
|---|---|---|---|
| depositFund  | This function is responsable for receive the funds from the player, allocate the right player as the winner and set the time for receive the funds to zero.  |    -public <br> -payable  | -------  |
| depositToken | This function is responsable for receive the Non-Fungible-token from the player and stake, also allocates the right player as the winner and set the time for receive the NFT's to zero.  | -public  | uint _tokenId(the token ID of the deposited NFT) |
| getRewardFund  |  This function is responsable for send the funds to the winner player. | -public <br> -payable  | ------- |
| getRewardToken  |  This function is responsable for send the NFT's to the winner player.  | -public  | -------  |


# Challenge Fetching Data & Scripting


### Snapshot a NFT collection

Utilizing the [Web3.py](https://web3py.readthedocs.io/en/v5/) library, take a snapshot of the owners of the [Bored Ape Yatch Club collection](https://etherscan.io/address/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d). The output should be a csv file with 2 columns: NFT id and the address corresponding to the following owner. Here is an example of the expected format. Try and build this in the most modular way possible (eg. so that it can work for any collection for any timestamp/block number)

[Snapshot Solution](https://github.com/gusgraujo/ThreeSigma-Challenge/tree/main/Fetching%20Data%20%26%20Scripting)

