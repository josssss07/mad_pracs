class Calculations {
  double bmiCal(double weight, double height) {
    double heightSq = height * height;
    double bmi = weight / heightSq;
    return bmi;
  }

  double areaRect(double len, double breadth) {
    double area;
    return (area = len * breadth);
  }
}
