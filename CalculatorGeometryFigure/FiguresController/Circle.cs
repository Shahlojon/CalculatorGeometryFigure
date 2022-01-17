using System;
using System.Collections.Generic;
using System.Text;

namespace CalculatorGeometryFigure.FiguresController
{
    public class Circle : Figure
    {
        private const double Pi = Math.PI;

        public Circle(IDictionary<string, object> parameters) : base(parameters)
        {
        }

        protected override double Calculate(IDictionary<string, object> param) 
        {
            ValidateRequiredParameters(KeysValue.Radius);

            if (param[KeysValue.Radius] is double radius)
            {
                return Pi * Math.Pow(radius, 2);
            }

            throw new InvalidOperationException($"parameters {KeysValue.Radius} is wrong");
        }
    }
}
