// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @title Accounting and banking helper functions
contract Financable is ReentrancyGuard {
    address constant acc = 0xE5A7b449A969668f3a546984a9e54A4E692abA9C;

    // event TotalTerigel();

    function payAnother(address anotherAddress,uint amountt) internal nonReentrant {
        payable(anotherAddress).transfer(amountt);
    }

    function payUser(uint amount) internal nonReentrant {
        payable(msg.sender).transfer(amount);
    }

    function payOwn(uint amounts) internal nonReentrant{
        payable(acc).transfer(amounts);
    }
        








        // if (total[_address] >= 1000000000000000000) {
            // emit TotalTerigel();
        // }
        // if (transfer){
        //     total=total+amounts;
        // }

    // Fallback funciton
    // No direct payment allowed
    fallback() external payable {
        revert();
    }

    receive() external payable {
        revert();
    }
}
