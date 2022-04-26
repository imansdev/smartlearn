// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Financable {

    // Prizes
    mapping (address => uint) public prizes;

    // Fallback funciton
    // No direct payment allowed
    fallback() external payable {
        revert();
    }
    receive() external payable {
        revert();
    }

    function addPrize(address _address, uint _amount) internal {
        uint balance = prizes[_address];
        balance += _amount;
        prizes[_address] = balance;
    }

    function getPrize() public view returns (uint) {
        return prizes[msg.sender];
    }
    

    function withdrawPrize(uint withdrawAmount) public returns (uint) {
      // If the sender's balance is at least the amount they want to withdraw,
      // Subtract the amount from the sender's balance, and try to send that amount of ether
      // to the user attempting to withdraw. 
      // return the user's balance.

      // 1. Use a require expression to guard/ensure sender has enough funds
      require(getPrize() >= withdrawAmount);
  
      // 2. Transfer Eth to the sender and decrement the withdrawal amount from
      //    sender's balance
      prizes[msg.sender] -= withdrawAmount;
      payable(msg.sender).transfer(withdrawAmount); // TODO

      // 3. Emit the appropriate event for this message
      //    emit LogWithdrawal(msg.sender, withdrawAmount, getBalance());

      return getPrize();
    }


    function payUser(uint amount) internal {
        payable(msg.sender).transfer(amount);
    }
    
}