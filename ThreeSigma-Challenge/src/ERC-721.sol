pragma solidity ^0.8.13;


import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract ThreeSigmaChallenge is ERC721, Ownable {
    constructor() ERC721("ThreeSigmaChallenge", "TSC") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmVLmkLYrm7SQQ2juoD7hU97BwoPaMzXsqn4Xq2eXTTzpu";
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}