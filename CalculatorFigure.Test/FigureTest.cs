using System;
using System.Collections.Generic;
using System.Text;
using CalculatorGeometryFigure;
using CalculatorGeometryFigure.FiguresController;
using Xunit;
using Xunit.Sdk;

namespace CalculatorFigure.Test
{
    public class FigureTest
    {
        [Fact]
        public void ItShouldBeCalculateCircleSquare()
        {
            const double expectedValue = 19.634954084936208;

            var parameters = new Dictionary<string, object>
            {
                {KeysValue.Radius, 2.5}
            };

            var sut = new Circle(parameters);
            var result = sut.OnCalculate();

            Assert.Equal(expectedValue, result);
        }

        [Fact]
        public void ItShouldBeCalculateRectangleSquare()
        {
            const double expectedValue = 25;

            var parameters = new Dictionary<string, object>
            {
                { KeysValue.Length, 5D },
                { KeysValue.Width, 5D }
            };

            var sut = new Rectangle(parameters);
            var result = sut.OnCalculate();

            Assert.Equal(expectedValue, result);
        }

        [Fact]
        public void TriangleAreaTestMethod()
        {
            //Arrange
            double a = 3;
            double b = 4;
            double c = 5;
            double expected = 6;

            //Act
            Triangle triangle = new Triangle(a, b, c);
            double actual = triangle.GetArea();

            //Assert
            Assert.Equal(expected, actual);
        }

        [Fact]
        public void TrianglePerimeterTestMethod()
        {
            //Arrange
            double a = 3;
            double b = 4;
            double c = 5;
            double expected = 12;

            //Act
            Triangle triangle = new Triangle(a, b, c);
            double actual = triangle.GetPerimeter();

            //Assert
            Assert.Equal(expected, actual);
        }

        [Fact]
        public void ItShouldBeCalculateByUnknownFigure()
        {
            const double expectedValue = 19.634954084936208;

            Func<IDictionary<string, object>, double> func = parameters =>
            {
                if (!parameters.TryGetValue(KeysValue.Radius, out var value))
                    throw new KeyNotFoundException($"Key #{KeysValue.Radius} not found");

                if (value is double radius)
                {
                    return Math.PI * Math.Pow(radius, 2);
                }

                throw new InvalidOperationException($"parameters {KeysValue.Radius} is wrong");
            };

            var unknownFigureParameters = new Dictionary<string, object>
            {
                {KeysValue.Radius, 2.5},
                {KeysValue.Func, func}
            };

            var sut = new Unknown(unknownFigureParameters);
            var result = sut.OnCalculate();

            Assert.Equal(expectedValue, result);
        }
    }
}
