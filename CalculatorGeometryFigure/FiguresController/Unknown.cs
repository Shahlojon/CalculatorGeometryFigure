using System;
using System.Collections.Generic;
using System.Text;

namespace CalculatorGeometryFigure.FiguresController
{
    public class Unknown: Figure
    {
        public Unknown(IDictionary<string, object> parameters) : base(parameters)
        {
        }

        protected override double Calculate(IDictionary<string, object> parameters)
        {
            ValidateRequiredParameters(KeysValue.Func);

            if (parameters[KeysValue.Func] is Func<IDictionary<string, object>, double> func)
            {
                return func(parameters);
            }

            throw new InvalidOperationException($"parameters {KeysValue.Radius} is wrong");
        }
    }
}
