﻿using System;
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

        public DataTable fillCollegeFB()
        {
            DataTable DTCollegeFB = new DataTable();
            DataTable DTCollegeFH = new DataTable();
            DataTable DTCollegeSH = new DataTable();

            DTCollegeFB = clBusiness.extractCategoryLeague("Report_Game_Statistic", "CFB", "NCAA FOOTBALL", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            DTCollegeFH= clBusiness.extractCategoryLeague("Report_Game_Statistic", "CFB", "NCAA FOOTBALL 1ST HALVES", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            DTCollegeSH = clBusiness.extractCategoryLeague("Report_Game_Statistic", "CFB", "NCAA FOOTBALL 2ND HALVES", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);


            DTCollegeFB.Merge(DTCollegeFH);
            DTCollegeFB.Merge(DTCollegeSH);

            return DTCollegeFB;

        }

        void activeWorkSheet(Excel.Worksheet worksheet, int row, int col)
        {
            Excel.Range range = worksheet.UsedRange;

           

            Excel.Range activeCell = worksheet.Cells[row, col];
            activeCell.Select();




        }

        public void fillExcelFields(Excel.Workbook excelWorkBook, int sheetNumber)
        {
            Excel.Worksheet excelWorkSheet = excelWorkBook.Sheets[sheetNumber];

            excelWorkSheet.Select(Type.Missing);
            excelWorkSheet.Activate();

            DataTable dTMLB = new DataTable();
            DataTable dtSoc = new DataTable();
            DataTable dtMU = new DataTable();
            DataTable dtCanadianFootball = new DataTable();
            DataTable dtArenaFootball = new DataTable();
            DataTable dtExoticsMLB = new DataTable();
            DataTable dtExoticsNBA = new DataTable();
            DataTable dtExoticsCanadianFootball = new DataTable();
            DataTable dt1STQCanadiaFootball = new DataTable();
            DataTable dtSoccer = new DataTable();
            DataTable dtNBA = new DataTable();

            DataTable dtNFLPreseason = new DataTable();
            DataTable dtNFLPreseason1stHalves = new DataTable();
            DataTable dtNFLPreseason2ndHalves = new DataTable();
            DataTable dtNFLPreseasonQuarters = new DataTable();
            DataTable dtExoticsNFLPreseason = new DataTable();

            DataTable dtNFL = new DataTable();
            DataTable dtNFL1stHalves = new DataTable();
            DataTable dtNFL2ndHalves = new DataTable();
            DataTable dtNFLQuarters = new DataTable();
            DataTable dtExoticsNFL = new DataTable();

            DataTable dtCollege = new DataTable();
            DataTable dtExoticsCollege = new DataTable();

            dTMLB = clBusiness.extractFields("Report_Game_Statistic", 74, dateTimePicker1.Value, dateTimePicker2.Value);

            dtMU = extractTotalExoticsAndStraightBet("MU");
            dtSoccer = extractCategorySport("SOC", "Straight Bet");
            dtSoc = extractTotalExotics("SOC");
            dtNBA = extractCategorySport("NBA", "Straight Bet");

            dtExoticsMLB = extractTotalExotics("MLB");
            dtExoticsNBA = extractTotalExoticsAndTeasers("NBA");


            dtExoticsCanadianFootball = extractTotalExoticsCanadianFootball();
            dt1STQCanadiaFootball = extractCategorySport("CANADIAN FOOTBALL", "CANADIAN FOOTBALL - QUARTERS");

            dtArenaFootball = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "ARENA FOOTBALL", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            //dtCanadianFootball= extractTotalCategorySport("NFL", "Straight Bet");


            dtCanadianFootball = extractFieldsFromLeague("CANADIAN FOOTBALL", "NFL", "Straight Bet");

            //dtNFLPreseason = extractFieldsFromLeague("NFL - PRESEASON ");
            //dtNFLPreseason = clBusiness.extractFieldsFromLeague("Report_Game_Statistic", 74, "NFL - PRESEASON", dateTimePicker1.Value, dateTimePicker2.Value, 3);
            dtNFLPreseason = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - PRESEASON", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dtNFLPreseason1stHalves = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - PRESEASON 1ST HALVES", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dtNFLPreseason2ndHalves = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - PRESEASON 2ND HALVES", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            //clBusiness.extractCategoryLeague("Report_Game_Statistic", sport, leagueName, category, 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);

            dtNFLPreseasonQuarters = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - PRESEASON QUARTERS", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dtExoticsNFLPreseason = extractTotalExoticsNFLPreseason();


            dtNFL = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dtNFL1stHalves = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - 1ST HALVES", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dtNFL2ndHalves = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - 2ND HALVES", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            //clBusiness.extractCategoryLeague("Report_Game_Statistic", sport, leagueName, category, 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);

            dtNFLQuarters = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - QUARTERS", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dtExoticsNFL = extractTotalExoticsNFL();

            //dtCollege  = clBusiness.extractCategoryLeague("Report_Game_Statistic", "CFB", "NCAA FOOTBALL", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dtCollege = fillCollegeFB();
            dtExoticsCollege = extractTotalExoticsLeague("CFB", "NCAA FOOTBALL");
            //dtNFLPreseason= extractCategorySport()

            string dateToDoc = string.Format("{0:yyyy-MM-dd}", dateTimePicker1.Value);
            excelWorkSheet.Cells[1, 1] = dateToDoc;
            excelWorkSheet.Cells[24, 1] = dateToDoc;
            excelWorkSheet.Cells[29, 1] = dateToDoc;
            excelWorkSheet.Cells[1, 6] = dateToDoc;
            excelWorkSheet.Cells[1, 11] = dateToDoc;
            excelWorkSheet.Cells[9, 11] = dateToDoc;
            excelWorkSheet.Cells[16, 6] = dateToDoc;
            excelWorkSheet.Cells[31, 6] = dateToDoc;
            excelWorkSheet.Cells[26, 11] = dateToDoc;
            excelWorkSheet.Cells[44, 11] = dateToDoc;

            

            for (int j = 0; j < 19; j++)
            {
                for (int k = 4; k < 7; k++)
                {
                    activeWorkSheet(excelWorkSheet, 0 + 1, k - 3);
                    //Fill WNBA
                    if (j < dtNBA.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 18, k + 2] = dtNBA.Rows[j][k - 4];

                    }

                    //Fill College Football

                 

                    if (j < dtCollege.Rows.Count)
                    {

                        excelWorkSheet.Cells[j + 33, k + 2] = dtCollege.Rows[j][k - 4];

                    }



                    if (j < dtExoticsCollege.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 45, k + 2] = dtExoticsCollege.Rows[j][k - 4];
                    }

                    //Fill ARENA FOOTBALL

                    if (j < dtArenaFootball.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 3, k + 22] = dtArenaFootball.Rows[j][k - 4];

                    }

                    //fill CANADIAN FOOTBALL
                    if (j < dtCanadianFootball.Rows.Count)
                    {
                        //excelWorkSheet.Cells[j + 13, k + 6] = dgv.Rows[j].Cells[k + 1].Value.ToString();
                        excelWorkSheet.Cells[j + 11, k + 7] = dtCanadianFootball.Rows[j][k - 4];
                    }

                    //Fill NFL PreSeason

                    if (j < dtNFLPreseason.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 28, k + 7] = dtNFLPreseason.Rows[j][k - 4];
                    }

                    if (j < dtNFLPreseason1stHalves.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 31, k + 7] = dtNFLPreseason1stHalves.Rows[j][k - 4];
                    }

                    if (j < dtNFLPreseason2ndHalves.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 34, k + 7] = dtNFLPreseason2ndHalves.Rows[j][k - 4];
                    }

                    if (j < dtNFLPreseasonQuarters.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 37, k + 7] = dtNFLPreseasonQuarters.Rows[j][k - 4];
                    }

                    if (j < dtExoticsNFLPreseason.Rows.Count)
                        excelWorkSheet.Cells[ 40, k + 7] = dtExoticsNFLPreseason.Rows[j][k - 4];



                    //Fill NFL

                    if (j < dtNFL.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 46, k + 7] = dtNFL.Rows[j][k - 4];
                    }

                    if (j < dtNFL1stHalves.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 49, k + 7] = dtNFL1stHalves.Rows[j][k - 4];
                    }

                    if (j < dtNFL2ndHalves.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 52, k + 7] = dtNFL2ndHalves.Rows[j][k - 4];
                    }

                    if (j < dtNFLQuarters.Rows.Count)
                    {
                        excelWorkSheet.Cells[j + 55, k + 7] = dtNFLQuarters.Rows[j][k - 4];
                    }

                    if (j < dtExoticsNFL.Rows.Count)
                        excelWorkSheet.Cells[58, k + 7] = dtExoticsNFL.Rows[j][k - 4];

                    //SOCCER

                    if (j < dtSoccer.Rows.Count)
                    {
                        //excelWorkSheet.Cells[j + 3, k + 2] = dgv.Rows[j + 15].Cells[k + 1].Value.ToString();
                        //excelWorkSheet.Cells[j + 3, k + 2] = dTMLB.Rows[j + 15][k + 1];
                        excelWorkSheet.Cells[j + 3, k + 2] = dtSoccer.Rows[j][k - 4];

                    }


                    if (k > 4) //with this the original description from table is not overrided

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


            //Next should be deleted after not show text on query result
            excelWorkSheet.Cells[40, 11] = "EXOTICS";

            //fILL MLB Exotics 
            excelWorkSheet.Cells[18, 2] = dtExoticsMLB.Rows[0][1];
            excelWorkSheet.Cells[18, 3] = dtExoticsMLB.Rows[0][2];

            //Fill MU total
            excelWorkSheet.Cells[26, 2] = dtMU.Rows[0][1];
            excelWorkSheet.Cells[26, 3] = dtMU.Rows[0][2];


            //Fill NBA 

            excelWorkSheet.Cells[27, 7] = dtExoticsNBA.Rows[0][1];
            excelWorkSheet.Cells[27, 8] = dtExoticsNBA.Rows[0][2];


            excelWorkSheet.Cells[23, 12] = dtExoticsCanadianFootball.Rows[0][1];
            excelWorkSheet.Cells[23, 13] = dtExoticsCanadianFootball.Rows[0][2];


            //Fill Canadian 1STQ 

            //NFL FOOTBALL

            excelWorkSheet.Cells[23, 12] = dtExoticsCanadianFootball.Rows[0][1];
            excelWorkSheet.Cells[23, 13] = dtExoticsCanadianFootball.Rows[0][2];




            excelWorkSheet.Cells[26, 2] = dtMU.Rows[0][1];
            excelWorkSheet.Cells[26, 3] = dtMU.Rows[0][2];

          

        }

        public void fillExcelV2(string templateFile, string outputFile, DataGridView dgv)
        {
            Excel.Application excelApp = new Excel.Application();

            //Create an Excel workbook instance and open it from the predefined location
            Excel.Workbook excelWorkBook = excelApp.Workbooks.Open(templateFile);

            this.WindowState = FormWindowState.Minimized;



            fillExcelFields(excelWorkBook, 1);


            try
            { 
            excelWorkBook.SaveAs(outputFile);
                excelWorkBook.Close();
                this.WindowState = FormWindowState.Normal;

                DialogResult dialogResult = MessageBox.Show("Excel file saved as  " + outputFile + ", would you like to close this app?", "Excel done", MessageBoxButtons.YesNo);
                if (dialogResult == DialogResult.Yes)
                {
                    this.Close();
                }
                else if (dialogResult == DialogResult.No)
                {
                    //do something else
                }
            }
            catch(Exception ex)
            {
               
                this.WindowState = FormWindowState.Normal;
                MessageBox.Show("Error trying to save the file: " + ex.Message);
            }
            finally
            {
               
            }
            

           

        }

        public DataTable extractFieldsFromLeague(string leagueName, string sport, string category)
        {
            DataTable resDatatable = new DataTable();
            DataTable dtGame = new DataTable();
            DataTable dt1stHalves = new DataTable();
            DataTable dt2ndHalves = new DataTable();
            DataTable dtQuarters = new DataTable();

            

            dtGame = clBusiness.extractCategoryLeague("Report_Game_Statistic", sport, leagueName, category, 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dt1stHalves = clBusiness.extractCategoryLeague("Report_Game_Statistic", sport, leagueName + " - 1ST HALVES", category, 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);

            //Test
           


            dt2ndHalves = clBusiness.extractCategoryLeague("Report_Game_Statistic", sport, leagueName + " - 2ND HALVES", category, 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            dtQuarters = clBusiness.extractCategoryLeague("Report_Game_Statistic", sport, leagueName + " - QUARTERS", category, 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            
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

        public DataTable extractTotalExotics(string sportName, string league)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

           

            DataTable exoticsSoc = clBusiness.extractCategoryLeague("Report_Game_Statistic", sportName,league, "Parlay", 74, dateTimePicker1.Value, dateTimePicker2.Value,2);
            //dataGridView1.DataSource = exoticsSoc;

            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);


            return exoticsSoc;
        }

        public DataTable extractTotalExoticsLeague(String sportName, String leagueName)
        {

            DataTable dtCanadianGame = extractTotalExoticsAndTeasers(sportName, leagueName, 2);
            DataTable dt1stHCandian = extractTotalExoticsAndTeasers(sportName, leagueName + " 1ST HALVES", 2);
            DataTable dt2ndHalves = extractTotalExoticsAndTeasers(sportName, leagueName + " 2ND HALVES", 2);
           

            dtCanadianGame.Merge(dtCanadianGame);
            dtCanadianGame.Merge(dt1stHCandian);
            dtCanadianGame.Merge(dt2ndHalves);
         

            dtCanadianGame = clBusiness.sumOfDatatable(dtCanadianGame, "NCAA FOOTBALL");

         

            return dtCanadianGame;

            

        }
        public DataTable extractTotalExoticsCanadianFootball()
        {

            DataTable dtCanadianGame = extractTotalExoticsAndTeasers("NFL", "CANADIAN FOOTBALL", 2);
            DataTable dt1stHCandian = extractTotalExoticsAndTeasers("NFL", "CANADIAN FOOTBALL - 1ST HALVES", 2);
            DataTable dt2ndHalves = extractTotalExoticsAndTeasers("NFL", "CANADIAN FOOTBALL - 2ND HALVES", 2);
            DataTable dtQuarters = extractTotalExoticsAndTeasers("NFL", "CANADIAN FOOTBALL - QUARTERS", 2);

            dtCanadianGame.Merge(dtCanadianGame);
            dtCanadianGame.Merge(dt1stHCandian);
            dtCanadianGame.Merge(dt2ndHalves);
            dtCanadianGame.Merge(dtQuarters);


            dtCanadianGame = clBusiness.sumOfDatatable(dtCanadianGame, "CANADIAN FOOTBALL");
            return dtCanadianGame;

        }

        public DataTable extractTotalExoticsSportAndLeague(string sport, string league)
        {

            DataTable dtCanadianGame = extractTotalExoticsAndTeasers(sport, league, 2);
            DataTable dt1stHCandian = extractTotalExoticsAndTeasers(sport, league + " - 1ST HALVES", 2);
            DataTable dt2ndHalves = extractTotalExoticsAndTeasers(sport, league + " - 2ND HALVES", 2);
            DataTable dtQuarters = extractTotalExoticsAndTeasers(sport, league + " - QUARTERS", 2);

            dtCanadianGame.Merge(dtCanadianGame);
            dtCanadianGame.Merge(dt1stHCandian);
            dtCanadianGame.Merge(dt2ndHalves);
            dtCanadianGame.Merge(dtQuarters);


            dtCanadianGame = clBusiness.sumOfDatatable(dtCanadianGame, league);
            return dtCanadianGame;

        }

        public DataTable extractTotalExoticsNFLPreseason()
        {

            DataTable dtCanadianGame = extractTotalExoticsAndTeasers("NFL", "NFL PRESEASON", 2);


            DataTable dt1stHCandian = extractTotalExoticsAndTeasers("NFL", "NFL - PRESEASON 1ST HALVES", 2);

            DataTable dt2ndHalves = extractTotalExoticsAndTeasers("NFL", "NFL - PRESEASON 2ND HALVES", 2);

            //DataTable dtQuarters = extractTotalExoticsAndTeasers("NFL", "CANADIAN FOOTBALL - QUARTERS", 2);

            dtCanadianGame.Merge(dtCanadianGame);
            dtCanadianGame.Merge(dt1stHCandian);
            dtCanadianGame.Merge(dt2ndHalves);
          


            dtCanadianGame = clBusiness.sumOfDatatable(dtCanadianGame, "NFL PRESEASON");
            return dtCanadianGame;


        }

        public DataTable extractTotalExoticsNFL()
        {

            DataTable dtCanadianGame = extractTotalExoticsAndTeasers("NFL", "NFL", 2);


            DataTable dt1stHCandian = extractTotalExoticsAndTeasers("NFL", "NFL - 1ST HALVES", 2);

            DataTable dt2ndHalves = extractTotalExoticsAndTeasers("NFL", "NFL - 2ND HALVES", 2);

            //DataTable dtQuarters = extractTotalExoticsAndTeasers("NFL", "CANADIAN FOOTBALL - QUARTERS", 2);

            dtCanadianGame.Merge(dtCanadianGame);
            dtCanadianGame.Merge(dt1stHCandian);
            dtCanadianGame.Merge(dt2ndHalves);

          

            dtCanadianGame = clBusiness.sumOfDatatable(dtCanadianGame, "NFL Exotics");
            return dtCanadianGame;


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

        public DataTable extractTotalExoticsAndTeasers(string sportName, string league, int descriptionType)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);

           

            DataTable exoticsSoc = clBusiness.extractCategoryLeague("Report_Game_Statistic", sportName, league, "Parlay", 74, dateTimePicker1.Value, dateTimePicker2.Value, descriptionType);
        


            DataTable exoticsSocV2 = clBusiness.extractCategoryLeague("Report_Game_Statistic", sportName, league, "Teaser", 74, dateTimePicker1.Value, dateTimePicker2.Value, descriptionType);

            //exoticsSocV2=  clBusiness.sumOfDatatable(exoticsSocV2, sportName);
            //dataGridView1.DataSource = exoticsSoc;

            exoticsSoc.Merge(exoticsSocV2);

            //dataGridView1.DataSource = exoticsSoc;
            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);

            return exoticsSoc;
        }

        public DataTable extractTotalExoticsAndTeasersCandianFootball(string sportName, string league, int descriptionType)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);



            DataTable exoticsSoc = clBusiness.extractCategoryLeague("Report_Game_Statistic", sportName, league, "Parlay", 74, dateTimePicker1.Value, dateTimePicker2.Value, descriptionType);



            DataTable exoticsSocV2 = clBusiness.extractCategoryLeague("Report_Game_Statistic", sportName, league, "Teaser", 74, dateTimePicker1.Value, dateTimePicker2.Value, descriptionType);

            //exoticsSocV2=  clBusiness.sumOfDatatable(exoticsSocV2, sportName);
            //dataGridView1.DataSource = exoticsSoc;

            exoticsSoc.Merge(exoticsSocV2);

            //dataGridView1.DataSource = exoticsSoc;
            //MessageBox.Show("Next, the EXOTICS");
            exoticsSoc = clBusiness.sumOfDatatable(exoticsSoc, sportName);

            return exoticsSoc;
        }


        public DataTable extractTotalExoticsAndTeasersNFLPreseason(string sportName, string league, int descriptionType)
        {
            //DataTable exoticsSoc = clBusiness.extractExotics("Report_Game_Statistic", "SOC", 74, dateTimePicker1.Value, dateTimePicker2.Value);



            DataTable exoticsSoc = clBusiness.extractCategoryLeague("Report_Game_Statistic", sportName, league, "Parlay", 74, dateTimePicker1.Value, dateTimePicker2.Value, descriptionType);



            DataTable exoticsSocV2 = clBusiness.extractCategoryLeague("Report_Game_Statistic", sportName, league, "Teaser", 74, dateTimePicker1.Value, dateTimePicker2.Value, descriptionType);

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


            //dataGridView1.DataSource = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - PRESEASON", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);

            //MessageBox.Show(System.IO.Path.GetDirectoryName(Assembly.GetEntryAssembly().Location));

            dataGridView1.DataSource = clBusiness.extractCategoryLeague("Report_Game_Statistic", "CFB", "NCAA FOOTBALL", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);

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
            button1.Text = "Please wait";
            try
            {
                saveFile();
              
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al intentar guardar el archivo:" + ex.Message);
            }

            button1.Text = "GENERATE FULL EXCEL REPORT";
        }

        private void saveFile()
        {
            string dateToDoc = string.Format("{0:yyyy-MM-dd HH.mm.ss}", DateTime.Now);

            string path = (@"S:\LINES\SYSTEM\MLB Auto Report " + string.Format("{0:MM-dd}", dateTimePicker1.Value) + " ~ " + string.Format("{0:MM-dd}", dateTimePicker2.Value) + "  (" + dateToDoc + ").xlsx");


            try
            {
                fillExcelV2(@"S:\G8Housereport\BASE.xlsx", path, dataGridView1);
                //fillExcelV2(@"S:\MLBHouseReport\G8 MLB House Report\MLBBASE.xlsx", path, dataGridView1);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                fillExcelV2(@"C:\G8Housereport\BASE.xlsx", path, dataGridView1);
            }
            //fillExcelV2(@"C:\documents2017\desktop\ReportGameStats\DesktopC\bin\Debug\HOUSE REPORT BASE.xlsx", path + string.Format("{0:yyyy-MM-dd}", DateTime.Now) + ".xlsx", dataGridView1);

            //File.WriteAllText(@saveFileDialog1.FileName + ".xls", rtOutput.Text);
            //MessageBox.Show("Archivo guardado con éxito!.");


        }

        private void cmbSport_SelectedIndexChanged(object sender, EventArgs e)
        {



            cmbLeague.DataSource = clBusiness.ExeStoredProcedure("[dbo].[GetLeaguesBySport]", cmbSport.SelectedValue.ToString());
           

            cmbLeague.DisplayMember = "Description";
            cmbLeague.ValueMember = "IdLeague";
        }

        private void cmbLeague_SelectedIndexChanged(object sender, EventArgs e)
        {
            dataGridView1.DataSource = clBusiness.getGameStats("Report_Game_Statistic", 74, cmbLeague.Text, dateTimePicker1.Value, dateTimePicker2.Value);
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

        private void button2_Click_2(object sender, EventArgs e)
        {

            //extractTotalExoticsAndTeasers("NFL", "NFL - PRESEASON", 2);


            dataGridView1.DataSource = extractTotalExoticsCanadianFootball();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button2_Click_3(object sender, EventArgs e)
        {
           //dataGridView1.DataSource= clBusiness.getGameStats("Report_Game_Statistic", 74, "ARENA FOOTBALL", dateTimePicker1.Value, dateTimePicker2.Value);

            dataGridView1.DataSource =  clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "ARENA FOOTBALL", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
        }

        private void button2_Click_4(object sender, EventArgs e)
        {
            dataGridView1.DataSource= extractTotalExoticsAndTeasers("NFL", "NFL - PRESEASON", 2);
        }

        private void button2_Click_5(object sender, EventArgs e)
        {
            //dataGridView1.DataSource = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - PRESEASON", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            //dataGridView1.DataSource = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - PRESEASON 1ST HALVES", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);
            //dataGridView1.DataSource = clBusiness.extractCategoryLeague("Report_Game_Statistic", "NFL", "NFL - PRESEASON 2ND HALVES", "Straight Bet", 74, dateTimePicker1.Value, dateTimePicker2.Value, 2);

            dataGridView1.DataSource = extractFieldsFromLeague("CANADIAN FOOTBALL", "NFL", "Straight Bet");
        }
    }
}
