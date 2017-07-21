using Apache.NMS;
using DataLayer;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;

namespace CACtiveMQSubscribe
{
	class Program
	{
		DateTime lastUpdateToCustomer = DateTime.Now;
	
		TimeZoneInfo cstZone = TimeZoneInfo.FindSystemTimeZoneById("Central America Standard Time");
	

		static void Main(string[] args)
		{
			Program p = new Program();

			
		}

		public Program()
		{
			
		}

		public object doQuery(string query)
		{
			Dbconnection dbCon = new Dbconnection();
			return dbCon.ExeScalar(query);
		}


		public object doQuery(string table, string column, string text)
		{
			string query;
			query = "insert into " + table + "(" + column + ") values ('" + text + "')"; ;

			Dbconnection dbCon = new Dbconnection();
			return dbCon.ExeScalar(query);
		}

		

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

		
	}
}
