
# Demo Team Events

teamEvents es una aplicación móvil desarrollada para iOS en Swift, cuyo propósito es facilitar la gestión de eventos y usuarios dentro de equipos o grupos de trabajo. La app está pensada para ser intuitiva y fácil de usar, permitiendo que los miembros del equipo puedan organizar actividades, registrarse y mantener la información relevante de forma segura.

# Principales funcionalidades

Registro y autenticación de usuarios:
- Los usuarios pueden crear una cuenta nueva utilizando correo electrónico y contraseña, iniciar sesión y cerrar sesión. Esto se realiza mediante la integración con Firebase Auth, garantizando seguridad y facilidad en el manejo de credenciales.

Almacenamiento de información de usuario y eventos:
- La información de los usuarios (como nombre de usuario y correo electrónico) y los eventos creados se almacenan en la base de datos Firebase Firestore, lo que permite acceder a estos datos desde cualquier dispositivo y mantenerlos sincronizados.

Gestión de eventos grupales:
- Aunque la lógica de eventos no está completamente expuesta en los archivos analizados, la estructura sugiere que los usuarios pueden visualizar y posiblemente crear o unirse a eventos relacionados con su equipo, todo desde una interfaz gráfica basada en UIKit.

Interfaz intuitiva y moderna:
- La app utiliza UIKit para construir vistas con botones de acción, campos de texto y navegación entre pantallas. Elementos como el diseño redondeado de los formularios y el manejo adaptativo del teclado mejoran la experiencia de usuario.

# Inntegraciones

Firebase Core: Inicialización del servicio Firebase en la app.
Firebase Auth: Registro, inicio de sesión y cierre de sesión de usuarios.
Firebase Firestore: Almacenamiento y recuperación de información de usuarios.
Firebase Analytics y Storage: Preparada para analíticas y almacenamiento de archivos, aunque su uso específico no se muestra en los fragmentos revisados.

# Tecnologías utilizadas

Swift (lenguaje principal)
UIKit (desarrollo de la interfaz de usuario)
Firebase Suite (Auth, Firestore, Analytics, Storage)
CocoaPods (gestor de dependencias)




