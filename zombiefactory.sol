// 1#CAP_0. Licencia del contracto.
// SPDX-License-Identifier: MIT

/*
 * ESTADOS:
 * public: Solidity creará automaticamente una función getter para acceder a él de forma publica (variables | estructuras | funciones).
 * private: Solo osn visibles dentro del contrato (variables | estructuras | funciones).
 * view: Significa que solo puede ver los datos pero no modificarlos (funciones).
 * pure: Significa que ni siquiera accedes a los datos de la aplicación (funciones).
 * internal: Igual que private, pero también accesible desde otros contratos que hereden de este.
 * external:  Parecido a public, pero estas funciones SOLO puedes ser llamadas desde fuera del contrato — no pueden ser llamadas por otras funciones dentro de ese contrato.
 */

/*
 * VARIABLES GLOBALES:
 * msg.sender: Hace referencia a la dirección de la persona (o el contrato inteligente) que ha llamado a esa función.
 */

// 1#CAP_1. Version de solidity.
pragma solidity ^0.8.11;

// 1#CAP_2. Estructura de un contrato.
contract ZombieFactory {
    /*
     * 1#CAP_13: Eventos:
     * Son la forma en la que nuestro contrato comunica que algo sucedió en la cadena de bloques
     * a la interfaz de usuario, el cual puede estar 'escuchando' ciertos eventos y hacer algo
     * cuando sucedan.
     */
    event NewZombie(uint256 zombieId, string name, uint256 dna);

    /*
     * 1#CAP_3. Variables de estado:
     * Se guardan permanentemente en el almacenamiento del contrato.
     * Esto significa que se escriben en la cadena de bloques de Ethereum.
     * Piensa en ellos como en escribir en una base de datos.
     * Esto se guardará permanentemente en la cadena de bloques.
     */
    uint256 dnaDigits = 16;

    /*
     * 1#CAP_4. Operaciones Matematicas:
     * Suma: x + y
     * Resta: x - y,
     * Multiplicación: x * y
     * División: x / y
     * Módulo: x % y
     * Exponencial: x ** y
     */
    uint256 dnaModulus = 10**dnaDigits;

    /*
     * 1#CAP_5. Estructuras: (struct)
     * Las estructuras te permiten crear tipos de datos más complejos que tienen varias propiedades.
     */
    struct Zombie {
        string name;
        uint256 dna;
    }

    /*
     * 1#CAP_6. Arrays:
     * Hay dos tipos de arrays en Solidity: arrays fijos y arrays dinámicos.
     * - uint[2] fixedArray // Array con una longitud fija de 2 elementos.
     * - uint[] dynamicArray // Array dinámico, sin longitud fija que puede seguir creciendo.
     * Puedes crear arrays de estructuras.
     * - Person[] people // Array de estructura Person llamado people.
     */
    Zombie[] public zombies;

    /*
     * 2#CAP_2. Mapeos y Direcciones:
     * address: La blockchain de Ethereum está creada por cuentas. Una cuenta tiene
     * un balance de Ether. Cada cuenta tiene una dirección, que sería como el número de
     * la cuenta bancaria. Es un identificador único que apuntado a una cuenta.
     *
     * mapping: Es esencialmente una asociación clave-valor para guardar y ver datos
     */
    mapping(uint256 => address) public zombieToOwner;
    mapping(address => uint256) ownerZombieCount;

    /*
     * 1#CAP_7. Declaracion de funciones:
     * Nota: la convención (no obligatoria) es llamar los parámetros de las funciones
     * con nombres que empiezan con un subrayado (_) para de esta forma diferenciarlos
     * de variables globales.
     *
     * 1#CAP_9. Funciones publicas y privadas:
     * En Solidity, las funciones son públicas (public) por defecto. Culaquiera puede llamarla y ejecutarla.
     * Podemos hacer funciones privadas con private.
     * Nota: la convención es nombrar las funciones privadas empezando con una barra baja (_).
     *
     * 1#CAP_10. Mas sobre funciones:
     * Las funciones declaradas como view pueden ver los datos pero no modificarlos, mientras
     * que las pure ni siquiera pueden acceder a los datos de la aplicacion.
     * Podemos declarar lo que va a retornar la funcion como "returns (string)" (por ejemplo)
     *
     * 2#CAP_9: Internal y External
     */
    function _createZombie(string memory _name, uint256 _dna) internal {
        // 1#CAP_8. Trabajando con estructuras y arrays: Creo un nuevo Zombie y lo agrego a zombies.
        zombies.push(Zombie(_name, _dna));
        // obtengo id.
        uint256 id = zombies.length - 1;
        /*
         * 2#CAP_3: msg.sender:
         * Variable global, direccion de la persona o smart-contract que ha llamada a esta funcion.
         *
         * Nota: En Solidity, la ejecución de una función necesita empezar con una llamada exterior.
         * Un contrato se sentará en la blockchain sin hacer nada esperando a que alguien llame a
         * una de sus funciones. Así que siempre habrá un msg.sender.
         */
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        // emito mi evento.
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str)
        private
        view
        returns (uint256)
    {
        /*
         * 1#CAP_11. Keccak256 y Encasillado de tipo:
         * Ethereum incluye una función hash llamada keccak256, que es una versión de SHA3.
         * Una función hash lo que hace es mapear una cadena de caracteres a un número aleatorio
         * hexadecimal de 256-bits. Un pequeño cambio en la cadena de texto producirá un hash
         * completamente distinto.
         *
         * Ej: keccak256("aaaab"); // 6e91ec6b618bb462a4a6ee5aa2cb0e9cf30f7a052bb467b0ba58b8748c00d2e5.
         *
         * Nota: Generar números aleatorios de forma segura en la cadena de bloques
         * es algo muy difícil. El método que usamos aquí no es seguro, pero la seguridad no es
         * nuestra prioridad para el ADN del Zombi, es suficiente para este propósito.
         *
         * Casteo de variables: Podemos convertir entre tipos de variables.
         *
         * Ej: uint8 a = 5; uint b = 6; uint8 c = a * uint8(b); // debemos forzar b para que no de error.
         */
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        /*
         * 2#CAP_4. Require:
         * Hace que la función lanze un error y pare de ejecutarse si la condición no es verdadera
         */
        require(ownerZombieCount[msg.sender] == 0);

        uint256 randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
