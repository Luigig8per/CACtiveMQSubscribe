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

        static void Main(string[] args)
        {

            
            Program p = new Program();

            p.lastUpdateToCustomer = DateTime.Now;
            p.readLines(p.lastUpdateToCustomer,0);


        }

        public object doQuery(string query)
        {
            Dbconnection dbCon = new Dbconnection();


            return dbCon.ExeScalar(query);



        }
        public void readLines(DateTime lastUpdateToCustomer, int linesCount)
        {

            int initialLinesCount;

            Console.WriteLine("Waiting for messages");

            do
            {
                initialLinesCount = linesCount;
                linesCount = ReadNextMessage(lastUpdateToCustomer, linesCount);

                if (linesCount != 0 && linesCount % 100 == 0)
                    Console.WriteLine(linesCount + "  readed lines" + DateTime.Now );
               
            } while (linesCount == (initialLinesCount + 1));
            // Read all messages off the queue

         

            Console.WriteLine("Finished");


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
        public int ReadNextMessage(DateTime lastUpdateToC, int linesCount)
        {


            string topic = "com.donbest.message.public.xmleddie";
            const string userName = "xmleddie";
            const string password = "xmlfootball";
            string brokerUri = "tcp://amq.donbest.com:61616";  // Default port
            TimeZoneInfo cstZone = TimeZoneInfo.FindSystemTimeZoneById("Central America Standard Time");


            NMSConnectionFactory factory = new NMSConnectionFactory(brokerUri);


            string  query, query2;
            string attrValue;
            

            using (IConnection connection = factory.CreateConnection(userName,password))
            {
                try
                { 
                connection.Start();
                }
                catch ( Exception ex)
                {
                    Console.WriteLine(" Errror: " + ex.Message);
                }

                using (ISession session = connection.CreateSession(AcknowledgementMode.AutoAcknowledge))
                using (IDestination dest = session.GetTopic(topic))
                using (IMessageConsumer consumer = session.CreateConsumer(dest))
                {
                    IMessage msg = consumer.Receive();
                    if (msg is ITextMessage)
                    {
                        int cont = 0;
                        query = "insert into ";
                        query2 = "values ";
                        

                        ITextMessage txtMsg = msg as ITextMessage;
                        string body = txtMsg.Text;

                       

                        var xdoc = XDocument.Parse(body);

                        foreach (var el in xdoc.Descendants())

                        {
                            cont += 1;
                            //Console.WriteLine("Nodo " +  el.Name + ":" + el.Value + " " + el.Name);

                            if (cont==1)
                            { 
                            query += el.Name + " (";
                            query2 += "(";
                            }

                            foreach (var attr in el.Attributes())
                            {
                                query += attr.Name + ",";

                                if (attr.Name=="timestamp" || attr.Name == "time" ||  attr.Name == "message_timestamp" || attr.Name ==  "open_time")
                                {

                                    attrValue = convertToEastern(attr.Value).ToString();
                                }
                                else
                                {
                                    attrValue = attr.Value;
                                }

                                query2 += "'" + attrValue + "',";
                                
                               
                            }

                        }

                        query += "timeReceived) ";
                        query2 += "getDate())";

                        query=query.Replace(",)", ")");
                        query2=query2.Replace(",)", ")");


                        doQuery(query + query2);

                        return linesCount+1;
                    }
                    else
                    {
                        Console.WriteLine("Unexpected message type: " + msg.GetType().Name);
                    }
                }
            }

            return linesCount;
        }
    }
}
