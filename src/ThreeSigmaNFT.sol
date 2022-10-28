pragma solidity ^0.8.13;


import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract ThreeSigmaNFT is ERC721, Ownable {
    uint tokenId;

    constructor() ERC721("ThreeSigmaNFT", "TSN") {
        tokenId = 0;
    }

    mapping(address => uint) public ownershipRecord;

    function mintToken(address recipient) onlyOwner public {
        require(owner()!=recipient, "Recipient cannot be the owner of the contract");
        _safeMint(recipient, tokenId);
        ownershipRecord[recipient]= tokenId;
        tokenId = tokenId + 1;
    }

    function getToken(address owner) external view returns(uint) {
        return ownershipRecord[owner];
    }
}