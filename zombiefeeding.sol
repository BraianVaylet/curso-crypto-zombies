// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

/*
 * 2#CAP_6: Importar:
 */
import "./zombiefactory.sol";

/*
 * 2#CAP_10: interfaz:
 * Para que nuestro contrato pueda hablar a otro contrato de la blockchain que no poseemos,
 * necesitamos definir una interfaz se asemeja a definir un contrato.
 * 1- Solo declaramos las funciones con las que queremos interactuar  y no mencionamos ninguna
 * otra función o variables de estado.
 * 2- No definimos el cuerpo de la función. En vez de usar las llaves ({ y }), solamente
 * terminaremos la función añadiendo un punto y coma al final de la declaración (;)
 * => Sería como definir el esqueleto del contrato.
 */
contract KittyInterface {

}

/*
 * 2#CAP_5: Herencia (POO)
 */
contract ZombieFeeding is ZombieFactory {
    /*
     * 2#CAP_7: Storage vs Memory:
     * En Solidity, hay dos sitios donde puedes guardar variables - en storage y en memory.
     * - Storage: se refiere a las variables guardadas permanentemente en la blockchain.
     * Suelen ser las declaradas fuera de las funciones, en la raiz del contrato.
     * - Memory: son variables temporales y son borradas en lo que una función externa llama a
     * tu contrato. Por defecto son las variables declaradas dentro de las funciones.
     * Solidity se encarga de seleccionar que tipo de variables es por defecto, salvo para los
     * structs y arrays donde nosotros debemos colocarle el tipo de var.
     */
    function feedAndMultiply(uint256 _zombieId, uint256 _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];
        _targetDna = _targetDna % dnaModulus;
        uint256 newDna = (myZombie.dna + _targetDna) / 2;
        _createZombie("NoName", newDna);
    }
}
