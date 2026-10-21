# Escuela de Idiomas

## Descripción del proyecto

El objetivo de este proyecto es desarrollar una aplicación funcional para la gestión de una escuela de idiomas.

El sistema estará compuesto por dos aplicaciones independientes que se comunicarán entre sí para gestionar alumnos, profesores y clases, así como para organizar las asignaciones según el idioma y el curso correspondiente.

## Gestión de alumnos

La aplicación principal permitirá registrar y gestionar alumnos mediante los siguientes datos:

- Nombre y apellidos.
- Edad.
- Número de teléfono y teléfono secundario.
- Correo electrónico y correo secundario.
- Idioma que desean aprender.
- Si han estado previamente en el centro, para determinar si les corresponde primer o segundo curso.

## Gestión de profesores

También permitirá registrar y gestionar profesores, almacenando la siguiente información:

- Nombre y apellidos.
- Edad.
- Número de teléfono y teléfono secundario.
- Correo electrónico y correo secundario.
- Idioma que imparten.

Los profesores se asignarán a las clases correspondientes según el idioma que impartan.

## Segunda aplicación: procesamiento y organización de clases

La segunda aplicación recibirá los datos enviados por la aplicación principal y se encargará de procesarlos y organizar las clases.

Para ello, tendrá en cuenta los siguientes criterios:

- **Apellidos:** para organizar la información de los alumnos.
- **Curso:** para diferenciar entre primero y segundo.
- **Idioma:** para agrupar a los alumnos y profesores según el idioma correspondiente.

Una vez procesados los datos, la segunda aplicación devolverá los resultados a la aplicación principal.

## Comunicación entre aplicaciones

Ambas aplicaciones se comunicarán mediante Named Pipes, utilizando JSON para intercambiar los datos.

La aplicación principal recibirá los resultados del procesamiento y permitirá consultar qué profesores imparten cada idioma y curso, así como los alumnos asignados a cada clase.

## Tecnologías

- **Lenguaje:** C#
- **Interfaz gráfica:** WPF
- **Base de datos:** MySQL
- **Intercambio de datos:** JSON
- **Comunicación entre procesos:** Named Pipes

## Autores

- Javier Maza
- Jorge Salvador
