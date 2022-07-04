// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Coursable is ReentrancyGuard {
    mapping(address => uint256) public total;
    mapping(address => uint256) public courseCount;

    uint256 public target = 100000000000000000;

    function addToTotal(address _address, uint256 _amount)
        internal
        nonReentrant
    {
        uint256 balance = total[_address];
        balance += _amount;
        total[_address] = balance;
        addToReachTotal();
    }

    function addToReachTotal() public {
        if (total[msg.sender] >= target) {
            courseCount[msg.sender] += 1;
            target += target;
        }
    }

    function reachTotal() public view returns (uint256) {
        // if(total[msg.sender] >= target){
        //     courseCount[msg.sender]+=1;
        //     target+=target;
        // }
        // courseCount[msg.sender] = 0;
        return courseCount[msg.sender];
    }

    function decreaseCount(uint256 count) public {
        count -= 1;
        courseCount[msg.sender] = count;
    }

    function getTotal() public view returns (uint256) {
        return total[msg.sender];
    }
}
