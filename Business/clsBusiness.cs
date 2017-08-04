using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using System.Globalization;
using System.Data;

namespace Business
{

    public class tunel
    {
        TimeZoneInfo cstZone = TimeZoneInfo.FindSystemTimeZoneById("Central America Standard Time");
        TimeZoneInfo easternTimeZone = TimeZoneInfo.FindSystemTimeZoneById(
                                 "Eastern Standard Time");

        DateTime convertToEastern(string originalDate)
        {
            DateTime dt = DateTime.ParseExact(originalDate, "yy-MM-dd'T'HH:mm:ssK",
                                CultureInfo.InvariantCulture,
                                DateTimeStyles.AdjustToUniversal);

            TimeZoneInfo easternTimeZone = TimeZoneInfo.FindSystemTimeZoneById(
                                 "Eastern Standard Time");

            DateTime easternDateTime = TimeZoneInfo.ConvertTimeFromUtc(dt,
                                                                       easternTimeZone);



            return easternDateTime;

           
        }

        DateTime convertToEastern(DateTime originalDate)
        {
            

            TimeZoneInfo easternTimeZone = TimeZoneInfo.FindSystemTimeZoneById(
                                 "Eastern Standard Time");

            DateTime easternDateTime = TimeZoneInfo.ConvertTimeFromUtc(originalDate,
                                                                       easternTimeZone);

            return easternDateTime;

        }

        string dateOnly(DateTime originallDate)
        {
            string dateOnly = String.Format("{0:dd/MM/yyyy}", originallDate);

            return dateOnly;
        }


        public DataTable ExeStoredProcedure(string storedProcedureName)
        {
            Dbconnection dbCon = new Dbconnection();

            //return  dbCon.ExeStoredProcedure(storedProcedureName, logIdUser, prmStartDate,  prmEndDate);

            //List<string> spParameters = new List<string>(new string[] { logIdUser.ToString(), prmStartDate.ToString(), prmEndDate.ToString(), });


            //return dbCon.insertData(storedProcedureName, spParameters);


            return dbCon.extractDataSP(storedProcedureName);


        }

        public DataTable extractFields(string storedProcedureName, int logIdUser, DateTime prmStartDate, DateTime prmEndDate)
        {
            DataAccess.MLB theMLB = new DataAccess.MLB();
            return theMLB.extractFields(storedProcedureName, logIdUser, prmStartDate.ToString(), prmEndDate.ToString());

          

        }

        public DataTable extractExotics(string storedProcedureName, string sport, int logIdUser, DateTime prmStartDate, DateTime prmEndDate)
        {
            DataAccess.MLB theMLB = new DataAccess.MLB();
            //return theMLB.extractExotics(storedProcedureName, sport, "Exotics", logIdUser, prmStartDate.ToString(), prmEndDate.ToString());

            return theMLB.extractCategorySport(storedProcedureName, sport, "Exotics", logIdUser, prmStartDate.ToString(), prmEndDate.ToString());
        }

        public DataTable extractCategorySport(string storedProcedureName, string sport, string category, int logIdUser, DateTime prmStartDate, DateTime prmEndDate)
        {
            DataAccess.MLB theMLB = new DataAccess.MLB();
            //return theMLB.extractExotics(storedProcedureName, sport, "Exotics", logIdUser, prmStartDate.ToString(), prmEndDate.ToString());

            return theMLB.extractCategorySport(storedProcedureName, sport, category, logIdUser, prmStartDate.ToString(), prmEndDate.ToString());
        }

        public DataTable sumOfDatatable(DataTable leagueDt, string leagueName)
        {
            DataAccess.MLB theMLB = new DataAccess.MLB();
            return theMLB.extractTotalAmountLeague(leagueDt, leagueName);
        }


        public DataTable ExeStoredProcedure(string storedProcedureName, string idSport)
        {
            Dbconnection dbCon = new Dbconnection();

            //return  dbCon.ExeStoredProcedure(storedProcedureName, logIdUser, prmStartDate,  prmEndDate);

            //List<string> spParameters = new List<string>(new string[] { logIdUser.ToString(), prmStartDate.ToString(), prmEndDate.ToString(), });


            //return dbCon.insertData(storedProcedureName, spParameters);


            return dbCon.extractDataSP(storedProcedureName, idSport);


        }
        public DataTable ExeStoredProcedure(string storedProcedureName, int logIdUser,DateTime prmStartDate, DateTime prmEndDate)
        {
            Dbconnection dbCon = new Dbconnection();

            //return  dbCon.ExeStoredProcedure(storedProcedureName, logIdUser, prmStartDate,  prmEndDate);

            //List<string> spParameters = new List<string>(new string[] { logIdUser.ToString(), prmStartDate.ToString(), prmEndDate.ToString(), });


            //return dbCon.insertData(storedProcedureName, spParameters);


            return dbCon.insertData(storedProcedureName, logIdUser, prmStartDate.ToString(), prmEndDate.ToString());


        }

        public DataTable getGameStats(string storedProcedureName, int logIdUser, string League, DateTime prmStartDate, DateTime prmEndDate)
        {
            Dbconnection dbCon = new Dbconnection();

            //return  dbCon.ExeStoredProcedure(storedProcedureName, logIdUser, prmStartDate,  prmEndDate);

            //List<string> spParameters = new List<string>(new string[] { logIdUser.ToString(), prmStartDate.ToString(), prmEndDate.ToString(), });


            //return dbCon.insertData(storedProcedureName, spParameters);


            return dbCon.getGameStats(storedProcedureName, logIdUser, League, prmStartDate.ToString(), prmEndDate.ToString());


        }


        public DataTable getGameStats(string storedProcedureName, int logIdUser, string League, string prmStartDate, string prmEndDate)
        {
            Dbconnection dbCon = new Dbconnection();

            //return  dbCon.ExeStoredProcedure(storedProcedureName, logIdUser, prmStartDate,  prmEndDate);

            //List<string> spParameters = new List<string>(new string[] { logIdUser.ToString(), prmStartDate.ToString(), prmEndDate.ToString(), });


            //return dbCon.insertData(storedProcedureName, spParameters);


            return dbCon.getGameStats(storedProcedureName, logIdUser, League, prmStartDate.ToString(), prmEndDate.ToString());


        }

        public DataTable ExeSPWithResults(string storedProcedureName, List<string> sqlParameters)
        {
            Dbconnection dbCon = new Dbconnection();
            return dbCon.ExeSPWithResults(storedProcedureName, sqlParameters);
        }

        public object doQuery(string query)
        {
            Dbconnection dbCon = new Dbconnection();
            return dbCon.ExeScalar(query);
        }

    }
}
