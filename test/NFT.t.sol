pragma solidity 0.8.13;


import "forge-std/Test.sol";
import '../src/ThreeSigmaNFT.sol';


contract NFT is Test {
    ThreeSigmaNFT nftToken;
    address nftId;
    address public owner;
    address bob = address(0x12345);

    function setUp() public {
       owner = msg.sender;
       vm.label(address(this), "ThreeSigmaNFT test contract");
       nftToken = new ThreeSigmaNFT();
    }
    function testMint() public {
        nftId = msg.sender;
        nftToken.mintToken(msg.sender);
        nftToken.getToken(msg.sender);
    }
}