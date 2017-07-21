using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{

   
    class Parameter
    {
        string parameterType;
        string parameterValue;
        string parameterName;


        public Parameter(string parameterType, string parameterValue, string parameterName)
        {
            this.parameterType = parameterType;
            this.parameterValue = parameterValue;
            this.parameterName = parameterName;
        }
    }
}
