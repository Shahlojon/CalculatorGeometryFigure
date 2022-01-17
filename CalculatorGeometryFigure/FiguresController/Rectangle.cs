using System;
using System.Collections.Generic;
using System.Text;

namespace CalculatorGeometryFigure.FiguresController
{
    public class Rectangle : Figure
    {
        public Rectangle(IDictionary<string, object> parameters) : base(parameters)
        {
        }

        protected override double Calculate(IDictionary<string, object> param)
        {
            ValidateRequiredParameters(KeysValue.Length, KeysValue.Width);

            if (param[KeysValue.Length] is double length && param[KeysValue.Width] is double width)
            {
                return length * width;
            }

            throw new InvalidOperationException($"some type is not valid");
        }
    }
}
