# Escuela de Idiomas

## Descripción del proyecto

El objetivo de este proyecto es desarrollar una aplicación funcional para la gestión de una escuela de idiomas.

El sistema estará compuesto por dos aplicaciones independientes que se comunicarán entre sí para gestionar alumnos, profesores y clases.

## Gestión de alumnos

La aplicación principal permitirá registrar y gestionar alumnos mediante los siguientes datos:

- Nombre y apellidos.
- Edad.
- Número de teléfono y teléfono secundario.
- Correo electrónico y correo secundario.
- Idioma que desean aprender.
- Si han estado previamente en el centro.

## Gestión de profesores

La aplicación permitirá registrar y gestionar profesores con los siguientes datos:

- Nombre y apellidos.
- Edad.
- Número de teléfono y teléfono secundario.
- Correo electrónico y correo secundario.
- Idioma que imparten.

## Segunda aplicación

La segunda aplicación recibirá los datos enviados por la aplicación principal y organizará las clases según tres criterios:

- **Apellidos:** para organizar la información de los alumnos.
- **Curso:** para diferenciar entre primero y segundo.
- **Idioma:** para agrupar a alumnos y profesores según el idioma correspondiente.

Una vez procesados los datos, devolverá los resultados a la aplicación principal.

## Comunicación entre aplicaciones

Ambas aplicaciones se comunicarán mediante **Named Pipes**, utilizando **JSON** para intercambiar los datos.

## Tecnologías

- **Lenguaje:** C#
- **Interfaz gráfica:** WPF
- **Base de datos:** MySQL
- **Formato de intercambio:** JSON
- **Comunicación entre procesos:** Named Pipes

## Autores

- Javier Maza
- Jorge Salvador
