// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./TaskFactory.sol";

contract SmartLearn is Ownable, TaskFactory {
  
 // Get user's all tasks
  function getTasks() public view returns (Task[] memory) {
    return _getTasks();
  }
  
  // Add a new task
  function add(string memory _description, uint _dueDate) public {
    _add(_description, _dueDate);
  }

  // Set a task as completed
  function setComplete(uint _id) public {
    _setComplete(_id);
  }

  // Set prize for a task
  function setPrize(uint _id) public payable {
    _setPrize(_id);
  }

  // Clear a task
  function clear(uint _id) public returns (bool) {
    return _clear(_id);
  }

  /**
   *pause() function is implemented to stop all deposits to the 
   *contract so that new users wouldn't loss their coins 
   *if there are any bugs in contract.
   */

    // Pause contract deposits
  function pause() public onlyOwner() {
    _pause();
  }

  // Unpause contract deposits
  function unpause() public onlyOwner() {
    _unpause();
  }

}
  
