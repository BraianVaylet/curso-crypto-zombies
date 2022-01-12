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

# Sección 2: Los Zombies atacan a sus victimas

- [Capitulo1](https://cryptozombies.io/es/lesson/2/chapter/1): [Resumen de la Lección 2](#resumen-de-la-lección-2)
- [Capitulo2](https://cryptozombies.io/es/lesson/2/chapter/2): [Mapeos y Direcciones](#mapeos-y-direcciones)
- [Capitulo3](https://cryptozombies.io/es/lesson/2/chapter/3): [Msg.sender](#msg.sender)
- [Capitulo4](https://cryptozombies.io/es/lesson/2/chapter/4): [Require](#require)
- [Capitulo5](https://cryptozombies.io/es/lesson/2/chapter/5): [Herencia](#herencia)
- [Capitulo6](https://cryptozombies.io/es/lesson/2/chapter/6): [Importar](#importar)
- [Capitulo7](https://cryptozombies.io/es/lesson/2/chapter/7): [Storage vs Memory](#storage-vs-memory)
- [Capitulo8](https://cryptozombies.io/es/lesson/2/chapter/8): [ADN del Zombie](#adn-del-zombie)
- [Capitulo9](https://cryptozombies.io/es/lesson/2/chapter/9): [Más en la Visibilidad de Funciones](#más-en-la-visibilidad-de-funciones)
- [Capitulo10](https://cryptozombies.io/es/lesson/2/chapter/10): [¿Qué Comen Los Zombis?](#¿qué-comen-los-zombis?)
- [Capitulo11](https://cryptozombies.io/es/lesson/2/chapter/11): [Usando una Interfaz](#usando-una-interfaz)
- [Capitulo12](https://cryptozombies.io/es/lesson/2/chapter/12): [Manejando Múltiples Valores Devueltos](#manejando-múltiples-valores-devueltos)
- [Capitulo13](https://cryptozombies.io/es/lesson/2/chapter/13): [Bonus: Genes de Gato](#bonus:-genes-de-gato)
- [Capitulo14](https://cryptozombies.io/es/lesson/2/chapter/14): [Empaquetando todo](#empaquetando-todo)

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

# Los Zombies atacan a sus victimas

# Resumen de la Lección 2

En la lección 1, creamos una función que recibía un nombre, lo usaba para generar un zombi aleatorio, y lo añadía a la base de datos de zombis de nuestra app guardada en la blockchain.

En la Lección 2, vamos a hacer nuestra app más parecida a un juego: Vamos a hacerlo multijugador, y también añadiremos más diversión a la creación de zombis en vez de crearlos aleatoriamente.

¿Cómo crearemos nuevos zombis? ¡Haciendo que nuestros zombis se "alimenten" de otras formas de vida!

## Alimentando a los Zombis

Cuando un zombi se alimenta, infecta al huésped con un virus. El virus convierte al huésped en un nuevo zombi que se une a tu ejército. El nuevo ADN del zombi estará calculado del ADN del zombi original y del ADN del huésped.

¿Y qué es lo que más les gusta a los zombis?

Para saber esto... ¡Tendrás que completar la lección 2!

## Vamos a probarlo

A la derecha tenemos una demostración simple de la alimentación. ¡Haz clic en un humano para ver que pasa cuando tu zombi se alimenta!

Puedes ver como el ADN del nuevo zombi está determinado por el ADN del zombi original, así como del ADN del huésped.

Cuando estés preparado, haz clic en "Siguiente capítulo" para continuar, y vamos a empezar a hacer nuestro juego multijugador.

# Mapeos y Direcciones

Vamos a hacer nuestro juego multijugador dandolés a los zombis un dueño en la base de datos.

Para esto, vamos a necesitar dos nuevos tipos de datos: mapping y address.

## Direcciones

La blockchain de Ethereum está creada por cuentas, que podrían ser como cuentas bancarias. Una cuenta tiene un balance de Ether (la divisa utilizada en la blockchain de Ethereum), y puedes recibir pagos en Ether de otras cuentas, de la misma manera que tu cuenta bancaria puede hacer transferencias a otras cuentas bancarias.

Cada cuenta tiene una dirección, que sería como el número de la cuenta bancaria. Es un identificador único que apuntado a una cuenta, y se asemejaría a algo así:

```cmd
0x0cE446255506E92DF41614C46F1d6df9Cc969183
```

(Esta dirección pertenece al equipo de CryptoZombies. Si estás disfrutando CryptoZombies, ¡puedes enviarnos algunos Ether! 😉 )

Vamos a entrar en el meollo de las direcciones en otra lección, por ahora solo necesitas entender que una direccion está asociada a un usuario específico (o un contrato inteligente).

Así que podemos utilizarlo como identificador único para nuestros zombis. Cuando un usuario crea un nuevo zombi interactuando con nuestra app, adjudicaremos la propiedad de esos zombis a la dirección de Ethereum que ha llamado a la función.

## Mapeando

En la Lección 1 vimos los structs y los arrays. Los mapeos son otra forma de organizar los datos en Solidity.

Definir un mapping se asemejaría a esto:

```solidity
// Para una aplicación financial, guardamos un uint con el balance de su cuenta:
mapping (address => uint) public accountBalance;
// O podría usarse para guardar / ver los usuarios basados en ese userId
mapping (uint => string) userIdToName;
```

Un mapeo es esencialmente una asociación valor-clave para guardar y ver datos. En el primer ejemplo, la llave es un address (dirección) y el valor correspondería a un uint, y en el segundo ejemplo la llave es un uint y el valor un string.

## Vamos a probarlo

Para guardar el dueño de un zombi, vamos a usar dos mapeos: el primero guardará el rastro de la dirección que posee ese zombi y la otra guardará el rastro de cuantos zombis posee cada propietario.

1. Crea un mapeo llamado zombieToOwner. Su llave será un uint (guardaremos y podremos ver el zombi basados en esta id) y el valor será un address. Vamos a hacer este mapeo public.
2. Crea un mapeo llamado ownerZombieCount, cuya llave sea un address y el valor un uint.

# Msg.sender

Ahora que tenemos nuestros mapeos para seguir el rastro del propietario de un zombi, queremos actualizar el metodo \_createZombie para que los utilice.

Para poder hacer esto, necesitamos algo llamado msg.sender.

msg.sender
En Solidity, hay una serie de variables globales que están disponibles para todas las funciones. Una de estas es msg.sender, que hace referencia a la dirección de la persona (o el contrato inteligente) que ha llamado a esa función.

> _Nota: En Solidity, la ejecución de una función necesita empezar con una llamada exterior. Un contrato se sentará en la blockchain sin hacer nada esperando a que alguien llame a una de sus funciones. Así que siempre habrá un msg.sender._

Aquí tenemos un ejemplo de como usar msg.sender y actualizar un mapping:

```solidity
mapping (address => uint) favoriteNumber;

function setMyNumber(uint _myNumber) public {
  // Actualiza tu mapeo `favoriteNumber` para guardar `_myNumber` dentro de `msg.sender`
  favoriteNumber[msg.sender] = _myNumber;
  // ^ La sintaxis para guardar datos en un mapeo es como en los arrays
}

function whatIsMyNumber() public view returns (uint) {
  // Conseguimos el valor guardado en la dirección del emisor
  // Será `0` si el emisor no ha llamado a `setMyNumber` todavía
  return favoriteNumber[msg.sender];
}
```

En este trivial ejemplo, cualquiera puede llamar a setMyNumber y guardar un uint en nuestro contrato, que estará atado a su dirección. Entonces, cuando llamen a whatIsMyNumber, debería devolverles el uint que han guardado.

Usando msg.sender te da la seguridad de la blockchain de Ethereum — la única forma de que otra persona edite la información de esta sería robandole la clave privada asociada a la dirección Ethereum.

## Vamos a probarlo

Vamos a actualizar nuestro método \_createZombie de la Lección para asignarle la propiedad de un zombi a quien llame a la función.

1. Primero, después de recibir la id del nuevo zombi, actualizamos nuestro mapeo zombieToOwner para que guarde msg.sender bajo esa id.
2. Segundo, incrementamos ownerZombieCount para este msg.sender.

En Solidity, puedes incrementar un uint con ++, así como en javascript:

```solidity
uint number = 0;
number++;
// `number` es ahora `1`
Tu resultado final para este capítulo debería tener 2 líneas de código.
```

# Require

En la lección 1, hicimos que los usuarios puediesen crear nuevos zombis llamando a createRandomZombie e introduciendo un nombre. Sin embargo, si un usuario continuase llamando a esta función crearía un ejército de zombis ilimitado, el juego no sería muy divertido.

Vamos a hacer que un jugador solo pueda llamar a esta función una vez. De esta manera los nuevo jugadores podrán llamar a esta función cuando empiezen el juego para crear el primer zombi de su ejército.

¿Cómo podemos hacer para que esta función solo pueda ser llamada una vez por jugador?

Para eso usamos require. require hace que la función lanze un error y pare de ejecutarse si la condición no es verdadera:

```solidity
function sayHiToVitalik(string _name) public returns (string) {
  // Compara si _name es igual a "Vitalik". Lanza un error si no lo son.
  // (Nota: Solidity no tiene su propio comparador de strings, por lo que
  // compararemos sus hashes keccak256 para ver si sus strings son iguales)
  require(keccak256(_name) == keccak256("Vitalik"));
  // Si es verdad, continuamos con la función:
  return "Hi!";
}
```

Si llamas a la función con sayHiToVitalik("Vitalik"), esta devolverá "Hi!". Si la llamas con cualquier otra entrada, lanzará un error y no se ejecutará.

De este modo require es muy útil a la hora de verificar que ciertas condiciones sean verdaderas antes de ejecutar una función.

## Vamos a probarlo

En nuestro juego de zombis, no queremos que un usuario pueda crear zombis ilimitados en su ejército llamado a createRandomZombie — esto haría que el juego no fuese muy divertido.

Vamos a usar require para asegurarnos que esta función solo pueda ser ejecutada una vez por usuario, cuando vayan a crear a su primer zombi.

1. Coloca una sentencia require al principio de la función createRandomZombie. La función debería comprobar que ownerZombieCount[msg.sender] sea igual a 0, y si no que lanze un error.

> _Nota: En Solidity, no importa que termino pongamos primero - ambos son equivalentes. De todas formas, como nuestro corrector de respuestas es bastante básico, solo aceptamos una respuesta correcta - esta espera que ownerZombieCount[msg.sender] vaya primero._

# Herencia

Nuestro código está haciendose un poco largo. Mejor que hacer un contrato extremandamente largo, a veces tiene sentido separar la lógica de nuestro código en multiples contratos para organizar el código.

Una característica de Solidity que hace más manejable esto es la herencia de los contratos:

```solidity
contract Doge {
  function catchphrase() public returns (string) {
    return "So Wow CryptoDoge";
  }
}

contract BabyDoge is Doge {
  function anotherCatchphrase() public returns (string) {
    return "Such Moon BabyDoge";
  }
}
```

BabyDoge hereda de Doge. Eso significa que si compilas y ejecutas BabyDoge, este tendrá acceso tanto a catchphrase() como a anotherCatchphrase() (y a cualquier otra función publica que definamos en Doge).

Esto puede usarse como una herencia lógica (como una subclase, un Gato es un Animal). Pero también puede usarse simplemente para organizar tu código agrupando lógica similar en diferentes clases.

## Vamos a probarlo

En los siguientes capítulos, vamos a implementar la funcionalidad para que nuestros zombis se alimenten y se multipliquen. Vamos a añadir esa lógica en su propia clase que herede de ZombieFactory.

1. Crea un contrato llamado ZombieFeeding debajo de ZombieFactory. Este contrato heredará de nuestro contrato ZombieFactory.

# Importar

¡Guau! Notarás que hemos limpiado el código de la derecha, ahora tienes unas pestañas en la parte superior de tu editor. Adelante, clica entre las pestañas para probarlo.

Nuestro código estaba quedando algo largo, por eso lo hemos dividido en multiples archivos haciendolo así más manejable. Así es como normalmente deberás guardar tu código base en tus proyectos de Solidity.

Cuando tienes multiples archivos y quieres importar uno dentro de otro, Solidity usa la palabra clave import:

```solidity
import "./someothercontract.sol";

contract newContract is SomeOtherContract {

}
```

Entonces si tenemos un fichero llamado someothercontract.sol en el mismo directorio que este contrato (eso es lo que significa ./), será importado por el compilador.

## Vamos a probarlo

Ahora que tenemos una estructura de múltiples ficheros, necesitamos usar import para leer el contenido del otro fichero:

1. Importa zombiefactory.sol en nuestro nuevo fichero, zombiefeeding.sol.

# Storage vs Memory

En Solidity, hay dos sitios donde puedes guardar variables - en storage y en memory.

Storage se refiere a las variables guardadas permanentemente en la blockchain. Las variables de tipo memory son temporales, y son borradas en lo que una función externa llama a tu contrato. Piensa que es como el disco duro vs la RAM de tu ordenador.

La mayoría del tiempo no necesitas usar estas palabras clave ya que Solidity las controla por defecto. Las variables de estado (variables declaradas fuera de las funciones) son por defecto del tipo storage y son guardadas permanentemente en la blockchain, mientras que las variables declaradas dentro de las funciones son por defecto del tipo memory y desaparecerán una vez la llamada a la función haya terminado.

Aun así, hay momentos en los que necesitas usar estas palabras clave, concretamente cuando estes trabajando con structs y arrays dentro de las funciones:

```solidity
contract SandwichFactory {
  struct Sandwich {
    string name;
    string status;
  }

  Sandwich[] sandwiches;

  function eatSandwich(uint _index) public {
    // Sandwich mySandwich = sandwiches[_index];

    // ^ Parece algo sencillo, pero solidity te dará un warning
    // diciendo que deberías declararlo `storage` o `memory`.

    // De modo que deberias declararlo como `storage`, así:
    Sandwich storage mySandwich = sandwiches[_index];
    // ...donde `mySandwich` es un apuntador a `sandwiches[_index]`
    // de tipo storage, y...
    mySandwich.status = "Eaten!";
    // ...esto cambiará permanentemente `sandwiches[_index]` en la blockchain.

    // Si únicamente quieres una copia, puedes usar `memory`:
    Sandwich memory anotherSandwich = sandwiches[_index + 1];
    // ...donde `anotherSandwich` seria una simple copia de
    // los datos en memoria, y...
    anotherSandwich.status = "Eaten!";
    // ...modificará la variable temporal y no tendrá efecto
    // en `sandwiches[_index + 1]`. Pero puedes hacer lo siguiente:
    sandwiches[_index + 1] = anotherSandwich;
    // ...si quieres que la copia con los cambios se guarde en la blockchain.
  }
}
```

No te preocupes si no has entendido del todo como usar esto - durante este tutorial te diremos cuándo usar storage y cuándo usar memory, y el compilador de Solidity también te dará advertencias para hacerte saber cuando usar cada una de estas palabras clave.

¡Por ahora, es suficiente con que entiendas en que caso necesitarás usar explícitamente storage o memory!

## Vamos a probarlo

¡Es hora de dar a nuestros zombis la posibilidad de alimentarse y multiplicarse!

Cuando un zombi se alimente de otras formas de vida, su ADN se combinará con el ADN de la otra forma de vida creando un nuevo zombi.

1. Crear una función llamada feedAndMultiply. Recibirá dos parámetros: \_zombieId (un uint) y \_targetDna (también un uint). Esta función debería ser public.
2. ¡No queremos que cualquier persona se alimente usando nuestro zombi! Así que primero, vamos a comprobar que somos dueños de ese zombi. Añade una sentencia require para asegurar que msg.sender es igual al dueño del zombi (similar a como lo hicimos en la función createRandomZombie).

> _Nota: De nuevo, como nuestro corrector de respuestas es primitivo, espera que msg.sender venga primero y marcará como respuesta incorrecta si cambias el orden. Pero normalmente cuando programes, podrás utilizar el orden que tu quieras - ambos son correctos._

3. Vamos a necesitar obtener el ADN de este zombi. Así que lo próximo que nuestra función debería hacer es declarar un Zombie localmente llamado myZombie (que deberá ser un puntero del tipo storage). Inicializa esta variable para que sea igual que el índice \_zombieId de nuestro array zombies.

Deberás tener unas 4 líneas de código, incluyendo la línea de fín de la función }.

¡Continuaremos rellenando esta función en el siguiente capítulo!

# ADN del Zombi

Vamos a terminar de escribir la función feedAndMultiply.

La fórmula para calcular el ADN del nuevo zombi es simple: Es simplemente el promedio entre el ADN del zombi que hemos alimentado y el ADN del zombi objetivo.

Por ejemplo:

```solidity
function testDnaSplicing() public {
  uint zombieDna = 2222222222222222;
  uint targetDna = 4444444444444444;
  uint newZombieDna = (zombieDna + targetDna) / 2;
  // ^ va a ser igual a 3333333333333333
}
```

Mas tarde haremos nuestra fórmula más complicada si queremos, añadiendole por ejemplo algún valor aleatorio al nuevo ADN. Pero por el momento vamos a dejarlo simple - siempre podemos volver a ello más adelante.

## Vamos a probarlo

1. Primero necesitamos estar seguro que el \_targetDna no es mayor de 16 dígitos. Para ello, podemos fijar que el valor de \_targetDna sea igual a \_targetDna % dnaModulus para que únicamente guarde los últimos 16 dígitos.
2. Después nuestra función deberá declarar un uint llamado newDna, y fijarle el valor del promedio entre el ADN de myZombie y el ADN de \_targetDna (como en el ejemplo anterior).

> _Nota: Puedes acceder a las propiedades de myZombie usando myZombie.name y myZombie.dna_

3. Una vez que tengamos el ADN, vamos a llamar a \_createZombie. Puedes mirar en la pestaña zombiefactory.sol si has olvidado los parámetros que esta función necesita para ser llamada. Ten en cuenta que necesita un nombre, así que de momento le pondremos de nombre "NoName" — podremos escribir una función para cambiar el nombre del zombi más adelante.

> _Nota: ¡Quizá notes un problema en nuestro código, que no encaja en Solidity! No te preocupes, arreglaremos esto en el siguiente capítulo ;)_

# Más en la Visibilidad de Funciones

¡El código de tu lección anterior tenía un error!

Si intentas compilarlo, el compilador lanzará un error.

El problema es que hemos intentado llamar a la función \_createZombie desde ZombieFeeding, pero \_createZombie es una función private dentro de ZombieFactory. Eso significa que ninguno de los demás contratos que hereden de ZombieFactory podrán acceder a ello.

## Internal y External

Además de public y private, Solidity tiene dos tipos de visibilidad más para las funciones: internal y external.

internal es lo mismo que private, a excepción de que es también accesible desde otros contratos que hereden de este. (¡Ey, suena como lo que necesitamos aquí!).

external es parecido a public, a excepción que estas funciones SOLO puedes ser llamadas desde fuera del contrato — no pueden ser llamadas por otras funciones dentro de ese contrato. Hablaremos más adelante sobre cuando querrás usar external vs public.

Para declarar las funciones internal o external, la sintaxis es igual que private y public:

```solidity
contract Sandwich {
  uint private sandwichesEaten = 0;

  function eat() internal {
    sandwichesEaten++;
  }
}

contract BLT is Sandwich {
  uint private baconSandwichesEaten = 0;

  function eatWithBacon() public returns (string) {
    baconSandwichesEaten++;
    // Podemos llamar a esta función aquí porque es internal
    eat();
  }
}
```

## Vamos a probarlo

1. Cambia \_createZombie() de private a internal así otros contratos podrán acceder a ella. Hemos vuelto a colocarte en la pestaña correspondiente, zombiefactory.sol.

# ¿Qué Comen Los Zombis?

¡Es hora de alimentar a nuestros zombis! Y ¿Qué es lo que más les gusta comer?

Bueno lo que pasa es que a los CryptoZombies lo que les encanta comer es...

¡CryptoKitties! 😱😱😱

(Sí, es enserio 😆 )

Para hacer esto necesitamos leer el kittyDna del contrato inteligente CryptoKitties. Podemos hacer eso debido a que los datos de los CryptoKitties guardados en la blockchain son públicos. ¡¿No es blockchain genial?!

No te preocupes - nuestro juego aún no va a hacer dañor a ningún CryptoKitty. Solo vamos a leer los datos de los CryptoKitties, no podemos borrarlos 😉

## Interactuando con otros Contratos

Para que nuestro contrato pueda hablar a otro contrato de la blockchain que no poseemos, necesitamos definir una interfaz.

Vamos a ver un simple ejemplo. Digamos que hay un contrato en la blockchain tal que así:

```solidity
contract LuckyNumber {
  mapping(address => uint) numbers;

  function setNum(uint _num) public {
    numbers[msg.sender] = _num;
  }

  function getNum(address _myAddress) public view returns (uint) {
    return numbers[_myAddress];
  }
}
```

Este seria un simple contrato donde cualquiera puede guardar su número de la suerte, y este estará asociado a su dirección de Ethereum. De esta forma cualquiera podría ver el número de la suerte de una persona usando su dirección.

Ahora digamos que tenemos un contrato externo que quiere leer la información de este contrato usando la función getNum.

Primero debemos usar una interfaz del contrato LuckyNumber:

```solidity
contract NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}
```

Ten en cuenta que esto se asemeja a definir un contrato, con alguna diferencia. Primero, solo declaramos las funciones con las que queremos interactuar - en este caso getNum — y no mencionamos ninguna otra función o variables de estado.

Segundo, no definimos el cuerpo de la función. En vez de usar las llaves ({ y }), solamente terminaremos la función añadiendo un punto y coma al final de la declaración (;).

Sería como definir el esqueleto del contrato. Así es como conoce el compilador a las interfaces.

Incluyendo esta interfaz en el código de tu dapp nuestro contrato sabe como son las funciones de otro contrato, como llamarlas, y que tipo de respuesta recibiremos.

Entraremos en como llamar a las funciones de otros contratos en la siguiente lección, por ahora vamos a declarar nuestra interfaz para el contrato de CryptoKitties.

## Vamos a probarlo

Hemos mirado el código fuente de CryptoKitties por tí, y hemos encontrado una función llamada getKitty que devuelve todos los datos de un kitty, incluyendo sus "genes" (¡qué es lo que nuestro juego de zombis necesita para crear un nuevo zombi!).

La función es así:

```solidity
function getKitty(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
) {
    Kitty storage kit = kitties[_id];

    // si esta variable es 0 entonces no se esta gestando
    isGestating = (kit.siringWithId != 0);
    isReady = (kit.cooldownEndBlock <= block.number);
    cooldownIndex = uint256(kit.cooldownIndex);
    nextActionAt = uint256(kit.cooldownEndBlock);
    siringWithId = uint256(kit.siringWithId);
    birthTime = uint256(kit.birthTime);
    matronId = uint256(kit.matronId);
    sireId = uint256(kit.sireId);
    generation = uint256(kit.generation);
    genes = kit.genes;
}
```

La función parece algo diferente de las que hemos usado. Puedes ver que devuelve... una lista de diferentes valores. Si vienes de un lenguaje de programación como Javascript, esto es diferente - en Solidity puedes devolver más de un valor en una función.

Ahora que sabemos como es esta función, podemos usarla para crear una interfaz:

1. Define una interfaz llamada KittyInterface. Recuerda, es como crear un nuevo contrato - usamos la palabra clave contract.
2. Dentro de la interfaz, define la función getKitty (que debería ser un copia/pega de la función de arriba, pero con un punto y coma después de los parámetros, en vez de todo lo que hay dentro de las llaves.

# Usando una Interfaz

Continuando con nuestro ejemplo anterior de NumberInterface, una vez hemos definido la interfaz como:

```solidity
contract NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}
```

Podemos usarla en el contrato de esta manera:

```solidity
contract MyContract {
  address NumberInterfaceAddress = 0xab38...
  // ^ La dirección del contrato FavoriteNumber en Ethereum
  NumberInterface numberContract = NumberInterface(NumberInterfaceAddress)
  // Ahora `numberContract` está apuntando al otro contrato

  function someFunction() public {
    // Ahora podemos llamar a `getNum` de ese contrato:
    uint num = numberContract.getNum(msg.sender);
    // ...y haz algo con `num` aquí
  }
}
```

De esta manera, tu contrato puede interactuar con otro contrato de la blockchain de Ethereum, siempre y cuando la función esté definida como public o external.

## Vamos a probarlo

¡Vamos a preparar nuestro contrato para leer el contrato inteligente de CryptoKitties!

1. He guardado la dirección del contrato de CryptoKitties en el código por ti, dentro de la variable ckAddress. En la siguiente línea, crea unaKittyInterface llamada kittyContract, e inicializala con ckAddress — igual que como hemos hecho con numberContract arriba.

# Manejando Múltiples Valores Devueltos

Esta función getKitty es el primer ejemplo que vamos a ver que devuelva múltiples valores. Vamos a ver como manejarlos:

```solidity
function multipleReturns() internal returns(uint a, uint b, uint c) {
  return (1, 2, 3);
}

function processMultipleReturns() external {
  uint a;
  uint b;
  uint c;
  // Así es como hacemos múltiples asignaciones:
  (a, b, c) = multipleReturns();
}

// O si solo nos importa el último de estos valores:
function getLastReturnValue() external {
  uint c;
  // Podemos dejar el resto de campos en blanco:
  (,,c) = multipleReturns();
}
```

## Vamos a probarlo

¡Es la hora de interactuar con el contrato de CryptoKitties!

Vamos a hacer una función que recoga los genes del gato del contrato:

1. Haz una función llamada feedOnKitty. Esto recibirá 2 parámetros uint, \_zombieId y \_kittyId, y deberá ser una función public.
2. La función deberá declarar un uint llamado kittyDna.

> _Nota: En nuestro KittyInterface, genes es un uint256 — pero si recuerdas en la lección 1, uint es un alias para uint256 — son la misma cosa._

3. La función tendrá entonces que llamar a la función kittyContract.getKitty con \_kittyId y guardar genes en kittyDna. Recuerda — getKitty devuelve un montón de variables. (10 para ser exactos - Soy bueno, ¡los he contado por ti!). Pero el único que nos interesa es el último de ellos, genes. ¡Cuenta las comas con cuidado!
4. Finalmente, la función deberá llamar a feedAndMultiply, y pasarle tanto \_zombieId como kittyDna.

# Bonus: Genes de Gato

La lógica de nuestra función está ahora completa... pero añadamos una característica extra.

Vamos a hacer que los zombis creados a partir de gatos tengan una única característica que muestre que son gato-zombis.

Para hacer esto, debemos añadir algo de código del gato en el ADN del zombi.

Si recuerdas la lección 1, estamos solo usando los primeros 12 dígitos de los 16 dígitos que determinan el ADN de la apariencia de un zombi. Así que vamos a usar los últimos 2 dígitos para manejar esas características "especiales".

Diremos que los gato-zombis tienen 99 en los últimos dos dígitos de su ADN (debido a que tienen 9 vidas). Entonces en nuestro código, diremos que si (if) un zombi viene de un gato, los últimos dos dígitos de su ADN serán 99.

## Sentencias if

Una sentencia if en Solidity es igual que en javascript:

```solidity
function eatBLT(string sandwich) public {
  // Recuerda que con strings, debemos comparar sus hashes keccak256
  // para comprobar su equidad
  if (keccak256(sandwich) == keccak256("BLT")) {
    eat();
  }
}
```

## Vamos a probarlo

Vamos a implementar los genes de los gatos en nuestro código del zombi.

1. Primero, vamos a cambiar la definición de la función feedAndMultiply para que reciba un tercer argumento: un string llamado \_species.
2. Después de calcular el ADN del nuevo zombi, vamos a añadir una sentencia if que compare los hashes keccak256 de \_species y el string "kitty".
3. Dentro de la sentencia if, queremos reemplazar los últimos 2 dígitos del ADN con 99. Una manera de hacer esto es usando la lógica: newDna = newDna - newDna % 100 + 99;.

> _Explicación: Pongamos que newDna es 334455. Entonces newDna % 100 es 55, así quenewDna - newDna % 100 es 334400. Finalmente añadimos 99 para conseguir 334499._

4. Para terminar, necesitamos cambiar la llamada a la función dentro de feedOnKitty. Cuando llama a feedAndMultiply, añade el parámetro "kitty" al final.

# Empaquetando todo

¡Eso es, has completado la lección 2!

Ahora puede probar nuestra demostración a la derecha para verlo en acción. Sigue adelante, sé que no puedes esperar hasta el final de esta página 😉. Clica en un gato para atacar, y ¡mira que nuevo gato zombi consigues!

## Implementación Javascript

Una vez estemos listos para implementar este contrato en Ethereum solamente tendremos que compilar e implementar ZombieFeeding — debido a que este contrato es nuestro contrato final que hereda de ZombieFactory, y tiene acceso a todos los métodos públicos de ambos contratos.

Vamos a ver un ejemplo de cómo interactuaría nuestro contrato implementado usando Javascript y web3.js:

```solidity
var abi = /* abi generado por el compilador */
var ZombieFeedingContract = web3.eth.contract(abi)
var contractAddress = /* la dirección Ethereum de nuestro contrato despues de la implementación */
var ZombieFeeding = ZombieFeedingContract.at(contractAddress)

// Asumiendo que tenemos la ID de nuestro zombi y la ID del gato que queremos atacar
let zombieId = 1;
let kittyId = 1;

// Para conseguir la imagen del CryptoKitty, necesitamos hacer una consulta a su API.
// Esta información no está guardada en la blockchain, solo en su servidor web.
// Si todo se guardase en la blockchain, no nos tendríamos que preocupar
// si el servidor se cae (apaga), si cambian la API, o si la compañía
// nos bloquea la carga de imágenes si no les gusta nuestro juego de zombis ;)
let apiUrl = "https://api.cryptokitties.co/kitties/" + kittyId
$.get(apiUrl, function(data) {
  let imgUrl = data.image_url
  // haz algo para enseñar la imagen
})

// When the user clicks on a kitty:
$(".kittyImage").click(function(e) {
  // Llama al método `feedOnKitty` de tu contrato
  ZombieFeeding.feedOnKitty(zombieId, kittyId)
})

// Escuchamos el evento del NewZombie de nuestro contrato para que podamos mostrarlo:
ZombieFactory.NewZombie(function(error, result) {
  if (error) return
  // Esta función mostrará el zombi, como en la lección 1:
  generateZombie(result.zombieId, result.name, result.dna)
})
```

## ¡Pruébalo!

Selecciona el gato del que te quieres alimentar. ¡El ADN de tu zombi y el ADN del gato se combinarán, y recibirás un nuevo zombi en tu ejército!

¿Puedes ver esas bonitas piernas de gato en tu zombi? Esos son nuestros últimos dígitos 99 del ADN en marcha 😉

Puedes volver a empezar y probar de nuevo si quieres. Cuando consigas un gato zombi con el que estés contento (solo te puedes quedar uno), ¡sigue adelante y procede al siguiente capítulo para terminar la lección 2!
