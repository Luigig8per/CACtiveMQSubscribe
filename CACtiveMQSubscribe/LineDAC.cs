using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CACtiveMQSubscribe
{
    class LineDAC
    {
        public List<line> GetLines()
        {
            using (DonBestEntities db = new DonBestEntities())


                return db.lines.ToList();

        }
    }
}
