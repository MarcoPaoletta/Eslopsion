# Eslopsion
* Juego tipo espacio aplicando distinta mecanica de movimiento de tipo [click and move](https://docs.godotengine.org/en/latest/tutorials/2d/2d_movement.html#click-and-move), uso de nodo [WorldEnvironment](https://docs.godotengine.org/es/stable/classes/class_worldenvironment.html) y cargar varias texturas sin necesidad de crear un extenso diccionario, entre otras cosas
* Hay una barra de energia la cual se va descargando o bien por el tiempo o bien porque colisionamos con un enemigo
* Esta barra se puede cargar mediante cargas de combustible que se originan cada cierto tiempo
* El personaje se mueve hacia donde se hizo click tratando de esquivar enemigos
* Si la barra de energia llega a 0, el personaje va a explotar
* Cada segundo que se pasa vivo, se va a sumar un punto en el marcador
---
# Cargar varias texturas sin necesidad de crear un extenso diccionario
```gdscript
var skins: Array = []

func _ready() -> void:
	randomize()
	change_skin()

func change_skin():
	for texture in range(20):
		skins.append(load("res://assets/enemy/enemy_" + str(texture + 1) + ".png"))
	var random_skin = randi() % skins.size()
	$skin.texture = skins[random_skin]
```
* Crear lista, a la cual le vamos a agregar luego cada textura
* Randomizar para hacer aleatorio todo
* Creamos un for en el rango de la cantidad de texturas que tenemos, en este caso 20
* Agregamos cada textura a la lista del principio. En mi caso le sumo 1 cuando lo agrego porque mis texturas empiezan por el 1 y no por el 0
* Creamos una variable que va a contener el tamaño de la lista y la usamos posteriormente para establecer la textura de nuestra skin en un sprite
---
# Descargar Godot Engine e importar el proyecto
---

## Descargar Godot Engine

* Accedemos al sitio oficial de [Godot Engine](https://godotengine.org/download) en la parte de descargas
* Seleccionamos nuestro sistema operativo
* Descargamos la **Standard version**
* Extraemos el archivo comprimido
* Esto nos dejara el ejecutable de Godot Engine

---

## Importar el proyecto

* Una vez descargado los archivos del proyecto, movemos la carpeta a una ruta de preferencia
* Abrimos Godot Engine y en la parte de la derecha buscamos el boton **Import** o **Importar**
* Escribimos la ruta del proyecto o buscamos manualmente en la carpeta del proyecto el archivo project.godot 
* Nos abrira el projecto y podremos ejecutarlo desde ahi tocando **F5** o en la parte superior derecha con el boton de play
