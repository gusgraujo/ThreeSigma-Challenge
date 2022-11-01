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


