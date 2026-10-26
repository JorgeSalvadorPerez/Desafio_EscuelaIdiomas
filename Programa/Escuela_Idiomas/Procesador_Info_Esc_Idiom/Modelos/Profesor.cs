using System;
using System.Collections.Generic;
using System.Text;

namespace Procesador_Info_Esc_Idiom.Modelos
{
    public class Profesor
    {
        public int IdProfesor { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public byte Edad { get; set; }
        public string Telefono { get; set; }
        public string? Telefono2 { get; set; }
        public string Correo { get; set; }
        public string? Correo2 { get; set; }
        public int IdIdioma { get; set; }
    }
}
