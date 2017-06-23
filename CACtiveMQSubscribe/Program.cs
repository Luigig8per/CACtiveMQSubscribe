using Apache.NMS;
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
        static void Main(string[] args)
        {
            Console.WriteLine("Waiting for messages");

            // Read all messages off the queue
            while (ReadNextMessage())
            {
                //Console.WriteLine("Successfully read message");
            }

            Console.WriteLine("Finished");
        }


        static bool ReadNextMessage()
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
                    Console.WriteLine(" Errror: " + ex);
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

                        //Console.WriteLine($"Received message: {txtMsg.Text}");

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

                                if (attr.Name=="timestamp" || attr.Name == "time" ||  attr.Name == "message_timestamp")
                                {
                                    var now = DateTime.Now; // Current date/time
                                    var utcNow = now.ToUniversalTime(); //

                                   

                                    DateTime dt = DateTime.ParseExact(attr.Value, "yy-MM-dd'T'HH:mm:ssK",
                                   CultureInfo.InvariantCulture,
                                   DateTimeStyles.AdjustToUniversal);

                                    TimeZoneInfo easternTimeZone = TimeZoneInfo.FindSystemTimeZoneById(
                                                         "Eastern Standard Time");

                                    DateTime easternDateTime = TimeZoneInfo.ConvertTimeFromUtc(dt,
                                                                                               easternTimeZone);

                                    attrValue = easternDateTime.ToString();

                                   


                                }
                                else
                                {
                                    attrValue = attr.Value;
                                }

                                query2 += "'" + attrValue + "',";
                                //var itemValue = new ListViewItem(new[] { el.TagName, attr.Name, attr.Value });
                                //Console.WriteLine(attr.Name + ":" + attrValue + " " + el.Name);
                               
                            }

                        }

                        query += "timeReceived) ";
                        query2 += "getDate())";

                        query=query.Replace(",)", ")");
                        query2=query2.Replace(",)", ")");


                       


                        string connetionString = null;

                        SqlConnection connection2;
                        SqlCommand command;
                        string sql = null;

                        connetionString = "Data Source=10.10.10.46;Initial Catalog=DonBest;User ID=luisma;Password=12345678";
                        sql = query + query2;
                        connection2 = new SqlConnection(connetionString);

                        try
                        {
                            connection2.Open();
                            //Console.WriteLine(" Connection Opened ");
                            command = new SqlCommand(sql, connection2);
                            SqlDataReader dr1 = command.ExecuteReader();

                            connection.Close();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                            Console.WriteLine(query + query2);
                        }


                        var col = from dummy in xdoc.DescendantNodes() select dummy;




                        foreach (var myvar in col)

                        {
                            XNode node = (XNode)myvar;
                            if (node.NodeType == XmlNodeType.Text)
                            {
                                //Console.WriteLine("Type = [" + node.NodeType + "] Value = " + node.ToString());

                            }
                            else
                            {
                                XElement xdoc2 = new XElement((node as XElement).Name, (node as XElement).Value);
                                //Console.WriteLine("Type = [" + xdoc2.NodeType + "] Name = " + xdoc2.Name);
                            }
                        }
                        



                        return true;
                    }
                    else
                    {
                        Console.WriteLine("Unexpected message type: " + msg.GetType().Name);
                    }
                }
            }

            return false;
        }
    }
}
