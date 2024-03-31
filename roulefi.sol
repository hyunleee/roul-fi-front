// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IRouleFiToken {
    function mint(address to, uint256 amount) external;
    function burn(address to, uint256 amount) external;
}

contract Roulefinance is Ownable(msg.sender) {
    address private RoulefiToken;

    struct LotteryData {
        address buyer;
        uint256 round;
        uint8 _1;
        uint8 _2;
        uint8 _3;
        uint8 _4;
        uint8 _5;
        uint8 _6;
        uint8 _7;
        uint256 amount;
        bool claimactivated;
    }

    struct Property {
        address buyer;
        uint8 _1;
        uint8 _2;
        uint8 _3;
        uint8 _4;
        uint8 _5;
        uint8 _6;
        uint8 _7;
    }
    
    mapping (address=>LotteryData) rouleMap;
    uint256 roulecount;
    
    mapping (address => Property) rouleproperty;
    
    uint8[] reward = [0, 2, 3, 4, 5, 6, 7, 8, 9];

    constructor(address _RoulefiToken) {
        RoulefiToken = _RoulefiToken;
    }

    function mint() external onlyOwner {
        IRouleFiToken(RoulefiToken).mint(address(this), 100000);
    }

    function drawroublefi() public {
        require(rouleMap[msg.sender].claimactivated == false, "already activated");
        rouleproperty[msg.sender].buyer = msg.sender;
        rouleproperty[msg.sender]._1 = (random() % 20) + 1;
        rouleproperty[msg.sender]._2 = (random() % 20) + 1;
        rouleproperty[msg.sender]._3 = (random() % 20) + 1;
        rouleproperty[msg.sender]._4 = (random() % 20) + 1;
        rouleproperty[msg.sender]._5 = (random() % 20) + 1;
        rouleproperty[msg.sender]._6 = (random() % 20) + 1;
        rouleproperty[msg.sender]._7 = (random() % 20) + 1;
    }

    function random() internal view returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % 100);
    }

    // user
    function buy(uint256 amount, uint8[] calldata buyData) public {
        internalBuy(amount, buyData[0], buyData[1], buyData[2], buyData[3], buyData[4], buyData[5], buyData[6]);
    }
    
    function claim() public returns (uint256) {
        uint256 rewardAmount;
        rewardAmount = internalClaim(msg.sender);
        
        if (rewardAmount > 0) {
            IRouleFiToken(RoulefiToken).mint(msg.sender, rewardAmount);
            IRouleFiToken(RoulefiToken).burn(address(this), rewardAmount);
        }
        
        setClaimed(msg.sender);
        return rewardAmount;
    }
    
    
    function internalBuy(uint256 amount, uint8 _1, uint8 _2, uint8 _3, uint8 _4, uint8 _5, uint8 _6, uint8 _7) internal {
        IRouleFiToken(RoulefiToken).burn(msg.sender, amount);
        IRouleFiToken(RoulefiToken).mint(address(this), amount);
        rouleMap[msg.sender].buyer = msg.sender;
        rouleMap[msg.sender]._1 = _1;
        rouleMap[msg.sender]._2 = _2;
        rouleMap[msg.sender]._3 = _3;
        rouleMap[msg.sender]._4 = _4;
        rouleMap[msg.sender]._5 = _5;
        rouleMap[msg.sender]._6 = _6;
        rouleMap[msg.sender]._7 = _7;
        rouleMap[msg.sender].amount = amount;
        rouleMap[msg.sender].claimactivated = false;
    }
    
    function internalClaim(address _owned) internal returns (uint256) {
        LotteryData memory l = rouleMap[_owned];
        require(l.buyer == msg.sender, "not your ticket");
        require(!l.claimactivated, "already claimed");

        drawroublefi();
        require(rouleproperty[msg.sender]._1 != 0, "not drawed yet");
        
        uint8 count = 0;
        if (l._1 == rouleproperty[msg.sender]._1)
            count++;
        if (l._2 == rouleproperty[msg.sender]._2)
            count++;
        if (l._3 == rouleproperty[msg.sender]._3)
            count++;
        if (l._4 == rouleproperty[msg.sender]._4)
            count++;
        if (l._5 == rouleproperty[msg.sender]._5)
        count++;
        if (l._6 == rouleproperty[msg.sender]._6)
        count++;
        if (l._7 == rouleproperty[msg.sender]._7)
        count++;
        
        return l.amount * reward[count];
    }
    
    function setClaimed(address _owned) private {
        rouleMap[_owned].claimactivated = true;
    }
    
    function return_value() public returns(uint8) {
        return rouleproperty[msg.sender]._1;
    }

    function add(uint256 _count) internal {
        roulecount = _count + 1;
        if(roulecount <= 0) {
            roulecount = 0;
        }
    }
}
