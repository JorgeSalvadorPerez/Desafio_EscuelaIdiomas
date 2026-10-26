using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Pipes;
using System.Text;

namespace Escuela_Idiomas.Servicios
{
    public class Cliente_Pipe
    {
        public async Task EnviarAsync(string json)
        {
            //con el . estoy indicando que todo esta en este mismo ordenador, osea el mio, y el out que solo envia las cosas
            using var cliente = new NamedPipeClientStream(".", "Escuela_Idiomas_Pipe", PipeDirection.Out);
            await cliente.ConnectAsync(2000);

            //el StreamWriter convierte el texto (json) a bytes y lo escribe en la tuberia indicada arriba
            //el Autoflush hace que cada vez que escribamos se envie al momento, de esta forma el servidor no se queda esperando el texto
            using var cliente_escritor = new StreamWriter(cliente)
            {
                AutoFlush = true
            };
            await cliente_escritor.WriteLineAsync(json);
        }
    }
}
