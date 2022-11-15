// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
 
import "@openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin-contracts/contracts/access/Ownable.sol";
import "@openzeppelin-contracts/contracts/utils/Counters.sol";
import "./utils/MerkleProof.sol";
contract ThreeSigmaNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    bytes32 public merkleRoot;
    mapping (address => bool) public claimList;
 
    Counters.Counter private _tokenIdCounter;
 
    constructor(bytes32 _merkleRoot) ERC721("ThreeSigmaNFT", "TSN") {
        merkleRoot = _merkleRoot;
    }
 
    function safeMint(bytes32[] calldata merkleProof) public payable virtual {
        require(claimList[msg.sender] == false, "User already claimed");
        claimList[msg.sender] = true;
        uint256 tokenId = _tokenIdCounter.current();
        require(verifyRoot(merkleProof),"Invalid Merkle proof");
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    function verifyRoot(bytes32[] calldata merkleProof) internal virtual returns (bool){
        return MerkleProof.verify(merkleProof, merkleRoot, keccak256(abi.encodePacked(msg.sender)));
    }
 
}