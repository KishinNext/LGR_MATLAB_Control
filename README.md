# Programa para el diseño de controladores digitales por el método del LGR

_El programa implementa y diseña en Matlab el preoceso de diseño de controladores digitales por el método del Lugar Geométrico de las Raíces._

## Comenzando 🚀

_Estas instrucciones te permitirán obtener una copia del proyecto en funcionamiento en tu máquina local para propósitos de desarrollo y pruebas._

Mira **Deployment** para conocer como desplegar el proyecto.


### Pre-requisitos 📋

_Solo se necesita tener instalado Matlab en la versión igual o superior a la R2018a._

![matlab](https://user-images.githubusercontent.com/45041472/52538936-a292c880-2d46-11e9-97cb-5565695fd2ec.JPG)

### Instalación 🔧

_Primero es necesario descomprimir el archivo, y estar en el directorio C:\Users\USUARIO\'lugar de descarga'\LGRFinal\LGR-master\Programa1.0_

_Abrir el archivo control2.m, que se encuentra en la respectiva carpeta._

![archivo](https://user-images.githubusercontent.com/45041472/52539319-bb9d7880-2d4a-11e9-971e-51af9bfa09c6.JPG)

_Ya con el archivo .m abierto, simplemente ejecuta el código, y se abrirá el panel de diseño._

![pagprincipal](https://user-images.githubusercontent.com/45041472/52539357-3d8da180-2d4b-11e9-9d1c-630db3a74f61.JPG)

_En el programa se puede ver las opciones elegibles, como lo es ingresar la función de transferencia de la planta en tiempo continuo, es importante mencionar que la variable 's' se interpreta como una variable simbólica, con el fin de definir fácilmente cualquier función de tranferencia, incluyendo las que involucran retardos. Iguelmente la opción de ingresa del valor del periodo de muestreo en segundos, en caso contrario, se calculará de manera automática el mejor periodo de muestreo para la planta ingresada, igualmente esta opción identifica si la planta presenta retardo._

_De manera opcional se da la opción de graficar la planta (sin controlador), permite graficar el LGR, la respuesta escalón, rampa y parabola en tiempo continuo y tiempo discreto. Igualmete como algo adiciónal se encuentra las principales carácteristicas de la planta en tiempo continuo  en lazo cerrado, y la representación por código LaTex de la función de tranferencia en lazo abierto en tiempo continuo y discreto._

_Cuando se da click en el botón Diseño, se abre la siguiente ventana._

![diseno](https://user-images.githubusercontent.com/45041472/52539611-4cc21e80-2d4e-11e9-8f0d-1eb203f9378c.JPG)

_La ventana permite configurar el diseño del controlador, permitiendo en primer lugar seleccionar entre diferentes parejas de condiciones, cada configuración permite diferente opciones de rediseño automático, lo cual puede ser práctico para implementar controladores adecuados para plantas de diseño específico._

_1. zita, y Wn, el LGR tiene que pasar por el polo Pd._

_2. zita y nuúmero de ciclos en la respuesta escalón, el LGR tiene que pasar por el polo Pd._

_3. ts y Mp, se debe poder rediseñar hasta que la respuesta escalón satisfaga los criterios._

_4. td y zita, se debe rediseñar hasta que la respuesta al escalón satisfaga ts. _

_5. ts y número de ciclos en la respuesta escalón, se debe rediseñar hasta que la respuesta al escalón satisfaga ts._

_6. número de ciclos en la respuesta escalosn y Mp, se debe rediseñar hasta que la respuesta al escalón satisfaga Mp_

_En caso de que la pareja de datos no sea suficiente para poder desarrollar el diseño, se le informa al usuario. También existe la opción de seleccionar el tipo de controlador a diseñar de un menú de diseños posibles, diferenciando controladores que aportan ángulos positivos y negativos para la respectiva planta, de manera adicional el progrma retorna la función de transferencia del controlador digital C(z), y puede representar la respuesta escalón del sistema en lazo cerrado, igualmente se puede dibujar el LGR, la respuesta rampa y parabola._

_La opción de seleccionar si se tiene encuaneta condiciones de error de estado estacionario va ligado a la pareja seleccionada, de la siguiente manera._

_1. sin condición de error de estado estacionario_

_2. ep constante_

_3. ep=0_

_4. ep=0 y ev constante_

_5. ev=0_

_6. ev=0 y ea constante_

_7. ea=0_

_Para el tiempo minimo, se tiene los siguientes requerimientos._

_1. Entrada escalon._

_2.  Entrada escalon y Kv constante._

_3. Entrada rampa_

_4. Entrada rampa y Ka constante._

_5. Entrada Parabola._

_6. Visualizacion de la respuesta y del controlador diseñado._


_Acontinuación se presenta una pequeña demo_


## Ejecutando las pruebas para LGR ⚙️

_Los problemas que se utilizan acontinuación se sacarón del libro Sistemas de control en tiempo discreto del Ogata, problemas B-4-9._

_Ejemplo: Refiriéndonos al sistema de control digital mostrado en la figura 4-67, diseñe un controlador digital G„(z) tal que el factor de amortiguamiento relativo zita de los polos dominantes en lazo cerrado sea 0.5 y el número de muestras por ciclo de la oscilación senoidal amortiguada sea 8. Suponga que el período de muestreo es de 0.1 seg es decir T= 0.1. Determine la constante de error de velocidad estática. También, determine la respuesta del sistema diseñado a una entrada escalón unitario._


![image](https://user-images.githubusercontent.com/45041472/52540191-dd9bf880-2d54-11e9-904d-1d26fa1f478a.png)



_En primer luagr se abre el archivo control2.m y se ingresa la planta, la cual se puede ver en la imagen anterior._

![ejemplo1](https://user-images.githubusercontent.com/45041472/52540155-65cdce00-2d54-11e9-837a-fda971ad42c7.jpg)

_En en la imagen se puede apreciar ciertos pasos que son necesarios seguir, en primer lugar se ingresa la fucnión de trasferencia en el recuadro y se oprime enter, inmediatamente se puede ver la representación de la planta en tiempo conitinuo y discreto, de manera opcional se puede ingresar el tiempo de muestreo de manera manual, en caso contrario al presionar enter el programa calcula el periodo de muestreo automaticamente, los siguientes pasos no son necesarios (4,5), los cuales sirven para graficar la respuesta de la planta, al pasar el paso 6 se puede pasaral diseño de la planata, imagen que se muestra acontinuación._

![disejemplo1](https://user-images.githubusercontent.com/45041472/52540614-82203980-2d59-11e9-9e2c-070a207035c4.jpg)

_Para continuar con esta venta se selecciona las opciones de diseño en las cuales se quiere trabajar, en este caso, la opción zita y y el número de muestras por oscilación, en seguida se da al botón continuar e inmediatamente se ve el polo deseado el ángulo del controlador y la función de tranferencia de la planta, adicionalmente se puede seleccionar condiciones de estado, en caso que se deseé. En seguida se selecciona el tipo de controlador, cuando se selecciona la función de transferencia del controlador aparecerá instantaneamente, en el paso 5, se puede ver datos importantes con este diseño, y finalmente en el paso 6 se puede ver el resultado correspondiente, el cúal, cumple con los requerimientos del problema._

## Ejecutando las pruebas para Tiempo minimo ⚙️

_Para el controlador de tiempo minimo, se tiene una planta de tiempo continuio, en donde el usuario puede ingresar, asimismo, el usuario debe proporcionar el periodo de muestreo para poder pasar al tiempo discreto._

![p1](https://user-images.githubusercontent.com/46770621/53777329-fff1e380-3ec6-11e9-848e-e0a25b457e38.png)

_Despues de ingresar el usuario presiona sobre el boton de Diseño y se redirecciona a la nueva ventana en donde puede elegir las señales de entrada a seguir._

![p2](https://user-images.githubusercontent.com/46770621/53777347-10a25980-3ec7-11e9-99ee-2211738f7323.png)

_Por tanto si desea seguir la entrada escalon, se selecciona la casilla "Escalon" y se procede a dar click en el boton confirmar, despues del tiempo de procesamiento, y de mostrar en pantalla el controlador, se puede observar la respuesta a escalon oprimiendo sobre el boton llamado "Escalon"._

![p3](https://user-images.githubusercontent.com/46770621/53777389-32034580-3ec7-11e9-97f0-7127b525a121.png)

_Ahora si se desea una constante de velocidad constante es necesario escoger la señal escalon y agregar el valor "Kv" en la casilla respectiva, ya que para poder cumplir con este requerimiento es necesario que siga la señal escalon y no la señal rampa._

![p4](https://user-images.githubusercontent.com/46770621/53777430-5d863000-3ec7-11e9-842c-e52f7584e247.png)

_Por tanto si desea seguir la entrada parabola, se selecciona la casilla "Parabola" y se procede a dar click en el boton confirmar, despues del tiempo de procesamiento, y de mostrar en pantalla el controlador, se puede observar la respuesta a una entrada parabola oprimiendo sobre el boton llamado "Parabola"._

![p5](https://user-images.githubusercontent.com/46770621/53777459-71319680-3ec7-11e9-958e-fdfb51ff6bf6.png)
## Deployment 📦

_Diagrama de flujo programa control por LGR._

![diagrama de flujo lgr](https://user-images.githubusercontent.com/45041472/52541792-0200d080-2d67-11e9-96d9-0ca67a547bd5.jpeg)

_Diagrama de flujo programa control por Frecuencia._

![copia de diagrama de flujo frecuencia](https://user-images.githubusercontent.com/45041472/53778238-09c91600-3eca-11e9-88d2-174a6bf240b8.jpeg)


_Diagrama de flujo programa control por tiempo minimo._

![diagrama de flujo Tiempo minimo](https://user-images.githubusercontent.com/46770621/53777244-b86b5780-3ec6-11e9-88e2-9ca8724afee0.png)

## Construido con 🛠️

_Las herramientas utilizadas._

* [Matlab](https://la.mathworks.com/products/matlab.html?requestedDomain=) - Diseño de GUI y procesos


## Versionado 📌

La versión del programa es la 2.0

## Autores ✒️


* **Jairo Garcia** - *Trabajo en general* - [JairoGarcia](https://github.com/KishinNext)
* **Fabio Bombiela** - *Trabajo en general* - [FabioBombiela](#fulanito-de-tal)


## Licencia 📄

Este proyecto está bajo la Licencia  - mira el archivo [LICENSE.md](LICENSE.md) para detalles, te agradecemos citar el pryecto, de igualmanera avisarnos cuando utilizas el código correspondiente.

## Expresiones de Gratitud 🎁

* Agradecemos a la profesora Diana Ovalle por apoyo presentado en el desarrollo de este aplicativo, de antemano agredecemos todo el tiempo invertido.




---
Especial agradecimiento a  [Villanuevand](https://github.com/Villanuevand) por compartir la plantilla
