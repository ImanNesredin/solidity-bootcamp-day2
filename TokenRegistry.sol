// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenRegistry {
    struct Token {
        string name;
        string symbol;
        address owner;
        bool isActive;
    }

    mapping(uint256 => Token) public tokens;
    uint256[] public tokenIds;
    uint256 private nextTokenId = 1;

    event TokenRegistered(uint256 indexed tokenId, string name, string symbol, address owner);

    function registerToken(string memory name, string memory symbol) public {
        require(bytes(name).length > 0, "Name connot be empty");
        require(bytes(symbol).length > 0, "Symbol connot be empty");
        
        uint256 tokenId = nextTokenId;

        tokens[tokenId] = Token({
            name: name,
            symbol: symbol,
            owner: msg.sender,
            isActive: true
        });

        tokenIds.push(tokenId);
        nextTokenId++;

        emit TokenRegistered(tokenId, name, symbol, msg.sender);
    }

    function deactivateToken(uint256 id) public {
        Token storage t = tokens[id];

        require(t.owner == msg.sender, "Only Token owner can deactivate");
        require(t.isActive, "Token already inactive");

        t.isActive = false;
    }

    function getToken(uint256 id) public view returns(string memory, string memory, address, bool) {
        Token memory t = tokens[id];

        return (t.name, t.symbol, t.owner, t.isActive);
    }

    function getAllTokensIds() public view returns(uint256[] memory){
        return tokenIds;
    }


}