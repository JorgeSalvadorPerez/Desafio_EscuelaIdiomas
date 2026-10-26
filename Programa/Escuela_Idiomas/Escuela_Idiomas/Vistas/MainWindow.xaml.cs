using Escuela_Idiomas.Modelos;
using System.Text;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;
using Escuela_Idiomas.Servicios;

namespace Escuela_Idiomas
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        //el boton de enviar lo del crud
        private async void bt_Enviar_Click(object sender, RoutedEventArgs e)
        {
            List<Alumno> alumnos = new List<Alumno>();

            string json = JsonSerializer.Serialize(alumnos);
            File.WriteAllText("alumnos.json", json);

            await new Cliente_Pipe().EnviarAsync(json);
        }
    }
}