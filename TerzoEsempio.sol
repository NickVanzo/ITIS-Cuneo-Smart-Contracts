pragma solidity ^0.8.12;

contract TerzoEsempio {
    mapping(string => uint256) soldiInConti;
    mapping(string => address) proprietariConti;

    function stampaSaldo(string memory conto) public view returns(uint256) {
        return soldiInConti[conto];
    }

    function stampaProprietarioSaldo(string memory conto) public view returns(address) {
        return proprietariConti[conto];
    }

    function versaSoldi(string memory conto, uint256 quantita) public {
        if(proprietariConti[conto] == address(0)) proprietariConti[conto] = msg.sender;
        uint256 vecchioSaldo = soldiInConti[conto];
        soldiInConti[conto] = vecchioSaldo + quantita;
    }

    function prelevaSoldi(string memory conto, uint256 quantita) public {
        require(proprietariConti[conto] == msg.sender, "Non sei il proprietario del conto");
        uint256 vecchioSaldo = soldiInConti[conto];
        soldiInConti[conto] = vecchioSaldo - quantita;
    }

    function trasferisciConto(string memory daConto, string memory aConto, uint256 quantita) public {
        prelevaSoldi(daConto, quantita);
        versaSoldi(aConto, quantita);
    }
}
