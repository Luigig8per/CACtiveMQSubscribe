using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Business;


namespace DesktopC
{
    public partial class mainForm : Form
    {

        tunel clBusiness = new tunel();


        public mainForm()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cmbLeagueId.DataSource = clBusiness.ExeStoredProcedure("[dbo].[GetLeagues]");

            cmbLeagueId.DisplayMember = "Description";
            cmbLeagueId.ValueMember = "IdLeague";
        }

        private void button1_Click(object sender, EventArgs e)
        {
             
            dataGridView1.DataSource = clBusiness.getGameStats("Report_Game_Statistic", 74, cmbLeagueId.Text, dateTimePicker1.Value, dateTimePicker2.Value);

        }
    }
}
