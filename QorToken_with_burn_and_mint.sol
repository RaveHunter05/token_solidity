// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    constructor(string memory name, string memory symbol, uint initialSupply) ERC20(name, symbol) {
        _mint (msg.sender, initialSupply * 10**uint(decimals()));
    }
    
    function burn(uint amount) public{
        _burn(msg.sender, amount);
    }
    
    function mint(uint amount) public{
        _mint(msg.sender, amount);
    }
    
   // internal functions:
   /* _mint
    _burn
    _approve
    _burnFrom
   */
}
