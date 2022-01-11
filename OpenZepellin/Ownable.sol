/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 *
 * Ownable hace lo siguiente:
 * 1. Cuando el contrato ha sido creado, su constructor inicializa owner con msg.sender (la persona que lo ha implementado)
 * 2. Añade el modificador onlyOwner, que puede restringir el acceso a solo el owner en una función.
 * 3. Permite transferir el contrato a un nuevo owner.
 */
contract Ownable {
    address public owner;
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev The Ownable constructor sets the original `owner` of the contract to the sender
     * account.
     *
     * Constructores: function Ownable() es un constructor, que es una función especial opcional
     * que tiene el mismo nombre que el contrato. Será ejecutada una única vez, cuando el
     * contrato sea creado por primera vez.
     */
    function Ownable() public {
        owner = msg.sender;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     *
     * Modificadores de Funciones: modifier onlyOwner(). Los modificadores son como
     * semifunciones que son usadas para modificar otras funciones, normalmente para
     * comprobar algunos requisitos antes de la ejecución. En este caso, onlyOwner
     * puede ser usada para limitar el acceso y que solo el dueño del contrato pueda
     * ejecutar función. Hablaremos sobre los modificadores en el siguiente capítulo, y
     * que hace ese extraño _;.
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
