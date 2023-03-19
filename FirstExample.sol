//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

contract FirstExample {
    /**
     * @dev The 'private' keyword means that other contracts cannot directly read or modify this variable
     * @notice The underscore is part of the Solidity naming convention for contract variables
     * uint256 is an unsigned integer that can hold any number from 0 to 2^256 - 1
     */
    uint256 private _value;

    constructor() {
        _value = 10;
    }

    /**
     * @notice a 'public' function can be called by anyone on the blockchain
     */
    function setvalue(uint256 newValue) public {
        _value = newValue;
    }

    /**
     * @dev Returns the value of the 'value' variable
     * @notice a 'view' function does not modify the state of the contract.
     * It does not cost any gas to call this function
     */
    function getValue() public view returns (uint256) {
        return _value;
    }
}
