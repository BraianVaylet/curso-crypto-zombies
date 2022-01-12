# Aprendiendo Solidity con [CryptoZombies](https://cryptozombies.io/).

# Sección 1: Creando la Fábrica de Zombies

- [Capitulo1](https://cryptozombies.io/es/lesson/1/chapter/1): [Resumen de la Lección](#resumen-de-la-lección)
- [Capitulo2](https://cryptozombies.io/es/lesson/1/chapter/2): [Contratos](#contratos)
- [Capitulo3](https://cryptozombies.io/es/lesson/1/chapter/3): [Variables de Estado y Números Enteros](#variables-de-estado-y-números-enteros)
- [Capitulo4](https://cryptozombies.io/es/lesson/1/chapter/4): [Operaciones Matemáticas](#operaciones-matemáticas)
- [Capitulo5](https://cryptozombies.io/es/lesson/1/chapter/5): [Estructuras](#estructuras)
- [Capitulo6](https://cryptozombies.io/es/lesson/1/chapter/6): [Arrays](#arrays)
- [Capitulo7](https://cryptozombies.io/es/lesson/1/chapter/7): [Declaración de Funciones](#declaración-de-funciones)
- [Capitulo8](https://cryptozombies.io/es/lesson/1/chapter/8): [Trabajando con estructuras y arrays](#trabajando-con-estructuras-y-arrays)
- [Capitulo9](https://cryptozombies.io/es/lesson/1/chapter/9): [Funciones Públicas y Privadas](#funciones-públicas-y-privadas)
- [Capitulo10](https://cryptozombies.io/es/lesson/1/chapter/10): [Más sobre Funciones](#más-sobre-funciones)
- [Capitulo11](https://cryptozombies.io/es/lesson/1/chapter/11): [Keccak256 y Encasillado de tipo](#keccak256-y-encasillado-de-tipo)
- [Capitulo12](https://cryptozombies.io/es/lesson/1/chapter/12): [Juntandolo Todo](#juntandolo-todo)
- [Capitulo13](https://cryptozombies.io/es/lesson/1/chapter/13): [Eventos](#eventos)
- [Capitulo14](https://cryptozombies.io/es/lesson/1/chapter/14): [Web3.js](#web3.js)

---

# Creando la Fábrica de Zombies

# Resumen de la Lección

En la Lección 1 vas a construir una "Fábrica de Zombis" para poder crear tu ejército de zombis.

- Nuestra fábrica mantendrá una base de datos de todos los zombis en nuestro ejército
- Nuestra fábrica tendrá una función que cree nuevos zombis
- Cada zombi tendrá una apariencia aleatoria y no habrá dos iguales

En las siguientes lecciones añadiremos más funcionalidades, ¡cómo la capacidad de atacar humanos u otros zombis! Pero antes de que lleguemos allí tendremos que contar con la funcionalidad de crear nuevos zombis.

## Cómo funciona el ADN de los Zombis

La apariencia del zombi está basada en el ADN del Zombi. El ADN del Zombi es sencillo, es un número de 16 dígitos, como este:

```
8356281049284737
```

Al igual que el ADN de verdad, las diferentes partes de este número están ligadas a los diferentes rasgos del Zombi. Los dos primeros dígitos indican el tipo de cabeza, los 2 siguientes son para los ojos etc.

> _Nota: Para este tutorial mantendremos las cosas sencillas, y nuestros zombis solo tendrán 7 tipos distintos de cabezas (aunque podríamos tener 100 con dos dígitos). Más tarde añadiremos más tipos de cabeza para poder aumentar el número posible de variantes de zombis._

En el ejemplo de arriba, los dos primeros dígitos del ADN son 84. Para mapear el tipo de cabeza hacemos una división módulo 7 y añadimos uno, 83 % 7 + 1 = 7. Así el zombi tendrá el séptimo tipo de cabeza.

Usando el panel de la derecha mueve la barra del Gen Cabeza hasta la cabeza 7 (la que tiene el gorro de Santa Claus) para así ver que trazo corresponde con él.

## Vamos a probarlo

1. Juega con las barras de desplazamiento de la derecha de la página. Experimenta para ver cómo diferentes valores corresponden con diferentes aspectos del zombi.

Ok, ya hemos jugado bastante. Cuando estés listo para continuar ¡dale a "Capítulo Siguiente" abajo para comenzar a aprender Solidity!

# Contratos

Empecemos con lo más fundamental:

El código Solidity está encapsulado en contratos. Un contrato es el bloque de construcción más básico de las aplicaciones de Ethereum — todas las variables y las funciones pertenecen a un contrato, y este será el punto de partida de todos tus proyectos.

Un contrato vacio llamado HolaMundo se parecería a esto:

```solidity
contract HolaMundo {
 // codigo del contrato
}
```

## Versión Pragma

Todo el código fuente en Solidity debería empezar con una declaración "version pragma" de la versión del compilador que debe de usarse para ese código. Esto previene problemas con versiones futuras del compilador que podrían no ser compatibles y fallar con tu código.

Esta declaración se asemeja a esto: **pragma solidity ^0.4.25;** (para usar la última versión del compilador de Solidity actual, la 0.4.25).

Poniendo todo junto, este es el esqueleto de como se empieza un contrato — lo primero que escribirás cada vez que empieces un nuevo proyecto:

```solidity
pragma solidity ^0.4.25;

contract HolaMundo {
  // codigo del contrato
}
```

## Vamos a probarlo

Para empezar a crear tu ejército de Zombis, vamos a crear un contrato base llamado ZombieFactory (Fábrica de Zombis).

1. En la caja de la derecha, haz lo necesario para que el contrato use la versión de Solidity 0.4.25.
2. Crea un contrato vacio que se llame ZombieFactory.

Cuando hayas terminado, haz clic en "comprobar respuesta" abajo. Si te quedas atascado, haz clic en "pistas".

# Variables de Estado y Números Enteros

¡Buen trabajo! Ahora que tenemos una capa para nuestro contrato, aprendamos cómo maneja las variables Solidity.

Las **Variables de estado** se guardan permanentemente en el almacenamiento del contrato. Esto significa que se escriben en la cadena de bloques de Ethereum. Piensa en ellos como en escribir en una base de datos. Ejemplo:

```solidity
contract Example {
  // Esto se guardará permanentemente en la cadena de bloques
  uint myUnsignedInteger = 100;
}
```

En este contrato de ejemplo, hemos creado un uint llamado myUnsignedInteger y le hemos dado el valor 100.

## Enteros sin Signo: uint

El tipo de dato uint es un entero sin signo, esto es su valor siempre debe ser no-negativo. Hay también un tipo de dato int para números enteros con signo.

> _Nota: En Solidity, uint es realmente un alias para uint256, un número entero de 256-bits. Puedes declarar uints con menos bits — uint8, uint16, uint32, etc.. Pero por lo general usaremos uint excepto en casos específicos, de los que hablaremos en otras lecciones más adelante._

## Vamos a probarlo

El ADN de nuestro Zombi va a estar determinado por un número de 16 dígitos.

1. Declara una variable de tipo uint llamada dnaDigits, y asígnale el valor 16.

# Operaciones Matemáticas

Las matemáticas de Solidity son bastante básicas. Las siguientes operaciones son las mismas en prácticamente todos los lenguajes de programación:

- Suma: x + y
- Resta: x - y,
- Multiplicación: x \* y
- División: x / y
- Módulo: x % y (por ejemplo, 13 % 5 es 3, ya que al dividir 13 entre 5, 3 es el resto)

Solidity también tiene un operador exponencial (por ejemplo "x elevado a y", x^y):

```solidity
uint x = 5 ** 2; // es igual a 5^2 = 25
```

## Vamos a probarlo

Para asegurarnos de que el ADN de nuestro Zombi tiene solo 16 dígitos, creemos un número entero sin signo igual a 10^16 y usémoslo para calcular el módulo cualquiera.

1. Crea una variable de tipo uint llamada dnaModulus, y dale el valor de 10 elevado a dnaDigits.

# Estructuras

Algunas veces necesitas tipos de datos más complejos. Para esto Solidity proporciona structs (estructuras de datos):

```solidity
struct Person {
  uint age;
  string name;
}
```

Las estructuras te permiten crear tipos de datos más complejos que tienen varias propiedades.

> _Nota: acabamos de introductir un nuevo tipo de dato string, que se usan para cadenas de texto UTF-8 de longitud arbitraria. Ejemplo: string greeting = "¡Hola Mundo!"_

## Vamos a probarlo

En nuestra aplicación, vamos a querer crear unos cuantos zombies. Y los zombis tienen varias propiedades, así que es un caso perfecto para usar estructuras de datos structs

1. Crea un struct llamado Zombie.
2. Nuestra estructura Zombie tendrá dos propiedades: name (de tipo string), y dna (de tipo uint).

# Arrays

Cuando quieres tener una colección de algo, puedes usar un array. Hay dos tipos de arrays en Solidity: arrays **fijos** y arrays **dinámicos**:

```solidity
// Un Array con una longitud fija de 2 elementos:
uint[2] fixedArray;
// otro Array fijo, con longitud de 5 elementos:
string[5] stringArray;
// un Array dinámico, sin longitud fija que puede seguir creciendo:
uint[] dynamicArray;
```

También puedes crear arrays de estructuras. Si usásemos la estructura Person del capítulo anterior:

```solidity
Person[] people; // Array dinámico, podemos seguir añadiéndole elementos
```

¿Recuerdas que las variables de estado quedan guardadas permanentemente en la blockchain? Así que crear un array de estructuras puede ser muy útil para guardar datos estructurados en tu contrato, como una base de datos.

## Arrays Públicos

Puedes declarar un array como público, y Solidity creará automaticamente una función getter para acceder a él. La sintaxis es así:

```solidity
Person[] public people;
```

Otros contratos entonces podrán leer (pero no escribir) de este array. Es un patrón de uso muy útil para guardar datos públicos en tu contrato.

## Vamos a probarlo

Vamos a guardar un ejército de zombis en nuestra aplicación. Y vamos a querer mostrar todos nuestros zombis a otras applicaciones, así que lo queremos público:

1. Crea un array público de estructuras Zombie y llámalo zombies.

# Declaración de Funciones

Una declaración de una función en Solidity se asemeja a esto:

```solidity
function eatHamburgers(string _name, uint _amount) {

}
```

Esta es una función llamada eatHamburgers que toma dos parámetros: una cadena de texto (string) y un número entero sin signo uint. Por ahora dejamos el cuerpo de la función vacio.

> _Nota: la convención (no obligatoria) es llamar los parámetros de las funciones con nombres que empiezan con un subrayado (\_) para de esta forma diferenciarlos de variables globales. Utilizaremos esta convención en este tutorial._

Y llamaríamos a esta función de esta forma:

```solidity
eatHamburgers("vitalik", 100);
```

## Vamos a probarlo

En nuestra aplicación, vamos a necesitar poder crear unos cuantos zombis. Creemos una función para ello.

1. Crear una función llamada createZombie. Debería tomar dos parámetros \_name (un string), y \_dna (un número entero sin signo uint).

Dejemos el cuerpo de la función vacio por ahora, lo rellenaremos más tarde.

# Trabajando con estructuras y arrays

## Creando nuevas Estructuras (Structs)

¿Recuerdas las estructura Person en el ejemplo anterior?

```solidity
struct Person {
  uint age;
  string name;
}

Person[] public people;
```

Ahora aprenderemos como crear un nuevo Person y añadirlo a nuestro array people.

```solidity
// crear un nuevo `Person`
Person satoshi = Person(172, "Satoshi");

// añadir esta persona a nuestro array
people.push(satoshi);
```

También podemos combinar estas dos cosas para hacerlas en una sola línea y mantener el código limpio:

```solidity
people.push(Person(16, "Vitalik"));
```

Date cuenta que array.push() añade algo al final del array, así que los elementos siguen el orden de añadido. Observa este ejemplo:

```solidity
uint[] numbers;
numbers.push(5);
numbers.push(10);
numbers.push(15);
// el array `numbers` es ahora [5, 10, 15]
```

## Vamos a probarlo

¡Hagamos hacer algo a nuestra función createZombie!

1. Rellena el cuerpo de la función para que cree un nuevo Zombie y añádelo al array zombies. El nombre (name) y ADN (dna) del nuevo Zombi debería venir de los argumentos pasados a la función.
2. Hagámoslo en una sola línea de código para que quede bonito.

# Funciones Públicas y Privadas

En Solidity, las funciones son públicas (public) por defecto. Esto significa que cualquiera (o cualquier otro contrato) puede llamarla y ejecutar su código.

Esto no es algo que queramos que pase siempre, y de hecho puede hacer vulnerables tus contratos. Es por lo tanto una buena práctica marcar tus funciones como privadas (private), y solamente hacer públicas aquellas que queramos exponer al mundo exterior.

Vamos a ver como se declara una función privada:

```solidity
uint[] numbers;

function _addToArray(uint _number) private {
  numbers.push(_number);
}
```

Esto significa que solo otras funciones dentro de tu contrato podrán llamar a esta función y añadir al array numbers.

Como puedes ver, usamos la palabra clave private después del nombre de la función. Y de las misma forma que con los parámetros de funciones, la convención es nombrar las funciones privadas empezando con una barra baja (\_).

## Vamos a probarlo

Nuestro contrato tiene una función createZombie que es pública por defecto, esto significa ¡qué cualquiera podría llamarlo y crear un nuevo zombi en nuestro contrato! Vamos a hacerla privada.

1. Modifica la función createZombie para que sea una función privada. ¡No te olvides de la convención del nombre!

# Más sobre Funciones

En este capítulo aprenderemos sobre los valores de retorno de una función, y sobre modificadores de funciones.

## Valores de Retorno

Para devolver un valor desde una función, la declaración es la siguiente:

```solidity
string greeting = "Qué tal viejo!";

function sayHello() public returns (string) {
  return greeting;
}
```

En Solidity, la declaración de la función contiene al final tipo de dato del valor de retorno (en nuestro caso string).

## Modificadores de función

La función de arriba no cambia el estado en Solidity, esto es que no cambia ningún valor o escribe nada.

En este caso podríamos declararla como función view, que significa que solo puede ver los datos pero no modificarlos:

```soliidty
function sayHello() public view returns (string) {
```

Solidity también contiene funciones pure, que significa que ni siquiera accedes a los datos de la aplicación. Por ejemplo:

```solidity
function _multiply(uint a, uint b) private pure returns (uint) {
  return a * b;
}
```

Esta función no lee desde el estado de la aplicación - el valor devuelto depende por completo de los parámetros que le pasemos. En este caso deberíamos declarar la función como **pure**.

> _Nota: No siempre es fácil recordar marcar una función como pure o view, por suerte el compilador de Solidity es muy bueno avisándonos de cuándo debemos usar estos modificadores de función._

## Vamos a probarlo

Necesitaremos una función que nos ayude a generar un número aleatorio para el ADN a partir de una cadena de texto.

1. Crear una función private que se llame \_generateRandomDna. Recibirá un parámetro llamado \_str (de tipo string), y devolverá un uint.
2. Esta función tendrá que ver algunas de las variables de nuestro contrato, pero no modificará ninguna, así que la marcaremos como view.
3. El cuerpo de la función debería estar vacio por ahora, lo rellenaremos más tarde.

# Keccak256 y Encasillado de tipo

Queremos que nuestra función \_generateRandomDna devuelva un valor semi-aleatorio uint. ¿Cómo se puede conseguir esto?

Ethereum incluye una función hash llamada keccak256, que es una versión de SHA3. Una función hash lo que hace es mapear una cadena de caracteres a un número aleatorio hexadecimal de 256-bits. Un pequeño cambio en la cadena de texto producirá un hash completamente distinto.

Es muy útil para muchas cosas, pero por ahora vamos a usarlo solamente para generar un número cuasi-aleatorio.

Ejemplo:

```solidity
//6e91ec6b618bb462a4a6ee5aa2cb0e9cf30f7a052bb467b0ba58b8748c00d2e5
keccak256("aaaab");
//b1f078126895a1424524de5321b339ab00408010b7cf0e6ed451514981e58aa9
keccak256("aaaac");
```

Como puedes ver, el valor devuelto para cada caso es completamente distinto, a pesar de que sólo hemos cambiado un carácter del argumento.

> _Nota: Generar números aleatorios de forma segura en la cadena de bloques es algo muy difícil. El método que usamos aquí no es seguro, pero la seguridad no es nuestra prioridad para el ADN del Zombi, es suficiente para este propósito._

## Casteo de variables

A veces es necesario convertir entre tipos de datos. Por ejemplo en el siguiente caso:

```solidity
uint8 a = 5;
uint b = 6;
// dará un error porque a * b devuelve un `uint` y no un `uint8`:
uint8 c = a * b;
// debemos de forzar la variable b para que sea convertida a `uint8`
uint8 c = a * uint8(b);
```

En el código de arriba. a \* b devuelve un uint, pero estábamos intentando guardarlo como uint8, lo que podría causar problemas. Casteándolo a uint8 funcionará y el compilador no nos dará error.

## Vamos a probarlo

Vamos a rellenar el cuerpo de la función \_generateRandomDna , esto es lo que deberíamos hacer:

1. La primera línea de código debería tomar el hash keccak256 de \_str para generar un hexadecimal cuasialeatorio, forzar el tipo como uint, y por último guardar el resultado en un uint llamado rand.
2. Queremos que nuestro ADN tenga solamente 16 dígitos (¿Recuerdas nuestra variable dnaModulus?). Así que la segunda línea de código debería devolver el módulo del valor de arriba (%) dnaModulus.

# Juntandolo Todo

¡Estamos a punto de terminar nuestro generador aleatorio de Zombis! Vamos a crear una función pública que ponga todo junto.

Vamos a crear una función pública que tomará un parámetro, el nombre del zombi, y usará ese nombre para crear un zombi con un ADN aleatorio.

## Vamos a probarlo

1. Crea una función pública (public) llamada createRandomZombie. Recibirá un parámetro llamado \_name (una cadena de caracteres string). (Nota: declara esta función como public de la misma forma que hiciste para declarar las anteriores funciones private)
2. La primera línea de la función debería llamar a la función \_generateRandomDna usando \_name como parámetro y guardar el resultado en un uint llamado randDna.
3. La segunda línea debería de llamar a la función \_createZombie y pasarle los parámetros \_name y randDna.
4. La solución debería contener 4 líneas de código (incluyendo la llave de cierre } de la función).

# Eventos

¡Nuestro contrato está casi terminado! Añadamos ahora un evento.

Los eventos son la forma en la que nuestro contrato comunica que algo sucedió en la cadena de bloques a la interfaz de usuario, el cual puede estar 'escuchando' ciertos eventos y hacer algo cuando sucedan.

Ejemplo:

```solidity
// declara el evento
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public {
  uint result = _x + _y;
  // lanza el evento para hacer saber a tu aplicación que la función ha sido llamada:
  emit IntegersAdded(_x, _y, result);
  return result;
}
```

La aplicación con la interfaz de usuario podría entonces estar escuchando el evento. Una implementación en JavaScript sería así:

```solidity
YourContract.IntegersAdded(function(error, result) {
  // hacer algo con `result`
}
```

## Vamos a probarlo

Queremos tener un evento que nos haga saber cada vez que un zombi nuevo se ha creado, de forma que pueda mostrarnoslo.

1. Declara un evento llamado NewZombie. Debería pasar las variables zombieId (un uint), name (un string), y dna (un uint).
2. Modifica la función \_createZombie para lanzar el evento NewZombie después de haber añadido el nuevo Zombi a nuestro array de zombies.
3. Vas a necesitar el id del zombi. array.push() devuelve un uint con el nuevo tamaño del array - y como el primer elemento del array tiene índice 0, array.push() - 1 será el índice del zombi que acabamos de añadir. Guarda el resultado de zombies.push() - 1 en un número de tipo uint llamado id, así podrás usarlo en el evento NewZombie de la siguiente línea.

# Web3.js

¡Nuestro contrato en Solidity está completo! Ahora tenemos que escribir una aplicación de usuario en javascript para interactuar con él.

Ethereum tiene una librería Javascript llamada Web3.js.

En lecciones posteriores veremos en detalle cómo publicar un contrato y como configurar Web3.js. Pero por ahora vamos solamente a ver un ejemplo de código de cómo Web3.js interactuaría con nuestro contrato.

No te preocupes si esto no tiene mucho sentido para tí todavía.

```javascript
// Así es como accederiamos a nuestro contrato:
var abi = /* abi generado por el compilador */
var ZombieFactoryContract = web3.eth.contract(abi)
var contractAddress = /* nuestra dirección del contrato en Ethereum después de implementarlo */
var ZombieFactory = ZombieFactoryContract.at(contractAddress)
// `ZombieFactory` ha accedido a las funciones y eventos públicos de nuestro contrato

// algunos eventos están escuchando para recoger el valor del texto:
$("#ourButton").click(function(e) {
  var name = $("#nameInput").val()
  // Llama a la función `createRandomZombie` de nuestro contrato:
  ZombieFactory.createRandomZombie(name)
})

// Escucha al evento de `NewZombie`, y actualiza la interfaz
var event = ZombieFactory.NewZombie(function(error, result) {
  if (error) return
  generateZombie(result.zombieId, result.name, result.dna)
})

// Recogemos el adn del zombi y actualizamos nuestra imagen
function generateZombie(id, name, dna) {
  let dnaStr = String(dna)
  // rellenamos el ADN con ceros si es menor de 16 caracteres
  while (dnaStr.length < 16)
    dnaStr = "0" + dnaStr

  let zombieDetails = {
    // los primeros 2 dígitos hacen la cabeza. Tenemos 7 posibles cabezas, entonces hacemos % 7
    // para obtener un número entre 0 - 6, después le sumamos 1 para hacerlo entre 1 - 7. Tenemos 7
    // imágenes llamadas desde "head1.png" hasta "head7.png" que cargamos en base a
    // este número:
    headChoice: dnaStr.substring(0, 2) % 7 + 1,
    // Los siguientes 2 dígitos se refieren a los ojos, 11 variaciones:
    eyeChoice: dnaStr.substring(2, 4) % 11 + 1,
    // 6 variaciones de camisetas:
    shirtChoice: dnaStr.substring(4, 6) % 6 + 1,
    // los últimos 6 dígitos controlas el color. Actualiza el filtro CSS: hue-rotate
    // que tiene 360 grados:
    skinColorChoice: parseInt(dnaStr.substring(6, 8) / 100 * 360),
    eyeColorChoice: parseInt(dnaStr.substring(8, 10) / 100 * 360),
    clothesColorChoice: parseInt(dnaStr.substring(10, 12) / 100 * 360),
    zombieName: name,
    zombieDescription: "A Level 1 CryptoZombie",
  }
  return zombieDetails
}
```

Lo que nuestro código javascript hace es recoger los valores generados en zombieDetails más arriba, y usar un poco de magia Javascript en el navegador (usamos Vue.js) para intercambiar las imágenes y aplicar filtros CSS. Te daremos todo el código para hacer esto en una lección posterio

## Resultado: [Zombie Braian](https://share.cryptozombies.io/es/lesson/1/share/braian?id=Y3p8MTUxMzYx)
