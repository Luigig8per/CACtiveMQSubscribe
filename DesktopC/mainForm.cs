using System;
using System.Windows.Forms;
using Business;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;
using OfficeOpenXml;
using System.Data;
using System.Reflection;

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
            Excel.Worksheet excelWorkSheet = excelWorkBook.Sheets[1];
            excelWorkSheet.Name = string.Format("{0:yyyy-MM-dd}", dateTimePicker1.Value);

            DataTable dTMLB = new DataTable();
            DataTable dtSoc = new DataTable();
            DataTable dtMU = new DataTable();
            DataTable dtCanadianFootball = new DataTable();
            DataTable dtArenaFootball = new DataTable();
            DataTable dtExoticsMLB = new DataTable();
            DataTable dtExoticsNBA = new DataTable();
            DataTable dtExoticsCanadianFootball = new DataTable();
            DataTable dt1STQCanadiaFootball  = new DataTable();
            DataTable dtSoccer = new DataTable();
            DataTable dtNBA= new DataTable();

            DataTable dtNFLPreseason = new DataTable();
            DataTable dtNFLPreseason1stHalves = new DataTable();
            DataTable dtNFLPreseason2ndHalves = new DataTable();
            DataTable dtNFLPreseasonQuarters = new DataTable();
            DataTable dtExoticsNFLPreseason = new DataTable();




            dTMLB = clBusiness.extractFields("Report_Game_Statistic", 74, dateTimePicker1.Value, dateTimePicker2.Value);
           
            dtMU = extractTotalExoticsAndStraightBet("MU");
            dtSoccer = extractCategorySport("SOC", "Straight Bet");
            dtSoc = extractTotalExotics("SOC");
            dtNBA = extractCategorySport("NBA", "Straight Bet");

            dtExoticsMLB = extractTotalExotics("MLB");
            dtExoticsNBA = extractTotalExotics("NBA");
            dtExoticsCanadianFootball = extractTotalExoticsAndTeasers("NFL");
            dt1STQCanadiaFootball = extractCategorySport("CANADIAN FOOTBALL", "CANADIAN FOOTBALL - QUARTERS");

            dtArenaFootball = clBusiness.getGameStats("Report_Game_Statistic", 74, "ARENA FOOTBALL", dateTimePicker1.Value, dateTimePicker2.Value);
            //dtCanadianFootball= extractTotalCategorySport("NFL", "Straight Bet");
          

            dtCanadianFootball = extractFieldsFromLeague("CANADIAN FOOTBALL");


            //dtNFLPreseason = extractFieldsFromLeague("NFL - PRESEASON ");
            dtNFLPreseason = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "NFL - PRESEASON", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            dtNFLPreseason1stHalves = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "NFL - PRESEASON 1ST HALVES", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            dtNFLPreseason2ndHalves = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "NFL - PRESEASON 2ND HALVES", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            dtNFLPreseasonQuarters = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "NFL - PRESEASON QUARTERS", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            //dtExoticsNFLPreseason= extractTotalExoticsAndTeasers()
            //dtNFLPreseason= extractCategorySport()

            string dateToDoc = string.Format("{0:yyyy-MM-dd}", dateTimePicker1.Value);
            excelWorkSheet.Cells[1, 1] = dateToDoc;
            excelWorkSheet.Cells[24, 1] = dateToDoc;
            excelWorkSheet.Cells[29, 1] = dateToDoc;
            excelWorkSheet.Cells[1, 6] = dateToDoc;
            excelWorkSheet.Cells[1, 11] = dateToDoc;
            excelWorkSheet.Cells[9, 11] = dateToDoc;
            excelWorkSheet.Cells[16, 6] = dateToDoc;
            excelWorkSheet.Cells[26, 11] = dateToDoc;

            for (int j = 0; j < 19; j++)
            {
                for (int k = 4; k < 7; k++)
                {
                               
                    //Fill WNBA
                    if (j<dtNBA.Rows.Count)
                    { 
                          excelWorkSheet.Cells[j + 18, k + 2] = dtNBA.Rows[j][k - 4];

                    }

                    //Fill ARENA FOOTBALL

                    if (j<dtArenaFootball.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 3, k + 7] = dtArenaFootball.Rows[j][k + 1];
                     
                    }

                    //fill CANADIAN FOOTBALL
                    if (j<dtCanadianFootball.Rows.Count)
                    {
                        //excelWorkSheet.Cells[j + 13, k + 6] = dgv.Rows[j].Cells[k + 1].Value.ToString();
                        excelWorkSheet.Cells[j + 11, k + 7] = dtCanadianFootball.Rows[j][k -4];
                    }

                    //Fill NFL PreSeason

                    if (j<dtNFLPreseason.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 28, k + 7] = dtNFLPreseason.Rows[j][k - 4];
                    }

                    if (j<dtNFLPreseason1stHalves.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 31, k + 7] = dtNFLPreseason1stHalves.Rows[j][k - 4];
                    }

                    if (j<dtNFLPreseason2ndHalves.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 34, k + 7] = dtNFLPreseason2ndHalves.Rows[j][k - 4];
                    }

                    if (j<dtNFLPreseasonQuarters.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 37, k + 7] = dtNFLPreseasonQuarters.Rows[j][k - 4];
                    }

                    if (j < dtSoccer.Rows.Count)
                    {
                        //excelWorkSheet.Cells[j + 3, k + 2] = dgv.Rows[j + 15].Cells[k + 1].Value.ToString();
                        //excelWorkSheet.Cells[j + 3, k + 2] = dTMLB.Rows[j + 15][k + 1];
                        excelWorkSheet.Cells[j + 3, k + 2] = dtSoccer.Rows[j][k - 4];

                    }


                    if (k>4) //with this the original description from table is not overrided

                    {

                        //Fill MLB
                        excelWorkSheet.Cells[j + 3, k - 3] = dTMLB.Rows[j][k - 4].ToString();
                        //fill Soccer


                        if (j == 10)
                        {
                            excelWorkSheet.Cells[j + 2, k + 2] = dtSoc.Rows[j - 10][k - 4];


                        }

                    }




                }
            }



            //fILL MLB Exotics 
            excelWorkSheet.Cells[18, 2] = dtExoticsMLB.Rows[0][1];
            excelWorkSheet.Cells[18, 3] = dtExoticsMLB.Rows[0][2];

            //Fill MU total
            excelWorkSheet.Cells[26, 2] = dtMU.Rows[0][1];
            excelWorkSheet.Cells[26, 3] = dtMU.Rows[0][2];


            //Fill NBA 

            excelWorkSheet.Cells[27, 7] = dtExoticsNBA.Rows[0][1];
            excelWorkSheet.Cells[27, 8] = dtExoticsNBA.Rows[0][2];

            //Fill CANADIAN FOOTBALL EXOTICS
            //excelWorkSheet.Cells[32, 3] = dtExoticsCanadianFootball.Rows[0][1];
            //excelWorkSheet.Cells[32, 4] = dtExoticsCanadianFootball.Rows[0][2];

            excelWorkSheet.Cells[23, 12] = dtExoticsCanadianFootball.Rows[0][1];
            excelWorkSheet.Cells[23, 13] = dtExoticsCanadianFootball.Rows[0][2];


            //Fill Canadian 1STQ 

            //NFL FOOTBALL

            excelWorkSheet.Cells[23, 12] = dtExoticsCanadianFootball.Rows[0][1];
            excelWorkSheet.Cells[23, 13] = dtExoticsCanadianFootball.Rows[0][2];

           


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

        public DataTable extractFieldsFromLeague(string leagueName)
        {
            DataTable resDatatable = new DataTable();
            DataTable dtGame = new DataTable();
            DataTable dt1stHalves = new DataTable();
            DataTable dt2ndHalves = new DataTable();
            DataTable dtQuarters = new DataTable();

            dtGame = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "" + leagueName + "", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            dt1stHalves = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "" + leagueName +" - 1ST HALVES", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            dt2ndHalves = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "" + leagueName +" - 2ND HALVES", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            dtQuarters= clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "" + leagueName + " - QUARTERS", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            //dtNFLPreseasonQuarters = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "NFL - PRESEASON QUARTERS", dateTimePicker1.Value, dateTimePicker2.Value, 3);

            resDatatable.Merge(dtGame);
            resDatatable.Merge(dt1stHalves);
            resDatatable.Merge(dt2ndHalves);
            resDatatable.Merge(dtQuarters);

            return resDatatable;
        }
        public DataTable extractTotalStraightBet(string sportName)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            DataTable exoticsSoc = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value);
            //dataGridView1.DataSource = exoticsSoc;

            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);


            return exoticsSoc;
        }

        public DataTable extractTotalExotics(string sportName)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            DataTable exoticsSoc = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, "Parlay" , 74, dateTimePicker1.Value, dateTimePicker2.Value);
            //dataGridView1.DataSource = exoticsSoc;

            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);
           

            return exoticsSoc;
        }

        public DataTable extractTotalExoticsAndTeasers(string sportName)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            DataTable exoticsSoc = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, "Parlay", 74, dateTimePicker1.Value, dateTimePicker2.Value);
            //dataGridView1.DataSource = exoticsSoc;
            //dataGridView1.DataSource = exoticsSoc;
            //MessageBox.Show("Next, the EXOTICS");
            //exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);


            DataTable exoticsSocV2 = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, "Teaser", 74, dateTimePicker1.Value, dateTimePicker2.Value);

           //exoticsSocV2=  clBusiness.sumOfDatatable(exoticsSocV2, sportName);
            //dataGridView1.DataSource = exoticsSoc;

            exoticsSoc.Merge(exoticsSocV2);

            //dataGridView1.DataSource = exoticsSoc;
            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);

            return exoticsSoc;
        }

        public DataTable extractTotalExoticsAndTeasers(string sportName, string league)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            DataTable exoticsSoc = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, "Parlay", 74, dateTimePicker1.Value, dateTimePicker2.Value);
            //dataGridView1.DataSource = exoticsSoc;
            //dataGridView1.DataSource = exoticsSoc;
            //MessageBox.Show("Next, the EXOTICS");
            //exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);


            DataTable exoticsSocV2 = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, "Teaser", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            //exoticsSocV2=  clBusiness.sumOfDatatable(exoticsSocV2, sportName);
            //dataGridView1.DataSource = exoticsSoc;

            exoticsSoc.Merge(exoticsSocV2);

            //dataGridView1.DataSource = exoticsSoc;
            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);

            return exoticsSoc;
        }


        public DataTable extractTotalExoticsAndStraightBet(string sportName)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            DataTable exoticsSoc = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value);
            //dataGridView1.DataSource = exoticsSoc;
            //dataGridView1.DataSource = exoticsSoc;
            //MessageBox.Show("Next, the EXOTICS");
            //exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);


            DataTable exoticsSocV2 = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, "Parlay", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            //exoticsSocV2=  clBusiness.sumOfDatatable(exoticsSocV2, sportName);
            //dataGridView1.DataSource = exoticsSoc;

            exoticsSoc.Merge(exoticsSocV2);

            //dataGridView1.DataSource = exoticsSoc;
            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);

            return exoticsSoc;
        }

        public DataTable extractCategorySport(string sportName, string category)
        {
            DataTable dtRes = clBusiness.extractCategorySport("Report_Game_Statistic", sportName, category, 74, dateTimePicker1.Value, dateTimePicker2.Value);
            return dtRes;
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
            
            TimeSpan span = new TimeSpan(1, 0, 0, 0, 0);
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

            //MessageBox.Show(System.IO.Path.GetDirectoryName(Assembly.GetEntryAssembly().Location));

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

        public float extractSpecificResultLeague(string sport, string category, string category2, DataGrid ds)
        {
            return 0;
        }


        private void button1_Click_1(object sender, EventArgs e)
        {
            try
            {
                saveFile();
              
            }
            catch (Exception ex)
            {
               MessageBox.Show("Error al intentar guardar el archivo:" + ex.Message);
            }
           
          
        }

        private void saveFile()
        {
            
            SaveFileDialog saveFileDialog1 = new SaveFileDialog();

            saveFileDialog1.Filter = "excel files (*.xls)|*.xls|All files (*.*)|*.*";
            saveFileDialog1.FilterIndex = 2;
            saveFileDialog1.RestoreDirectory = true;
            saveFileDialog1.FileName = (@"HOUSE REPORT " + dateTimePicker1.Text + " - " + dateTimePicker2.Text + ".xlsx");

            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {

                string path = saveFileDialog1.FileName;
               
                try
                {
                    fillExcelV2(@"S:\G8Housereport\BASE.xlsx", path, dataGridView1);
                }
                catch
                {
                    
                    fillExcelV2(@"C:\G8Housereport\BASE.xlsx", path, dataGridView1);
                }
                //fillExcelV2(@"C:\documents2017\desktop\ReportGameStats\DesktopC\bin\Debug\HOUSE REPORT BASE.xlsx", path + string.Format("{0:yyyy-MM-dd}", DateTime.Now) + ".xlsx", dataGridView1);

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
            dataGridView1.DataSource = extractCategorySport("SOC", "Straight Bet");

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            dataGridView1.DataSource= extractCategorySport("SOC", "Straight Bet");
            //dataGridView1.DataSource = exoticsSoc;
        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
