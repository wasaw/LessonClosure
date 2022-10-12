import UIKit

// 1

func perimeterRectangle(_ firstSide: Double, _ secondSide: Double) -> Double {
    return 2 * (firstSide + secondSide)
}

func areaRectangle(_ firstSide: Double, _ secondSide: Double) -> Double {
    return firstSide * secondSide
}

typealias RectangleCountType = (Double, Double) -> Double

func countRectangle(firstSide: Double, secondSide: Double, typeCount: RectangleCountType) -> Double {
    return typeCount(firstSide, secondSide)
}

let perimeter = countRectangle(firstSide: 3, secondSide: 7, typeCount: perimeterRectangle(_:_:))
let area = countRectangle(firstSide: 3, secondSide: 7, typeCount: areaRectangle(_:_:))

print("Периметр прямоугольника \(perimeter)")
print("Площадь прямоугольника \(area)")

// 2

func sumSquare(first: Int, second: Int, square: (Int) -> Int, sum: (Int, Int) -> Int) {
    let firstNumberSquare = square(first)
    let secondNumberSquare = square(second)
    let total = sum(firstNumberSquare, secondNumberSquare)
    print("Сумма квадратов чисел \(first) и \(second) равна \(total)")
}

sumSquare(first: 5, second: 7) { a in
    return a * a
} sum: { a, b in
    return a + b
}

// 3

let randInt = {
    return Int.random(in: 0...1)
}

func lottery(rand: @autoclosure () -> Int) {
    switch rand() {
    case 0:
        print("Вы победили")
    case 1:
        print("Вы проиграли")
    default:
        print("Попробуйте снова")
    }
}

lottery(rand: randInt())

// 4

func includeRange(number: Int) {
    func checkInclude(checkNumb: Int) -> Bool {
        if checkNumb > -30  && checkNumb < 23 {
            return true
        }
        return false
    }
    
    if checkInclude(checkNumb: number) {
        print("Число \(number) входит в диапозон")
    } else {
        print("Число \(number) не входит в диапозон")
    }
}

includeRange(number: -35)
includeRange(number: 2)

// 5

func typeNumber<Template: Numeric>(num: Template) {
    if type(of: num) == Int.self {
        print("Введено число типа целое")
    }
    if type(of: num) == Float.self || type(of: num) == Double.self {
        print("Введено число вещественного типа")
    }
}

typeNumber(num: 43)
typeNumber(num: 21.2)

