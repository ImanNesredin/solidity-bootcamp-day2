# TokenRegistry Smart Contract 

## 📌 Overview
`TokenRegistry` is a Solidity smart contract that allows users to register, manage, and track tokens. Each token has a unique ID, name, symbol, owner, and an active status. This project demonstrates **structs, mappings, arrays, and access control in Solidity**.

## ⚙️ Features

- Register new tokens with `registerToken(name, symbol)`  
- Deactivate tokens (`deactivateToken(id)`) — only the owner can do this  
- Retrieve token details (`getToken(id)`)  
- List all registered token IDs (`getAllTokenIds()`)  
- **Event** emitted whenever a new token is registered  

---

## 🧱 Contract Structure

```solidity
struct Token {
    string name;
    string symbol;
    address owner;
    bool isActive;
}

mapping(uint256 => Token) public tokens;
uint256[] public tokenIds; 
```
## 📚 Technologies Used

Solidity ^0.8.0

Remix IDE
