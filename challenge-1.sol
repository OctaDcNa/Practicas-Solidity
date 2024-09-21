// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract challenge_1 {

    address public immutable owner;

    event pago(address indexed from, uint256 amount);


    //Definimos el Owner del contrato
    constructor(address _ownerAddress) payable {
        require(_ownerAddress != address(0), "La address debe ser valida");
        owner = _ownerAddress;
    }

    //Emitimos un evento para el pago (No me estaba enterando si estaba el pago hecho xd)
    receive() external payable {
        emit pago(msg.sender, msg.value);
    }

    //Chequeamos el balance del contrato, por eso el (this)
    function balanceContract() public view returns (uint256) {
        return address(this).balance;
    }



    function retiro() public {
        require(msg.sender == owner, "Solo el owner puede retirar los fondos.");
        payable(owner).transfer(address(this).balance);
    }
}
