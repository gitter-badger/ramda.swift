//
//  ComplementTests.swift
//  Ramda
//
//  Created by Justin Guedes on 2016/09/11.
//  Copyright (c) 2016 CocoaPods. All rights reserved.
//

import XCTest
import Fox
import Ramda

class ComplementTests: XCTestCase {

    func isEven(number: Int) -> Bool {
        return number % 2 == 0
    }

    func isEqual(first: String, second: String) -> Bool {
        return first == second
    }

    func isConsecutive(first: Int, second: Int, third: Int) -> Bool {
        return (third == (second + 1)) && (third == (first + 2))
    }

    func isAllEqual(first: String, second: String, third: String, fourth: String) -> Bool {
        return first == second && second == third && third == fourth
    }

    func isAllEven(first: Int, second: Int, third: Int, fourth: Int, fifth: Int) -> Bool {
        return isEven(first) && isEven(second) && isEven(third) && isEven(fourth) && isEven(fifth)
    }

    func isAllOdd(numbers: Int...) -> Bool {
        for number in numbers {
            if isEven(number) {
                return false
            }
        }

        return true
    }

    func testShouldComplementIsEvenAndReturnAllOddResults() {
        let expectedResult = !isEven(5)
        let input = 5

        let isOdd = R.complement(isEven)
        let result = isOdd(input)

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldComplementIsEqualAndReturnAllNonEqualResults() {
        let expectedResult = !isEqual("String", second: "String3")
        let input = "String3"

        let isNotEqual = R.complement(isEqual)
        let result = isNotEqual("String", input)

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldComplementIsConsecutiveAndReturnAllNonConsecutiveResults() {
        let expectedResult = !isConsecutive(1, second: 2, third: 3)

        let isNotConsecutive = R.complement(isConsecutive)
        let result = isNotConsecutive(1, 2, 3)

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldComplementIsAllEqualAndReturnAllNonEqualResults() {
        let expectedResult = !isAllEqual("String", second: "String", third: "String",
                fourth: "String")

        let isNotAllEqual = R.complement(isAllEqual)
        let result = isNotAllEqual("String", "String", "String", "String")

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldComplementIsAllEvenAndReturnAllOddResults() {
        let expectedResult = !isAllEven(1, second: 3, third: 4, fourth: 5, fifth: 6)

        let isNotAllEven = R.complement(isAllEven)
        let result = isNotAllEven(1, 3, 4, 5, 6)

        XCTAssertEqual(expectedResult, result)
    }

    func testShouldComplementIsAllOddAndReturnAllEvenResults() {
        let expectedResult = !isAllOdd(1, 3, 5, 7, 9, 11)

        let isAllEven = R.complement(isAllOdd)
        let result = isAllEven(1, 3, 5, 7, 9, 11)

        XCTAssertEqual(expectedResult, result)
    }

}
