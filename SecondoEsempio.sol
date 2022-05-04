pragma solidity ^0.8.12;

contract SecondoEsempio {
    uint256 private valore;
    address public owner;

    constructor() {
        valore = 10;
        owner = msg.sender;
    }

    function addValore(uint256 nuovoValore) public {
        require(msg.sender == owner, "Non sei l'owner");
        valore = nuovoValore;
    }

    function removeValore(uint256 daTogliere) public {
        require(msg.sender != owner, "Sei l'owner");
        require(daTogliere <= valore, "Stai togliendo troppo");

        valore = valore - daTogliere;
    }

    function stampaValore() public view returns (uint256) {
        return valore;
    }
}
