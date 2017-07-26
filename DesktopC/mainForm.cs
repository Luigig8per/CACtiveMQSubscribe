using System;
using System.Windows.Forms;
using Business;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;

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

        private void extractToExcel(string fileName)
        {
            Excel.Application xlApp;
            Excel.Workbook xlWorkBook;
            Excel.Worksheet xlWorkSheet;
            object misValue = System.Reflection.Missing.Value;

            xlApp = new Excel.Application();
            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);
            int i = 0;
            int j = 0;


            for (i = 1; i < dataGridView1.Columns.Count + 1; i++)
            {
                xlWorkSheet.Cells[1, i] = dataGridView1.Columns[i - 1].HeaderText;
            }

            for (i = 3; i <= dataGridView1.RowCount - 1 + 3; i++)
            {
                for (j = 0; j <= dataGridView1.ColumnCount - 1; j++)
                {
                    DataGridViewCell cell = dataGridView1[j, i-3];
                    xlWorkSheet.Cells[i + 1, j + 1] = cell.Value;
                }
            }

            xlWorkBook.SaveAs(fileName, Excel.XlFileFormat.xlWorkbookNormal, misValue, misValue, misValue, misValue, Excel.XlSaveAsAccessMode.xlExclusive, misValue, misValue, misValue, misValue, misValue);
            xlWorkBook.Close(true, misValue, misValue);
            xlApp.Quit();

            releaseObject(xlWorkSheet);
            releaseObject(xlWorkBook);
            releaseObject(xlApp);

            MessageBox.Show("Excel file created , you can find the file in " + fileName);
        }

        private void releaseObject(object obj)
        {
            try
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);
                obj = null;
            }
            catch (Exception ex)
            {
                obj = null;
                MessageBox.Show("Exception Occured while releasing object " + ex.ToString());
            }
            finally
            {
                GC.Collect();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
             
            dataGridView1.DataSource = clBusiness.getGameStats("Report_Game_Statistic", 74, cmbLeagueId.Text, dateTimePicker1.Value, dateTimePicker2.Value);

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            saveFile();
          
        }

        private void saveFile()
        {
            
            SaveFileDialog saveFileDialog1 = new SaveFileDialog();

            saveFileDialog1.Filter = "excel files (*.xls)|*.xls|All files (*.*)|*.*";
            saveFileDialog1.FilterIndex = 2;
            saveFileDialog1.RestoreDirectory = true;
            saveFileDialog1.FileName = cmbLeagueId.Text + " " + dateTimePicker1.Text + " - " + dateTimePicker2.Text + ".xls";

            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {

                string path = saveFileDialog1.FileName;
                extractToExcel(saveFileDialog1.FileName);
                //File.WriteAllText(@saveFileDialog1.FileName + ".xls", rtOutput.Text);
                //MessageBox.Show("Archivo guardado con éxito!.");

            }
        }
    }
}
