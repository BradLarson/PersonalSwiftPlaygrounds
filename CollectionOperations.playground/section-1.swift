import Foundation

// Swift builtin collection operations
let testArray = [0, 1, 2, 3, 4]
let testArray2 = [1, 2, 3, 4, 5]
let testArray3 = ["Happy", "Fun"]

testArray.count
testArray.capacity
testArray.isEmpty

let randomArraySize = 5
let randoms = (1...randomArraySize).map { _ in Int(arc4random()) }
randoms

contains(testArray, 1)
dropFirst(testArray)
dump(testArray)
equal(testArray, testArray2)
find(testArray, 3)
maxElement(testArray)
minElement(testArray)
startsWith(testArray, [0,1])
join(":", testArray3)
//testArray3.join(":")

let reverse = testArray.reverse()

let sort = testArray.sorted{$0 < $1}
sort

let odds = testArray.filter{$0 % 2 == 1}
odds
let lessThanTen = [23,2,67,1,0,8].filter{$0 < 10}
lessThanTen

let odd = {$0 % 2 == 1}
filter(1...10, odd)

let squares = testArray.map{$0 * $0}
squares

let sum = testArray.reduce(0){$0 + $1}
sum

let zippedArray = Array(Zip2(testArray2, testArray3))
zippedArray[0]
let zippedArray2 = Array(Zip2(testArray, testArray2))
zippedArray2[0]

var arrayWithIndices: [(Int, String)] = []
for (index, value) in enumerate(testArray3) {
    arrayWithIndices.append(index, value)
}
arrayWithIndices

extension Array {
    func filterWithIndices(includeElement: (T) -> Bool) -> [(Int, T)] {
        var filterResults: [(Int, T)] = []
        for (index, arrayElement) in enumerate(self) {
            let t = arrayElement as T;
            if includeElement(t) {
                filterResults.append(index, t)
            }
        }
        return filterResults
    }
}

let oddsWithIndices = testArray2.filterWithIndices{$0 % 2 == 1}
oddsWithIndices

// Generators and sequences
var currentValue = 1
let newGenerator = GeneratorOf<Int> {
    let previousValue = currentValue
    currentValue = currentValue * 2
    if (previousValue > 20) { return nil }
    return previousValue
}
let generatedArray = Array(newGenerator)

func removeAnElement<T>(var array: [T]) -> GeneratorOf<[T]> {
    var i = 0
    return GeneratorOf {
        if i < array.count {
            var result = array.self
            result.removeAtIndex(i)
            i++
            return result
        }
        return nil
    }
}
Array(removeAnElement([1,2,3]))

// Mutating methods
var testArray4 = [1, 2, 3, 4, 5]
testArray4.append(10)
testArray4

testArray4.insert(20, atIndex:0)
testArray4

testArray4.sort{$0 < $1}
testArray4

testArray4.removeLast()
testArray4

testArray4.removeAtIndex(2)
testArray4

testArray4.extend(testArray2)
testArray4

testArray4.removeAll()
testArray4
testArray4.isEmpty

// Variable parameters
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(42, 597, 12)

