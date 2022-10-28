pragma solidity ^0.8.13;


import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract ThreeSigmaChallengeToken is ERC721, Ownable {
    constructor() ERC721("ThreeSigmaChallengeToken", "TSCT") {}

    uint tokenId;
    mapping(address => tokenData[]) public ownershipRecord;

    struct tokenData{
        uint tokenId;
        uint timeStamp;
    }


    function mintToken(address recipient) onlyOwner public {
        require(owner()!=recipient, "Recipient cannot be the owner of the contract");
        _safeMint(recipient, tokenId);
        ownershipRecord[recipient].push(tokenData(tokenId, block.timestamp));
        tokenId = tokenId + 1;
    }

    function getToken(address owner) external view returns(tokenData[] memory) {
        return ownershipRecord[owner];
    }

}