// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RouleFiToken {
    address private owner;
    address private roulefi;
    string public constant name = "RouleFinanceToken";
    string public constant symbol = "rfETH";
    mapping (address=>uint256) balance;
    
    modifier isOwner() {
        require(msg.sender == owner, "your not owner");
        _;
    }
    
    modifier isroulefiContract() {
        require(msg.sender == roulefi, "not roulefi");
        _;
    }

    constructor() {
        owner = msg.sender;
        balance[owner] = 100000000;
    }
    
    function initialize(address _roulefi) external isOwner {
        roulefi = _roulefi;
    }
    
    function faucet() public {
        balance[msg.sender] = 100000;
    }
    
    function mint(address to, uint256 amount) external isroulefiContract {
        balance[to] += amount;
    }
    
    function burn(address to, uint256 amount) external isroulefiContract {
        require(balance[to] >= amount, "not enough token");
        balance[to] -= amount;
    }
    
    function balanceOf(address _user) external view returns (uint256) {
        return balance[_user];
    }
}