// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Coursable is ReentrancyGuard {
    mapping(address => uint256) public total;
    mapping(address => uint256) public courseCount;
    mapping(address => uint256) public arrived;

    uint256 constant public target = 1000000000000000000;
    // uint256 public arrived = 0;
    function addToTotal(address _address, uint256 _amount)
        internal
        nonReentrant
    {
        uint256 balance = total[_address];
        balance += _amount;
        total[_address] = balance;
        addToReachTotal(_amount);
    }

    function addToReachTotal(uint256 _arrived) public {
        arrived[msg.sender] += _arrived;
        while(arrived[msg.sender] >= target){
            courseCount[msg.sender] += 1;
            arrived[msg.sender] -=target;
        }
        // if (total[msg.sender] >= target) {
        //     courseCount[msg.sender] += 1;
        //     target += target;
        // }
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
