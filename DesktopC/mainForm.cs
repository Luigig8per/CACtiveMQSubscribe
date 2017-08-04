using System;
using System.Windows.Forms;
using Business;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;
using OfficeOpenXml;
using System.Data;

namespace DesktopC
{
    public partial class mainForm : Form
    {

        tunel clBusiness = new tunel();


        public mainForm()
        {
            InitializeComponent();
        }

        public void fillExcel(string templateFilePath, string newFilePath)
        {
            using (var templateXls = new ExcelPackage(new FileInfo(templateFilePath)))
            {
                var sheet = templateXls.Workbook.Worksheets[1];
  
                sheet.Cells["A1"].Value = "your content";
    
                templateXls.SaveAs(new FileInfo(newFilePath));                  
                }
            }

        public void fillExcelV2(string templateFile, string outputFile)
        {
            Excel.Application excelApp = new Excel.Application();

            //Create an Excel workbook instance and open it from the predefined location
            Excel.Workbook excelWorkBook = excelApp.Workbooks.Open(templateFile);

            //Add a new worksheet to workbook with the Datatable name
            Excel.Worksheet excelWorkSheet = excelWorkBook.Sheets[1];
            excelWorkSheet.Name = string.Format("{0:yyyy-MM-dd}", DateTime.Now);

            for (int i = 1; i < 20 + 1; i++)
            {
                excelWorkSheet.Cells[1, 1] = "hola";
            }

            for (int j = 1; j < 5; j++)
            {
                for (int k = 6; k < 8; k++)
                {
                    excelWorkSheet.Cells[j + 2, k + 1] = "Holaaaaa";
                }
            }


            excelWorkBook.SaveAs(outputFile );
            excelWorkBook.Close();
            excelApp.Quit();

            if (File.Exists(outputFile))
            {
                System.Diagnostics.Process.Start(outputFile);
            }

        }

        public void paintExcel(DataGridView dgv)
        {
            for (int j = 0; j < 7; j++)
            {
                for (int k = 5; k < 7; k++)
                {
                  
                    //excelWorkSheet.Cells[j + 14, k + 1] = "ESTO ES UNA PRUEBA";
                    dgv.Rows[j].Cells[k + 1].Style.BackColor = System.Drawing.Color.Green;
                }
            }

            for (int j = 0; j < 3; j++)
            {
                for (int k = 5; k < 7; k++)
                {
                    
                    //excelWorkSheet.Cells[j + 14, k + 1] = "ESTO ES UNA PRUEBA";
                    dgv.Rows[j + 13].Cells[k + 1].Style.BackColor = System.Drawing.Color.Green;
                }
            }


        }

        public void fillExcelV2(string templateFile, string outputFile, DataGridView dgv)
        {
            Excel.Application excelApp = new Excel.Application();

            //Create an Excel workbook instance and open it from the predefined location
            Excel.Workbook excelWorkBook = excelApp.Workbooks.Open(templateFile);

            //Add a new worksheet to workbook with the Datatable name
            Excel.Worksheet excelWorkSheet = excelWorkBook.Sheets[5];
            excelWorkSheet.Name = string.Format("{0:yyyy-MM-dd HH-mm-ss}", dateTimePicker1.Value);

            DataTable dTMLB = new DataTable();
            DataTable dtSoc = new DataTable();
            DataTable dtMU = new DataTable();
            DataTable dtCanadianFootball = new DataTable();
            DataTable dtArenaFootball = new DataTable();

            dTMLB = clBusiness.extractFields("Report_Game_Statistic", 74, dateTimePicker1.Value, dateTimePicker2.Value);
            dtSoc = extractTotalExotics("SOC");
            dtMU = extractTotalCategorySport("MU", "Straight Bet");
         
            dtArenaFootball= clBusiness.getGameStats("Report_Game_Statistic", 74, "ARENA FOOTBALL", dateTimePicker1.Value, dateTimePicker2.Value);
            //dtCanadianFootball= extractTotalCategorySport("NFL", "Straight Bet");
            dtCanadianFootball = clBusiness.extractCategorySport("Report_Game_Statistic", "NFL", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            for (int j = 0; j < 19; j++)
            {
                for (int k = 5; k < 7; k++)
                {
                    //fill Soccer
                    if (j < 3)
                    {
                        excelWorkSheet.Cells[j + 3, k + 2] = dgv.Rows[j + 15].Cells[k + 1].Value.ToString();
                     
                    }


                    if (j == 10)
                    {
                        excelWorkSheet.Cells[j + 2, k + 2] = dtSoc.Rows[j-10][k-4];
                       

                    }

                    //Fill WNBA
                    if (j<8)
                    { 
                          excelWorkSheet.Cells[j + 19, k + 2] = dgv.Rows[j].Cells[k + 1].Value.ToString();
                        

                    }

                    //Fill ARENA FOOTBALL

                    if (j<dtArenaFootball.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 3, k + 7] = dtArenaFootball.Rows[j][k + 1];
                     
                    }

                    //fill CANADIAN FOOTBALL
                    if (j<dtCanadianFootball.Rows.Count-1)
                    {
                        //excelWorkSheet.Cells[j + 13, k + 6] = dgv.Rows[j].Cells[k + 1].Value.ToString();
                        excelWorkSheet.Cells[j + 11, k + 7] = dtCanadianFootball.Rows[j][k -4];
                    }

                    //Fill MLB
                    excelWorkSheet.Cells[j + 3, k - 3] = dTMLB.Rows[j][k - 4].ToString();

             
                                
                }
            }

            MessageBox.Show("Resultados de arena:" + dtArenaFootball.Rows.Count);
            //Fill MU total
            excelWorkSheet.Cells[26, 2] = dtMU.Rows[0][1];
            excelWorkSheet.Cells[26, 3] = dtMU.Rows[0][2];

            //dgv.Rows[32].Cells[2].Style.BackColor = System.Drawing.Color.Tomato;
            //dgv.Rows[32].Cells[3].Style.BackColor = System.Drawing.Color.Tomato;





            try
            { 
            excelWorkBook.SaveAs(outputFile);
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error trying to save the file: " + ex.Message);
            }
            finally
            {
                excelWorkBook.Close();
                excelApp.Quit();
                if (File.Exists(outputFile))
                {
                    System.Diagnostics.Process.Start(outputFile);
                }
            }
            

           

        }


        public DataTable extractTotalExotics(string sportName)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            DataTable exoticsSoc = clBusiness.extractCategorySport("Report_Game_Statistic", "SOC", "Parlay" , 74, dateTimePicker1.Value, dateTimePicker2.Value);
            //dataGridView1.DataSource = exoticsSoc;

            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, "SOC");
           

            return exoticsSoc;
        }

        public DataTable extractTotalCategorySport(string sportName, string category)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            DataTable exoticsSoc = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, category, 74, dateTimePicker1.Value, dateTimePicker2.Value);
            //dataGridView1.DataSource = exoticsSoc;

            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);


            return exoticsSoc;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
            TimeSpan span = new TimeSpan(3, 0, 0, 0, 0);
            dateTimePicker1.Value = DateTime.Today.Subtract(span);
            dateTimePicker2.Value = dateTimePicker1.Value;

            cmbSport.DataSource = clBusiness.ExeStoredProcedure("[dbo].[Sport_GetList]");

            cmbSport.DisplayMember = "SportName";
            cmbSport.ValueMember = "IdSport";

            cmbLeague.DataSource = clBusiness.ExeStoredProcedure("[dbo].[GetLeagues]");

            cmbLeague.DisplayMember = "Description";
            cmbLeague.ValueMember = "IdLeague";

            cmbSport.Text = "SOCCER";
            cmbLeague.Text = "";

            dataGridView1.DataSource = clBusiness.getGameStats("Report_Game_Statistic", 74, cmbLeague.Text, dateTimePicker1.Value, dateTimePicker2.Value);

            //fillExcelV2(@"C:\documents2017\desktop\ReportGameStats\DesktopC\bin\Debug\HOUSE REPORT BASE.xlsx", @"C:\documents2017\desktop\ReportGameStats\DesktopC\bin\Debug\HOUSE REPORT " + string.Format("{0:yyyy-MM-dd}", DateTime.Now) + ".xlsx", dataGridView1);
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

            //dataGridView1.DataSource = clBusiness.getGameStats("Report_Game_Statistic", 74, cmbLeagueId.Text, dateTimePicker1.Value, dateTimePicker2.Value);


            dataGridView1.DataSource = clBusiness.getGameStats("Report_Game_Statistic", 74, cmbLeague.Text, dateTimePicker1.Value, dateTimePicker2.Value);



        }

       

        private DataGrid soccerResults(DataGridView ds)
        {
            int i = 0;

            DataGrid dgSoccer = new DataGrid();

            for (i=0; i<3; i++ )
            {
                for (int j=0; j<6; j++)
                {
                    dgSoccer[i, j] = ds.Rows[i+6].Cells[j+6].Value.ToString();
                }
            }

            return dgSoccer;
        }

        public float extractFieldResult(string sport, string category, string category2, DataGrid ds)
        {
            return 0;
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
            saveFileDialog1.FileName = cmbLeague.Text + " " + dateTimePicker1.Text + " - " + dateTimePicker2.Text + ".xlsx";

            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {

                string path = saveFileDialog1.FileName;
                extractToExcel(saveFileDialog1.FileName);
                //File.WriteAllText(@saveFileDialog1.FileName + ".xls", rtOutput.Text);
                //MessageBox.Show("Archivo guardado con éxito!.");

            }
        }

        private void cmbSport_SelectedIndexChanged(object sender, EventArgs e)
        {



            cmbLeague.DataSource = clBusiness.ExeStoredProcedure("[dbo].[GetLeaguesBySport]", cmbSport.SelectedValue.ToString());
           

            cmbLeague.DisplayMember = "Description";
            cmbLeague.ValueMember = "IdLeague";
        }

        private void cmbLeague_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        private void button2_Click(object sender, EventArgs e)
        {
            fillExcel();
        }

        private void fillExcel()
        {

            fillExcelV2(@"C:\documents2017\desktop\ReportGameStats\DesktopC\bin\Debug\HOUSE REPORT BASE.xlsx", @"C:\documents2017\desktop\ReportGameStats\DesktopC\bin\Debug\HOUSE REPORT " + string.Format("{0:yyyy-MM-dd}", DateTime.Now) + ".xlsx", dataGridView1);

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            dateTimePicker2.Value = dateTimePicker1.Value;
            dataGridView1.DataSource = clBusiness.getGameStats("Report_Game_Statistic", 74, cmbLeague.Text, dateTimePicker1.Value, dateTimePicker2.Value);
            //paintExcel(dataGridView1);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = clBusiness.getGameStats("Report_Game_Statistic", 74, "ARENA FOOTBALL", dateTimePicker1.Value, dateTimePicker2.Value);
        }
    }
}
