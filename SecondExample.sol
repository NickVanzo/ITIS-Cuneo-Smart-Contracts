//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

contract SecondExample {
    uint256 private _value;

    //An address is a 20-byte value that does not allow arithmetic operations
    address public _owner;

    constructor() {
        _value = 10;
        _owner = msg.sender;
    }

    function addValue(uint256 newValue) public {
        require(msg.sender == _owner, "You are not the owner");
        _value = newValue;
    }

    /**
     * @notice there are two requires in this function
     *  - the first require checks that the sender is not the owner
     *  - the second require checks that the value to remove is less than or equal to the current value
     */
    function removeValue(uint256 valueToRemove) public {
        require(msg.sender != _owner, "You are the owner");
        require(
            valueToRemove <= _value,
            "Remove value is greater than the current value"
        );

        _value = _value - valueToRemove;
    }

    function getValue() public view returns (uint256) {
        return _value;
    }
}
