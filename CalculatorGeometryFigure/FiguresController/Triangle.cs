using System;
using System.Collections.Generic;
using System.Text;

namespace CalculatorGeometryFigure.FiguresController
{
    public class Triangle: FigureT
    {
        public double aSide { get; set; }
        public double bSide { get; set; }
        public double cSide { get; set; }
        public Triangle(double a, double b, double c)
        {
            aSide = a;
            bSide = b;
            cSide = c;
            if (aSide * aSide + bSide * bSide == cSide * cSide)
            {
                Console.WriteLine("Triangle is right!");
            }
        }
        public override double GetArea()
        {
            double p = GetPerimeter() / 2;
            Area = Math.Sqrt(p * (p - aSide) * (p - bSide) * (p - cSide));
            return Area;
        }
        public override double GetPerimeter()
        {
            Perimeter = aSide + bSide + cSide;
            return Perimeter;
        }
    }
}
