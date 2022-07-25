// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Coursable is ReentrancyGuard {
    mapping(address => uint256) public total;
    mapping(address => uint256) public courseCount;
    mapping(address => uint256) public arrived;

    uint256 public constant target = 1000000000000000000;

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
        while (arrived[msg.sender] >= target) {
            courseCount[msg.sender] += 1;
            arrived[msg.sender] -= target;
        }
    }

    function decreaseCount(uint256 count) public {
        count -= 1;
        courseCount[msg.sender] = count;
    }

    function reachTotal() public view returns (uint256) {
        return courseCount[msg.sender];
    }

    function getTotal() public view returns (uint256) {
        return total[msg.sender];
    }
}
