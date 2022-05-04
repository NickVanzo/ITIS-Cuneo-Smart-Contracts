pragma solidity ^0.8.12;

contract PrimoEsempio {

    uint256 private valore;

    constructor() {
        valore = 10;
    }

    function setValore(uint256 nuovoValore) public {
        valore = nuovoValore;
    }

    function getValore() public view returns (uint256){
        return valore;
    }
}
