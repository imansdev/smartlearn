// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./Financable.sol";
import "./Coursable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract CourseFactory is Coursable, Financable, Pausable {
    /*
     * Constant variables
     */

    uint256 public constant WAGE = 100000000000000000 wei;

    /*
     * State variables
     */

    // Course structure
    struct Course {
        string description;
        address anotherWallet;
        uint256 createdAt;
        uint256 finishedAt;
        uint256 value;
        uint256 deadline;
        bool completed;
        bool killed;
        bool punishMe;
        bool toAnother;
    }

    // Courses
    mapping(address => Course[]) public courses;

    /*
     * Event
     */

    // Courses updated event
    event LogCoursesUpdated();

    /*
     * Modifiers
     */

    // Due date should be after current block timestamp
    modifier validDeadline(uint256 _deadline) {
        require(_deadline > block.timestamp);
        _;
    }

    modifier validPrize(uint256 _value) {
        require(_value > WAGE);
        _;
    }

    modifier validToRemove(uint256 _id) {
        require(getCourse(_id).completed || getCourse(_id).killed);
        _;
    }

    // If a course is not completed
    modifier incomplete(uint256 _id) {
        require(!getCourse(_id).completed);
        _;
    }

    modifier validAnotherAddress(address _anotherWallet, bool _toAnother) {
        require(
            (_anotherWallet != address(0) && _toAnother) ||
                (_anotherWallet == address(0) && !_toAnother)
        );
        _;
    }

    /*
     * Functions
     */

    // Add course
    function _add(
        string memory _description,
        uint256 _deadline,
        address _anotherWallet,
        bool _punishMe,
        bool _toAnother
    )
        internal
        validDeadline(_deadline)
        validPrize(msg.value)
        validAnotherAddress(_anotherWallet, _toAnother)
    {
        // Create a course instance
        Course memory course = Course({
            description: _description,
            deadline: _deadline,
            anotherWallet: _anotherWallet,
            createdAt: block.timestamp,
            finishedAt: 100,
            value: msg.value,
            completed: false,
            killed: false,
            punishMe: _punishMe,
            toAnother: _toAnother
        });

        // Push created course to user's courses
        courses[msg.sender].push(course);

        // Log courses are updated
        emit LogCoursesUpdated();
    }

    function _donate() internal {
        require(msg.value != 0);
        payOwn(msg.value);
        addToTotal(msg.sender, msg.value);
    }

    // Set complete
    function _setComplete(uint256 _id) internal incomplete(_id) {
        require(!isExpired(_id), "due date is expired");
        Course memory course = getCourse(_id);

        course.completed = true;
        course.finishedAt = block.timestamp;
        uint256 valueBack = course.value - WAGE;
        payOwn(WAGE);
        if (course.toAnother == true) {
            payAnother(course.anotherWallet, valueBack);
        } else {
            payUser(valueBack);
        }
        replace(_id, course);
        addToTotal(msg.sender, WAGE);
    }

    // Remove course
    function _remove(uint256 _id) internal validToRemove(_id) {
        uint256 userCoursesLength = courses[msg.sender].length;

        require(_id < userCoursesLength);

        courses[msg.sender][_id] = courses[msg.sender][userCoursesLength - 1];
        courses[msg.sender].pop();

        emit LogCoursesUpdated();
    }

    // Kill a course
    function _kill(uint256 _id) internal {
        Course memory course = getCourse(_id);
        uint256 valueBack = course.value - WAGE;
        require(isExpired(_id), "due date is expired");
        course.killed = true;
        if (course.punishMe == false) {
            payOwn(WAGE);
            payUser(valueBack);
            addToTotal(msg.sender, WAGE);
        } else {
            payOwn(course.value);
            addToTotal(msg.sender, course.value);
        }
        replace(_id, course);
    }

    // Replace course
    function replace(uint256 _id, Course memory _course) private {
        courses[msg.sender][_id] = _course;

        emit LogCoursesUpdated();
    }

    // Is course overdue
    function isExpired(uint256 _id) private view returns (bool) {
        Course memory course = getCourse(_id);
        if (course.deadline == 0) {
            return false;
        }
        return (course.deadline < block.timestamp);
    }

    // Get current user courses
    function _getCourses() internal view returns (Course[] memory) {
        return courses[msg.sender];
    }

    // Get course
    function getCourse(uint256 _id) private view returns (Course memory) {
        require(courses[msg.sender].length > _id);
        return courses[msg.sender][_id];
    }
}
