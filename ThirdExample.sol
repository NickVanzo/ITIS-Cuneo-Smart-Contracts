//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

contract ThirdExample {
    mapping(string => uint256) balances; //account id => balance
    mapping(string => address) owners; //account id => owner

    modifier onlyAccountOwner(string memory accountId) {
        require(
            owners[accountId] == msg.sender,
            "Unauthorized. This account is not yours."
        );
        _;
    }

    function transfer(
        string memory from,
        string memory to,
        uint256 amount
    ) public {
        withdraw(from, amount);
        deposit(to, amount);
    }

    /**
     * @notice the 'onlyAccountOwner' modifier is used to restrict access to this function
     */
    function withdraw(
        string memory accountId,
        uint256 amount
    ) public onlyAccountOwner(accountId) {
        require(
            balances[accountId] >= amount,
            "Insufficient funds to complete this transaction"
        );

        balances[accountId] -= amount;
    }

    function deposit(string memory accountId, uint256 amount) public {

        // if the account does not exist, register it
        if (owners[accountId] == address(0)) {
            registerNewAccount(accountId);
        }

        balances[accountId] += amount;
    }

    // private functions are only accessible within the contract, like private variables
    function registerNewAccount(string memory accountId) private {
        owners[accountId] = msg.sender;
    }

    function getBalance(string memory accountId) public view returns (uint256) {
        return balances[accountId];
    }

    function getAccountOwner(
        string memory accountId
    ) public view returns (address) {
        return owners[accountId];
    }
}
