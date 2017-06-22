using Apache.NMS;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
                Console.WriteLine("Successfully read message");
            }

            Console.WriteLine("Finished");
        }


        static bool ReadNextMessage()
        {
           
            string topic = "com.donbest.message.public.xmleddie";
            const string userName = "xmleddie";
            const string password = "xmlfootball";
            string brokerUri = "tcp://amq.donbest.com:61616";  // Default port
            NMSConnectionFactory factory = new NMSConnectionFactory(brokerUri);

            using (IConnection connection = factory.CreateConnection(userName,password))
            {
                connection.Start();
                using (ISession session = connection.CreateSession(AcknowledgementMode.AutoAcknowledge))
                using (IDestination dest = session.GetTopic(topic))
                using (IMessageConsumer consumer = session.CreateConsumer(dest))
                {
                    IMessage msg = consumer.Receive();
                    if (msg is ITextMessage)
                    {
                        int cont = 0;
                        string query = "insert into ";
                        string query2 = "values ";

                        ITextMessage txtMsg = msg as ITextMessage;
                        string body = txtMsg.Text;

                        Console.WriteLine($"Received message: {txtMsg.Text}");

                        var xdoc = XDocument.Parse(body);

                        foreach (var el in xdoc.Descendants())

                        {
                            cont += 1;
                            Console.WriteLine("Nodo " +  el.Name + ":" + el.Value + " " + el.Name);

                            if (cont==1)
                            { 
                            query += el.Name + " (";
                            query2 += "(";
                            }
                            foreach (var attr in el.Attributes())
                            {
                                query += attr.Name + ",";
                                query2 += "'" + attr.Value + "',";
                                //var itemValue = new ListViewItem(new[] { el.TagName, attr.Name, attr.Value });
                                Console.WriteLine(attr.Name + ":" + attr.Value + " " + el.Name);
                               
                            }

                        }

                        query += ") ";
                        query2 += ")";

                        query=query.Replace(",)", ")");
                        query2=query2.Replace(",)", ")");


                        Console.WriteLine(query + query2);


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
                            Console.WriteLine(" Connection Opened ");
                            command = new SqlCommand(sql, connection2);
                            SqlDataReader dr1 = command.ExecuteReader();

                            connection.Close();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                        }


                        var col = from dummy in xdoc.DescendantNodes() select dummy;




                        foreach (var myvar in col)

                        {
                            XNode node = (XNode)myvar;
                            if (node.NodeType == XmlNodeType.Text)
                            {
                                Console.WriteLine("Type = [" + node.NodeType + "] Value = " + node.ToString());

                            }
                            else
                            {
                                XElement xdoc2 = new XElement((node as XElement).Name, (node as XElement).Value);
                                Console.WriteLine("Type = [" + xdoc2.NodeType + "] Name = " + xdoc2.Name);
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
