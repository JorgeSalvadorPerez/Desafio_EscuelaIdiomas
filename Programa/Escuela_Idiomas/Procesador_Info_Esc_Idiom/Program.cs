// en este programa es donde creo la tuberia y espero al cliente

using System.IO.Pipes;

//Escuela_Idiomas_Pipe es el nombre de la tuberia, y lo otro esta diciendo que solo recibe (Input)

using var servidor = new NamedPipeServerStream("Escuela_Idiomas_Pipe", PipeDirection.In);

// ahora mediante consola indico que estoy esperando al cliente

Console.WriteLine("Esperando al cliente");
await servidor.WaitForConnectionAsync();

// ahora por consola verifico que el cliente se ha conectado

Console.WriteLine("Cliente conectado");