//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Decentratwitter is ERC721URIStorage {
    uint256 public tokenCount;
    uint256 public postCount;
    mapping(uint256=> Post) public posts;
    mapping(address=> uint256) public profiles;
    struct Post{
        uint256 id;
        string hash;
        uint256 tipAmount;
        address payable author;//payable for tip in ether
    }
    event PostCreated(uint256 id, string hash, uint256 tipAmount, address payable author);
    event PostTipped(uint256 id, string hash, uint256 tipAmount, address payable author);

     
    constructor() ERC721("Decentratwitter", "DAPP") {}
    function mint(string memory _tokenURI) external returns(uint256){
        tokenCount++;
        _safeMint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return (tokenCount);
    }

    function createPost(string memory _hash, uint256 _tipAmount, address payable _author) external returns(uint256){
        uint256 id = postCount;
        posts[id] = Post(id, _hash, _tipAmount, _author);
        emit PostCreated(id, _hash, _tipAmount, _author);
        postCount++;
    }

}
