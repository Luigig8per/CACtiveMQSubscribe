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

     

        public DataTable ExeStoredProcedure(string storedProcedureName, int logIdUser,DateTime prmStartDate, DateTime prmEndDate)
        {
            Dbconnection dbCon = new Dbconnection();

            //return  dbCon.ExeStoredProcedure(storedProcedureName, logIdUser, prmStartDate,  prmEndDate);

            List<string> spParameters = new List<string>(new string[] { logIdUser.ToString(), prmStartDate.ToString(), prmEndDate.ToString(), });


            return dbCon.insertData(storedProcedureName, spParameters);

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
