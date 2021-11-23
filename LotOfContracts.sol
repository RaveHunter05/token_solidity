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
    
    // Function to receive Ether
    receive() external payable {}

    // Fallback data is called when msg.data is not empty
    fallback() external payable {}
    
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    // Payable declare that it is possible to receive ether in contract
    // Check this
    function sendEtherViaCall(address payable _to) public payable{
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
