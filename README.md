# catbreeds

App básica recolecta uso de provider como gestor de estado, inyección de dependencias, buenas practicas, commits iniciales, mapeo de datos, uso de http para llamadas a APIs, Uso de provider como gestor de estados,
uso de Futures para el llamado de información, base de datos para filtro, y guardado de nuevos datos.

1. Página de splash controlada con delay, integración de animaciones lottie.
   
![Screenshot_20230811-185637](https://github.com/luiss2113-dev/CatBreeds_arquitectura_limpia/assets/62814020/3557f438-40ed-46f4-bc9c-e9a5baeb78da)

2. Página de landign, información por paginación (scroll infinito), control de errores de imágenes, uso de cards
   FutureBuilder y consumer para comunicación entre el controller(Provider)
   
![Screenshot_20230811-185647](https://github.com/luiss2113-dev/CatBreeds_arquitectura_limpia/assets/62814020/c38348c8-1910-49f8-bf84-d37d2e3093ac)

3. Buscador para registros que contengan X dato en su categoría, uso de sqflit para guardado y recuperado de información
   local.
   
![Screenshot_20230811-190448](https://github.com/luiss2113-dev/CatBreeds_arquitectura_limpia/assets/62814020/a111d30a-bb24-409a-abca-a61fee492774)
![Screenshot_20230811-190459](https://github.com/luiss2113-dev/CatBreeds_arquitectura_limpia/assets/62814020/c3882039-6661-41ee-a55d-de30b50bda77)


5. Pantalla de detalle para visualización detallada de cada uno de los registros, efecto sobre imágen con Hero.

![Screenshot_20230811-185657](https://github.com/luiss2113-dev/CatBreeds_arquitectura_limpia/assets/62814020/0f4c695f-e5e7-4ed2-b0d7-9bc381cfdece)


## Getting Started

  Package:
    device_preview: ^1.1.0 
    http: ^1.1.0
    dartz: ^0.10.1
    lottie: ^2.6.0
    connectivity_plus: ^4.0.2
    provider: ^6.0.5
    equatable: ^2.0.5
    get_it: ^7.6.0
    animate_do: ^3.0.2
    url_launcher: ^6.1.12
    sqlflite 
    path

  Adicionar en lib/app/data/helpers/constants.dart propiedad API_KEY

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
