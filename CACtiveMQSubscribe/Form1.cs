using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CACtiveMQSubscribe
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public List<line> GetLines()
        {
            using (DonBestEntities db = new DonBestEntities())


                return db.lines.ToList();



        }

        private void getDatos()
        {
            List<line> colec = GetLines();

            foreach (var item in colec)
                label1.Text += "= Linea: " + item.ToString(); 
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            getDatos();
        }
    }
}
