# Evaluación Práctica:

## Ejercicio 1
Instalar el IDE Visual Studio Code se encuentra en el siguiente enlace: https://code.visualstudio.com/

Instalar GIT y GIT Bash se encuenta en el siguiente enlace: https://git-scm.com/download/win


## Ejercicio 2

<details>
  <summary>1. ¿Qué es un servidor HTTP?</summary>

  Un servidor HTTP es una aplicación que procesa solicitudes HTTP realizadas por un cliente (como un navegador web o una aplicación) y devuelve una respuesta, generalmente en datos JSON, XML. En Salesforce, cuando hacemos llamadas externas (por ejemplo, desde un Apex REST callout), estas interacciones también siguen el protocolo HTTP.

</details>

<details>
  <summary>2. ¿Qué son los verbos HTTP? Mencionar los más conocidos</summary>

  Los verbos HTTP, o métodos, definen el tipo de acción que el cliente quiere realizar sobre el recurso del servidor. Los más conocidos son:

  - **GET**: Para obtener datos del servidor.
  - **POST**: Para enviar datos al servidor, normalmente para crear o procesar información.
  - **PUT**: Para actualizar un recurso existente en el servidor.
  - **DELETE**: Para eliminar un recurso.
  - **PATCH**: Para realizar actualizaciones parciales en un recurso.

</details>

<details>
  <summary>3. ¿Qué es un request y un response en una comunicación HTTP? ¿Qué son los headers?</summary>

  - **Request**: Es el mensaje que un cliente envía al servidor para pedir algún recurso o realizar alguna acción.
  - **Response**: Es la respuesta que el servidor envía de vuelta, normalmente con los datos solicitados o con el resultado de la acción.
  - **Headers**: Son metadatos incluidos tanto en el request como en el response. Proporcionan información adicional, como el tipo de contenido (Content-Type), autenticación (Authorization), etc.

</details>

<details>
  <summary>4. ¿Qué es un queryString? (En el contexto de una URL)</summary>

  Un query string es la parte de una URL que contiene parámetros clave-valor, y comienza después del símbolo `?`. Se utiliza para enviar información adicional al servidor. Ejemplo:
  
  `https://ejemplo.com/api/recursos?nombre=harold&edad=32`  
  Aquí, `nombre` y `edad` son los parámetros enviados al servidor.

</details>

<details>
  <summary>5. ¿Qué es el responseCode? ¿Qué significado tienen los posibles valores devueltos?</summary>

  El responseCode es un código numérico que devuelve el servidor para indicar el resultado de la solicitud HTTP. Algunos códigos comunes son:

  - **200**: OK (la solicitud fue exitosa).
  - **404**: Not Found (el recurso solicitado no fue encontrado).
  - **500**: Internal Server Error (hubo un error en el servidor).
  - **401**: Unauthorized (el cliente no tiene autorización para acceder al recurso).
  - **400**: Bad Request (la solicitud está mal formada).

</details>

<details>
  <summary>6. ¿Cómo se envía la data en un GET y cómo en un POST?</summary>

  - **GET**: La data se envía en la URL, generalmente como un query string.
  - **POST**: La data se envía en el cuerpo de la solicitud, permitiendo enviar estructuras más complejas, como JSON o XML.

</details>

<details>
  <summary>7. ¿Qué verbo HTTP utiliza el navegador cuando accedemos a una página?</summary>

  El navegador utiliza el verbo **GET** cuando se accede a una página web.

</details>

<details>
  <summary>8. Explicar brevemente qué son las estructuras de datos JSON y XML, dando ejemplos.</summary>

  - **JSON (JavaScript Object Notation)**: Es un formato ligero para intercambiar datos. Utiliza pares clave-valor. Ejemplo:
  
    ```json
    {
      "nombre": "Harold",
      "edad": 32
    }
    ```

  - **XML (eXtensible Markup Language)**: Es un formato más verboso que utiliza etiquetas para estructurar los datos. Ejemplo:
  
    ```xml
    <persona>
      <nombre>Harold</nombre>
      <edad>32</edad>
    </persona>
    ```

</details>

<details>
  <summary>9. Explicar brevemente el estándar SOAP</summary>

  **SOAP** es un protocolo que permite enviar datos entre aplicaciones utilizando XML. Es más formal y estructurado que otras formas de comunicación, y suele ser utilizado en sistemas empresariales. En Salesforce, se utiliza mucho para servicios web más estrictos y con validación avanzada.

</details>

<details>
  <summary>10. Explicar brevemente el estándar REST Full</summary>

  **REST** es un estilo de arquitectura que utiliza URLs y los verbos HTTP (GET, POST, PUT, DELETE) para interactuar con recursos a través de internet. En Salesforce, es común utilizar REST para conectarse con otros sistemas o para exponer datos de Salesforce.

</details>

<details>
  <summary>11. ¿Qué son los headers en un request? ¿Para qué se utiliza el key Content-Type en un header?</summary>

  Los headers son metadatos que se envían junto con la solicitud (request) o la respuesta (response) HTTP. El header **Content-Type** especifica el tipo de contenido que se está enviando en el cuerpo de la solicitud o respuesta, como `application/json` para JSON o `text/xml` para XML, indicando al servidor cómo debe interpretar los datos enviados.

</details>

## Ejercicio 3

1. **Realizar un request GET:**
   - **URL:** `https://procontacto-reclutamiento-default-rtdb.firebaseio.com/contacts.json`
   - **Método:** GET
   - **Objetivo:** Obtener todos los contactos almacenados en la base de datos antes de realizar cualquier cambio.
   - 
   ![Request GET](https://drive.google.com/uc?export=view&id=176ClpLeg-ju-5PvaX9oKp_EGKD43ONxS)

2. **Realizar un request POST:**
   - **URL:** `https://procontacto-reclutamiento-default-rtdb.firebaseio.com/contacts.json`
   - **Método:** POST
   - **Body:**
     ```json
     {
       "name": "Tu nombre",
       "email": "tunombre.tuapellido@procontacto.com.mx"
     }
     ```
   - **Objetivo:** Crear un nuevo contacto en la base de datos con el nombre y el email proporcionados.
   - 
   ![POST](https://drive.google.com/uc?export=view&id=1Ajyex69zY40WDPvlI9s3VKblMoNxJNpX)

3. **Realizar nuevamente un request GET:**
   - **URL:** `https://procontacto-reclutamiento-default-rtdb.firebaseio.com/contacts.json`
   - **Método:** GET
   - **Objetivo:** Ver los cambios en la base de datos después de realizar el POST.
   - 
  ![GET](https://drive.google.com/uc?export=view&id=1kGCCDnxFfi_5MktZzDp15x8K2RKXpZtr)   

## Diferencias entre las llamadas

- **GET inicial (Punto 1):** Al realizar el primer GET, solo verás los contactos almacenados previamente en la base de datos.
  
- **GET después del POST (Punto 3):** En este segundo GET, además de los contactos originales, aparecerá el nuevo contacto creado mediante el POST, mostrando los datos ingresados (nombre y correo).

## Ejercicio 4

En el siguiente enlace encontrarán el acceso a mi perfil de Trailhead:

[Perfil de Trailhead - Harold García Vargas](https://www.salesforce.com/trailblazer/hgarciavargas)

## Ejercicio 5

En este ejercicio, exploramos los objetos fundamentales de Salesforce que gestionan el ciclo de ventas y las relaciones con los clientes. Cada objeto, desde Lead hasta Article, juega un papel crucial en el manejo de datos y procesos comerciales. A continuación, se presentan descripciones detalladas de cada objeto, junto con sus datos estándar.


<details>
<summary>Lead (Prospecto)</summary>

Un Lead es un posible cliente o una oportunidad de negocio que aún no ha sido calificado. Representa el primer paso en el ciclo de ventas antes de convertirlo en una cuenta, contacto u oportunidad.

**Datos estándar:**
- Nombre
- Empresa
- Cargo
- Correo electrónico
- Teléfono
- Estado del Lead

</details>

<details>
<summary>Account (Cuenta)</summary>

Una Account representa una empresa o persona con la que tienes una relación comercial. Es uno de los objetos centrales en Salesforce y agrupa otros objetos como contactos, oportunidades, etc.

**Datos estándar:**
- Nombre de la cuenta
- Tipo de cuenta (cliente, proveedor, etc.)
- Dirección
- Industria
- Número de empleados

</details>

<details>
<summary>Contact (Contacto)</summary>

Un Contact es una persona asociada a una cuenta con la que se tiene una relación de negocio. Está relacionado directamente con el objeto Account.

**Datos estándar:**
- Nombre
- Correo electrónico
- Teléfono
- Cargo
- Cuenta asociada

</details>

<details>
<summary>Opportunity (Oportunidad)</summary>

Una Opportunity representa una oportunidad de negocio o posible venta. Está relacionada con una Account y es parte del ciclo de ventas, desde la negociación hasta el cierre.

**Datos estándar:**
- Nombre de la oportunidad
- Monto
- Etapa de la oportunidad
- Fecha de cierre
- Cuenta relacionada

</details>

<details>
<summary>Product (Producto)</summary>

Un Product es un bien o servicio que una empresa vende. Se utiliza en conjunto con oportunidades, cotizaciones y pedidos para gestionar las ventas.

**Datos estándar:**
- Nombre del producto
- Código del producto
- Descripción
- Familia de productos
- Activo o inactivo

</details>

<details>
<summary>PriceBook (Lista de precios)</summary>

Un PriceBook es una lista de precios que contiene productos con precios específicos. Cada cuenta o venta puede estar asociada a una lista de precios.

**Datos estándar:**
- Nombre del PriceBook
- Activo o inactivo

</details>

<details>
<summary>Quote (Cotización)</summary>

Una Quote es una oferta formal de precios y condiciones hecha a un cliente potencial para una oportunidad. Está asociada a una oportunidad y contiene productos.

**Datos estándar:**
- Nombre de la cotización
- Fecha de expiración
- Oportunidad asociada
- Total del monto
- Estado

</details>

<details>
<summary>Asset (Activo)</summary>

Un Asset es un bien o producto que el cliente ha comprado o que está usando, como un historial de ventas. Está relacionado con una cuenta.

**Datos estándar:**
- Nombre del activo
- Producto asociado
- Número de serie
- Cuenta relacionada
- Fecha de compra

</details>

<details>
<summary>Case (Caso)</summary>

Un Case es un registro de un problema o pregunta presentada por un cliente, comúnmente utilizado en el servicio de atención al cliente.

**Datos estándar:**
- Asunto
- Estado
- Prioridad
- Cuenta o contacto relacionado
- Fecha de cierre

</details>

<details>
<summary>Article (Artículo)</summary>

Un Article es un documento de conocimiento que puede incluir soluciones a problemas comunes, guías o preguntas frecuentes. Está relacionado con la base de conocimiento en Salesforce.

**Datos estándar:**
- Título del artículo
- Categoría
- Contenido del artículo
- Fecha de publicación

</details>

## Diagrama de Relaciones de Objetos

A continuación se presenta un diagrama que muestra las relaciones entre los diferentes objetos en Salesforce:

![Diagrama de Relaciones](https://drive.google.com/uc?id=1ivafrRZMseJAgXkoY7bL-W-YJCA5_z_C)

[Ver en Google Drive](https://drive.google.com/file/d/1ivafrRZMseJAgXkoY7bL-W-YJCA5_z_C/view?usp=sharing)


## Ejercicio 6

<details>
<summary>Soluciones de Salesforce</summary>

A. **¿Qué es Salesforce?**  
Salesforce es una plataforma de CRM basada en la nube que ayuda a las empresas a gestionar relaciones con sus clientes, automatizar ventas, servicios, marketing y otros procesos de negocio.

B. **¿Qué es Sales Cloud?**  
Sales Cloud es una solución de Salesforce diseñada para gestionar el ciclo de ventas, incluyendo la generación de leads, oportunidades, y la gestión de contactos y cuentas.

C. **¿Qué es Service Cloud?**  
Service Cloud es una solución de Salesforce enfocada en la atención al cliente. Permite gestionar casos, ofrecer soporte omnicanal, y mejorar la experiencia de servicio.

D. **¿Qué es Health Cloud?**  
Health Cloud es una solución diseñada para el sector de la salud que permite a los proveedores gestionar de forma integral la información del paciente y mejorar la atención personalizada.

E. **¿Qué es Marketing Cloud?**  
Marketing Cloud es una plataforma de marketing digital que permite a las empresas planificar, personalizar y gestionar campañas multicanal (email, redes sociales, SMS) para interactuar con clientes.

</details>

<details>
<summary>Funcionalidades de Salesforce</summary>

A. **¿Qué es un RecordType?**  
Un Record Type permite personalizar procesos, layouts y selección de valores de picklist para diferentes tipos de registros de un mismo objeto.

B. **¿Qué es un ReportType?**  
Un Report Type define los objetos y relaciones que estarán disponibles para generar un informe en Salesforce.

C. **¿Qué es un Page Layout?**  
Un Page Layout determina cómo se presentan los campos, botones, y otros elementos visuales en la interfaz de un registro para los usuarios.

D. **¿Qué es un Compact Layout?**  
Un Compact Layout es una vista simplificada que muestra los campos clave de un registro en espacios reducidos como la vista previa o los dispositivos móviles.

E. **¿Qué es un Perfil?**  
Un perfil es una configuración que define los permisos y el acceso a objetos, campos y funciones para un grupo de usuarios en Salesforce.

F. **¿Qué es un Rol?**  
Un rol define la jerarquía de acceso a registros, controlando quién puede ver o modificar registros en función de la posición en la organización.

G. **¿Qué es un Validation Rule?**  
Una Validation Rule es una regla que verifica si los datos ingresados en un campo cumplen con criterios específicos antes de poder guardar el registro.

H. **¿Qué diferencia hay entre una relación Master-Detail y Lookup?**  
Una relación Master-Detail establece una relación de dependencia fuerte entre dos objetos, donde el detalle depende del maestro. En una relación Lookup, los objetos están relacionados pero son independientes entre sí.

I. **¿Qué es un Sandbox?**  
Un Sandbox es un entorno aislado donde se puede desarrollar y probar cambios sin afectar la producción.

J. **¿Qué es un ChangeSet?**  
Un ChangeSet es una herramienta que permite mover configuraciones y personalizaciones entre diferentes entornos de Salesforce (ej. de un sandbox a producción).

K. **¿Para qué sirve el import Wizard de Salesforce?**  
El Import Wizard permite importar datos de forma masiva a Salesforce para objetos estándar y personalizados de manera fácil y guiada.

L. **¿Para qué sirve la funcionalidad Web to Lead?**  
La funcionalidad Web to Lead permite capturar leads directamente desde un formulario web y almacenarlos en Salesforce para su seguimiento.

M. **¿Para qué sirve la funcionalidad Web to Case?**  
Web to Case permite capturar solicitudes o problemas de clientes desde un formulario web y crear casos automáticamente en Salesforce para su gestión.

N. **¿Para qué sirve la funcionalidad Omnichannel?**  
Omnichannel distribuye automáticamente las solicitudes de servicio (casos, chats, etc.) a los agentes disponibles según su capacidad y habilidades.

O. **¿Para qué sirve la funcionalidad Chatter?**  
Chatter es una herramienta de colaboración dentro de Salesforce que permite a los empleados comunicarse, compartir archivos y actualizaciones en tiempo real.

</details>

<details>
<summary>Conceptos generales</summary>

A. **¿Qué significa SaaS?**  
SaaS (Software as a Service) es un modelo de entrega de software en el que las aplicaciones se alojan en la nube y se acceden a través de internet.

B. **¿Salesforce es SaaS?**  
Sí, Salesforce es un servicio SaaS porque proporciona software y funcionalidades a través de la nube sin necesidad de instalación local.

C. **¿Qué significa que una solución sea Cloud?**  
Una solución Cloud es un servicio o aplicación que se ejecuta en servidores en la nube y se accede a través de internet.

D. **¿Qué significa que una solución sea On-Premise?**  
On-Premise significa que el software se instala y ejecuta en los servidores locales de la empresa, en lugar de en la nube.

E. **¿Qué es un pipeline de ventas?**  
Un pipeline de ventas es la visualización de las diferentes etapas por las que pasan los prospectos antes de convertirse en clientes.

F. **¿Qué es un funnel de ventas?**  
El funnel de ventas es un modelo que representa el proceso de atracción, conversión y cierre de clientes, donde la cantidad de prospectos disminuye en cada etapa.

G. **¿Qué significa Customer Experience?**  
Customer Experience (CX) se refiere a la percepción general que los clientes tienen sobre una empresa basada en todas sus interacciones a lo largo del tiempo.

H. **¿Qué significa omnicanalidad?**  
Omnicanalidad es la integración y colaboración de distintos canales de comunicación para ofrecer una experiencia coherente y fluida al cliente.

I. **¿Qué significa que un negocio sea B2B? ¿Qué significa que un negocio sea B2C?**  
Un negocio B2B (Business to Business) vende productos o servicios a otras empresas, mientras que un negocio B2C (Business to Consumer) vende directamente a consumidores finales.

**¿Qué es un KPI?**  
Un KPI (Key Performance Indicator) es una métrica clave utilizada para medir el éxito o el rendimiento de un proceso o actividad en una empresa.

J. **¿Qué es una API y en qué se diferencia de una Rest API?**  
Una API (Application Programming Interface) es un conjunto de reglas que permite a las aplicaciones comunicarse entre sí. Una Rest API es un tipo de API que sigue los principios del protocolo HTTP y es ampliamente utilizada por su simplicidad y escalabilidad.

K. **¿Qué es un Proceso Batch?**  
Un proceso batch es un tipo de procesamiento que ejecuta operaciones masivas de datos de forma asíncrona, generalmente en segundo plano.

L. **¿Qué es Kanban?**  
Kanban es un método de gestión visual que organiza tareas o proyectos en un tablero dividido en columnas que representan el progreso de las actividades.

M. **¿Qué es un ERP?**  
Un ERP (Enterprise Resource Planning) es un sistema integrado que ayuda a las empresas a gestionar sus procesos de negocio, como finanzas, logística y recursos humanos.

N. **¿Salesforce es un ERP?**  
No, Salesforce es un CRM (Customer Relationship Management) que se enfoca en la gestión de relaciones con clientes, no en la planificación de recursos empresariales como un ERP.

</details>


## Ejercicio 7

## Descripción

Este proyecto implementa un flujo de clases en Apex para manejar la lógica relacionada con el objeto `Contact` en Salesforce. Utiliza triggers para procesar operaciones de inserción, actualización, eliminación y recuperación de registros de contacto, y está diseñado para mantener la integridad y actualizar automáticamente los correos electrónicos de contacto a través de un servicio externo.

El uso de `Batch` es crucial en este proyecto debido a la naturaleza asíncrona de las actualizaciones de correos electrónicos. Al procesar múltiples contactos en lotes, se garantiza que las operaciones no sobrecarguen los límites de gobernanza de Salesforce, permitiendo así un manejo eficiente y escalable de grandes volúmenes de datos. Esto asegura que las actualizaciones se realicen de manera eficiente, sin afectar el rendimiento del sistema ni la experiencia del usuario.

## Clases Utilizadas

Las siguientes clases son parte de este proyecto y pueden ser revisadas en el repositorio:

1. **ContactTrigger**: Este trigger se activa en eventos de inserción, actualización, eliminación y recuperación de contactos, delegando la lógica a la clase manejadora correspondiente.
  
2. **TriggerHandler**: Clase base que gestiona la ejecución de métodos según el tipo de evento del trigger. Permite una implementación modular y reutilizable de la lógica de los triggers.
  
3. **ContactTriggerHandler**: Extiende `TriggerHandler` y contiene la lógica específica para manejar la actualización e inserción de contactos, incluyendo el procesamiento de lotes para la actualización de correos electrónicos.

4. **ContactEmailUpdateBatch**: Implementa la interfaz `Database.Batchable`, permitiendo el procesamiento en lotes de contactos para la actualización de correos electrónicos a través de un servicio externo.

5. **ProContactoEmailService**: Contiene la lógica para la obtención de correos electrónicos desde el servicio externo `ProContacto`, asegurando que los datos de contacto estén actualizados.

6. **ProContactoService**: Maneja las llamadas HTTP al servicio externo, asegurando una comunicación eficiente y el manejo adecuado de excepciones.

Estas clases trabajan conjuntamente para ofrecer una solución robusta y escalable para la gestión de contactos en Salesforce.

## Autor

- **Nombre**: Harold Garcia
- **Correo Electrónico**: garciavargas9112@gmail.com
- **Fecha de Creación**: 2024-09-20
- **Última Modificación**: 2024-09-21






