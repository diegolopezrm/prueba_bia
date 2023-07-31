# Marvel Character List

Esta aplicación permite a los usuarios explorar una lista de personajes de Marvel y filtrar la lista a través de una función de búsqueda. Además, hemos implementado animaciones para mejorar la experiencia del usuario.

## Tabla de contenidos

- [Funcionalidades principales](#funcionalidades-principales)
- [Cómo funciona](#cómo-funciona)
  - [Búsqueda de personajes](#búsqueda-de-personajes)
  - [Animaciones](#animaciones)
- [Uso de la API de Marvel](#uso-de-la-api-de-marvel)
- [Despliegue](#despliegue)
- [Pruebas unitarias](#pruebas-unitarias)

## Funcionalidades principales

- **Listado de personajes:** Presenta una lista de personajes de Marvel, cargados desde la API oficial de Marvel.
- **Función de búsqueda:** Permite a los usuarios buscar personajes por nombre.
- **Detalles del personaje:** Al hacer clic en un personaje, se muestra una página con más detalles sobre ese personaje.
- **Animaciones:** Añadidas para mejorar la experiencia del usuario.


## Cómo funciona

### Búsqueda de personajes

La función de búsqueda está implementada mediante un `TextField` en la parte superior de la lista de personajes. A medida que el usuario escribe en este campo, la lista se filtra en tiempo real para mostrar sólo los personajes cuyos nombres coincidan con la consulta de búsqueda.

```dart
void filterSearchResults(String query) {
    if (query.isNotEmpty) {
        List<Character> tempSearchResults = characters.where((element) {
            return element.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
        setState(() {
            filteredCharacters = tempSearchResults;
        });
    } else {
        setState(() {
            filteredCharacters = characters;
        });
    }
}
```

### Animaciones

Hemos agregado animaciones sutiles para mejorar la interactividad y la experiencia general del usuario. Las animaciones se aplican a la carga de personajes y al filtrado de resultados.

*Nota: Aquí puedes añadir detalles sobre qué tipo de animaciones se implementaron y cómo.*

## Uso de la API de Marvel

La aplicación se integra con la API oficial de Marvel para obtener la lista de personajes. Hemos implementado una autenticación segura usando MD5 y las claves proporcionadas por Marvel.

La estructura básica de una solicitud a la API es la siguiente:

```dart
final String ts = DateTime.now().millisecondsSinceEpoch.toString();
final String hash = generateMd5('$ts$_privateKey$_apiKey');
final response = await http.get(
    Uri.parse('$_baseUrl/characters?ts=$ts&apikey=$_apiKey&hash=$hash&limit=100&offset=$offset'),
);
```

## Despliegue

1. Asegúrate de tener Flutter y Dart configurados en tu máquina.
2. Clona el repositorio.
3. En la terminal, navega hasta el directorio del proyecto y ejecuta `flutter pub get`.
4. Luego, ejecuta `flutter run` para iniciar la aplicación.



<!-- Pruebas unitarias
Las pruebas unitarias son esenciales para garantizar la funcionalidad y confiabilidad de la aplicación. Estas pruebas se enfocan en validar que cada "unidad" individual de software funcione correctamente en aislamiento.

Configuración
Asegúrate de tener todas las dependencias relacionadas con las pruebas en tu archivo pubspec.yaml:
yaml
Copy code
dev_dependencies:
  flutter_test:
    sdk: flutter
Crea una carpeta test en la raíz de tu proyecto.
Pruebas para el modelo Character
El archivo character_test.dart contiene pruebas unitarias que validan la correcta deserialización de un JSON a un objeto Character.

dart
Copy code
void main() {
    test('fromJson() should correctly deserialize a Character', () {
        final Map<String, dynamic> json = {
            // Aquí iría una representación JSON completa de un personaje
        };

        final character = Character.fromJson(json);
        expect(character.id, json['id']);
        // Agrega más expect para verificar cada campo
    });
}
Ideas adicionales para pruebas unitarias
Pruebas de validación: Si tienes reglas de validación, crea pruebas que aseguren que estas reglas se apliquen correctamente.
Pruebas para otros métodos fromJson y toJson: Prueba la correcta serialización y deserialización de todos tus modelos.
Pruebas de borde: Asegúrate de manejar casos inusuales o extremos, como JSONs que falten algunos campos o que contengan tipos de datos inesperados.
Mocking y pruebas de servicios: Si usas servicios para obtener datos, crea pruebas que simulen respuestas de API para diferentes escenarios.
Pruebas para funciones auxiliares o utilidades: Si tienes funciones que realizan operaciones en tus datos, crea pruebas para esas también.
Para ejecutar las pruebas, usa el comando flutter test. -->

## Pruebas unitarias

Las pruebas unitarias son esenciales para garantizar la funcionalidad y confiabilidad de la aplicación. Estas pruebas se enfocan en validar que cada "unidad" individual de software funcione correctamente en aislamiento.

### Configuración

Asegúrate de tener todas las dependencias relacionadas con las pruebas en tu archivo `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
```

Crea una carpeta `test` en la raíz de tu proyecto.

### Pruebas para el modelo `Character`

El archivo `character_test.dart` contiene pruebas unitarias que validan la correcta deserialización de un JSON a un objeto `Character`.

```dart
void main() {
    test('fromJson() should correctly deserialize a Character', () {
        final Map<String, dynamic> json = {
            // Aquí iría una representación JSON completa de un personaje
        };

        final character = Character.fromJson(json);
        expect(character.id, json['id']);
        // Agrega más expect para verificar cada campo
    });
}
```


---

