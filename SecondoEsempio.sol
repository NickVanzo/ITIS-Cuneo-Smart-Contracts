pragma solidity ^0.8.12;

contract SecondoEsempio {
    uint256 private valore;
    address public owner;

    constructor() {
        valore = 10;
        owner = msg.sender;
    }

    function setValore(uint256 nuovoValore) public {
        require(msg.sender == owner, "Non sei l'owner");
        valore = nuovoValore;
    }

    function getValore() public view returns (uint256) {
        require(msg.sender != owner, "Sei l'owner");
        return valore;
    }
}
