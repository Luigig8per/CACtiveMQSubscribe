using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class MLB
    {
        Dbconnection dbCon = new Dbconnection();
        public DataTable extractFields(string storedProcedureName, int logIdUser, string prmStartDate, string prmEndDate)

        {
            DataTable dgRes = new DataTable
            {
                Columns = {"Description",
                     "Volume", // typeof(string) is implied
                    {"Win-Lose"}
             },
                TableName = "MarksTable" //optional
            };

            DataTable dgTemp, dgTemp2, dgTemp3, dgTemp4, dgTemp5, dgTemp6, dgTemp7, dgTemp8, dgTemp9, dgTemp10, dgTemp11 = new DataTable();


            dgTemp =   extractMlSpTotalFields(storedProcedureName, logIdUser, "MAJOR LEAGUE BASEBALL", prmStartDate, prmEndDate, 3);

            //dgTemp.Merge(extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - 1ST HALVES (5 FULL INNINGS)", prmStartDate, prmEndDate));

            dgTemp2 = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - 1ST HALVES (5 FULL INNINGS)", prmStartDate, prmEndDate, 3);

            dgTemp3 = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - 2HF (4 FULL INNINGS+EXTRA INNS)", prmStartDate, prmEndDate, 3);

            dgTemp4 = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - ALTERNATIVE RUN LINES", prmStartDate, prmEndDate, 1);

            dgTemp5 = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - 2½ RUN LINES", prmStartDate, prmEndDate, 1);

            dgTemp6 = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - GAME PROPS", prmStartDate, prmEndDate, 3);

            dgTemp6 = extractTotalAmountLeague(dgTemp6, "MLB - GAME PROPS");

            dgTemp7 = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - LIVE WAGERING ", prmStartDate, prmEndDate, 3);

            dgTemp8 = extractCategorySport(storedProcedureName, "MLB", "Exotics", logIdUser, prmStartDate.ToString(), prmEndDate.ToString());

            dgTemp8 = extractTotalAmountLeague(dgTemp8, "MLB Exotics");

            //dgTemp8 = extract(storedProcedureName, logIdUser, "THIS IS EXOTICS", prmStartDate, prmEndDate, 1);

            dgTemp9 = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB GRAND SALAMI", prmStartDate, prmEndDate, 3);

            dgTemp9 = extractTotalAmountLeague(dgTemp9, "MLB GRAND SALAMI");

            dgTemp10 = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB SERIES PRICES", prmStartDate, prmEndDate, 3);

            dgTemp10 = extractTotalAmountLeague(dgTemp10, "MLB SERIES PRICES");

            dgTemp11 = extractMlSpTotalFields(storedProcedureName, logIdUser, "JAPANESE BASEBALL", prmStartDate, prmEndDate, 3);

            dgTemp11 = extractTotalAmountLeague(dgTemp11, "JAPANESE BASEBALL");


            dgTemp.Merge(dgTemp2);

            dgTemp.Merge(dgTemp3);

            dgTemp.Merge(dgTemp4);

            dgTemp.Merge(dgTemp5);

            dgTemp.Merge(dgTemp6);

            dgTemp.Merge(dgTemp7);

            dgTemp.Merge(dgTemp8);

            dgTemp.Merge(dgTemp9);

            dgTemp.Merge(dgTemp10);

            dgTemp.Merge(dgTemp11);

            return dgTemp;
        }





        public DataTable extractFieldsV2(string storedProcedureName, int logIdUser, string prmStartDate, string prmEndDate)

        {
            DataTable dgRes = new DataTable
            {
                Columns = {
                     "Volume", // typeof(string) is implied
                    {"Win-Lose", typeof(int)}
             },
                TableName = "MarksTable" //optional
            };

            DataTable dgTemp, dgTemp2, dgTemp3, dgTemp4, dgTemp5, dgTemp6, dgTemp7, dgTemp8, dgTemp9, dgTemp10, dgTemp11 = new DataTable();


            dgTemp = extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - GAME PROPS", prmStartDate, prmEndDate, 3);

            //dgTemp.Merge(extractMlSpTotalFields(storedProcedureName, logIdUser, "MLB - 1ST HALVES (5 FULL INNINGS)", prmStartDate, prmEndDate));

          
            return dgTemp;
        }


        public DataTable extractMlSpTotalFields(string storedProcedureName, int logIdUser, string league, string prmStartDate, string prmEndDate, int qLines)

        {
            int qRowsReport = qLines;
            //qLines means if some lines not exists will be filled with 0's

            DataTable dgRes = new DataTable
            {
                Columns = {"Description",
                     "Volume", // typeof(string) is implied
                    {"Win-Lose"}
             },
                TableName = "MarksTable" //optional
            };

            DataTable dgTemp = new DataTable();

            dgTemp = dbCon.getGameStats(storedProcedureName, logIdUser, league, prmStartDate, prmEndDate);

            if (qLines < dgTemp.Rows.Count)

                qRowsReport = qLines;
            else
                qRowsReport = dgTemp.Rows.Count;
           

            for (int i = 0; i <= qRowsReport-1; i++)
            {
                dgRes.Rows.Add(league + " " + dgTemp.Rows[i][5], dgTemp.Rows[i][6], dgTemp.Rows[i][7]);


            }

            if (dgTemp.Rows.Count<qLines)
            {
                for (int i = 0; i < (qLines - qRowsReport); i++)
                {
                    dgRes.Rows.Add(league, 0, 0);
                }
            }

            return dgRes;
        }

        public DataTable extractCategorySport(string storedProcedureName, string sport, string category, int logIdUser, string prmStartDate, string prmEndDate)

        {
          //qLines means if some lines not exists will be filled with 0's

            DataTable dgRes = new DataTable
            {
                Columns = {"Description",
                     "Volume", // typeof(string) is implied
                    {"Win-Lose"}
             },
                TableName = "MarksTable" //optional
            };

            DataTable dgTemp = new DataTable();

            dgTemp = dbCon.getGameStats(storedProcedureName, logIdUser, "", prmStartDate, prmEndDate);

          

            for (int i = 0; i <= dgTemp.Rows.Count - 1; i++)
            {
                //Used contains on next expression on MLB because field uses spaces.

                if (dgTemp.Rows[i][2].ToString() == category  && dgTemp.Rows[i][3].ToString().Contains(sport))
                {
                    dgRes.Rows.Add(dgTemp.Rows[i][2] + " " + dgTemp.Rows[i][3] , dgTemp.Rows[i][6], dgTemp.Rows[i][7]);
                  
                }

            }

            return dgRes;
        }




        public DataTable extractTotalAmountLeague(DataTable leagueDt, string leagueName)

        {
            float sumVolume = 0;
            float sumWinLose = 0;

            DataTable dgRes = new DataTable
            {
                Columns = {"Description",
                     "Volume", // typeof(string) is implied
                    {"Win-Lose" }
             },
                TableName = "MarksTable" //optional
            };


            for (int i=0; i<leagueDt.Rows.Count; i++)
            {
                sumVolume += float.Parse(leagueDt.Rows[i][1].ToString());
                sumWinLose += float.Parse(leagueDt.Rows[i][2].ToString());
            }

            dgRes.Rows.Add(leagueName + "total ", sumVolume, sumWinLose);

            return dgRes;

        }

        //public DataTable MlSpTotal(DataTable dataInput)
        //{


        //    dgTemp = dbCon.getGameStats(storedProcedureName, logIdUser, "MAJOR LEAGUE BASEBALL", prmStartDate, prmEndDate);

        //    for (int i = 0; i <= 2; i++)
        //    {
        //        dgRes.Rows.Add(dgTemp.Rows[i][6], dgTemp.Rows[i][7]);

        //    }

        //    return dgRes;
        //}
    }
}
