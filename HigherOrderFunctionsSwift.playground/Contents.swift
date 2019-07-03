//
//  Higher Order Functions in Swift
//  https://engineering.nodesagency.com/
//  By Roxana Jula and Nicolai Harbo on 03/07/2019.
//

import UIKit

// TEST DATA
let meters = [10.0, 22.0, 55.0, 74.0]
let numbers = [5, 3, 2, 6, 10, 23, 01, 43, 5, 7, 8, 9]
let planetNames = ["mars", "jupiter", "mercury", "saturn", "earth", "neptune", "uranus", "venus"]
let names = [["roxana", "peter", "jacob", "morten"],["iben", "nour", "nicolai"]]
let scores = ["1", "2", "three", "four", "5"]

class Address {
    var street: String
    var zipcode: Int
    
    init(street: String, zipcode: Int) {
        self.street = street
        self.zipcode = zipcode
    }
}

var addresses = [Address]()
addresses.append(Address(street: "Nice Boulevard", zipcode: 1200))
addresses.append(Address(street: "Green Street", zipcode: 4560))


// MAP

// Example 1: Convert Meters to Feet
let feet = meters.map { $0 * 3.281}
print("Meters converted to feet: \(feet)")

// Example 2: Make the planet names capitalized
let capitalizedPlanetNames = planetNames.map { $0.capitalized }
print("Planet names capitalized: \(capitalizedPlanetNames)")

//Example 3: Map the array of addresses to an array of zipcodes
let zipcodes = addresses.map { $0.zipcode }
print("Zip codes: \(zipcodes)")


// FILTER

// Example 1: Filter only the planets that start with the letter "M"
let filteredPlanetNames = planetNames.filter {$0.prefix(1).uppercased() == "M"}
print("Count of filtered planet names: \(filteredPlanetNames.count)")

// Example 2: Filter the address array to only addresses from zipcode 1200
let filteredAddresses = addresses.filter {$0.zipcode == 1200}
print("Count of filtered addresses: \(filteredAddresses.count)")


// REDUCE

// Example 1: Sum of numbers - version 1
let sumOfNumbers = numbers.reduce(0, {$0 + $1})
print("Sum of numbers - version 1: \(sumOfNumbers)")

// Example 2: Sum of numbers - version 2
let sumOfNumbers2 = numbers.reduce(0,+)
print("Sum of numbers - version 2: \(sumOfNumbers)")

// Example 3: Longest planet name
let longestPlanetName = planetNames.reduce("", {$0.count > $1.count ? $0 : $1 } )
print("Longest planet name: \(longestPlanetName)")

// SORTED

// Example 1: Sorting numbers ascending
let sortedNumbersAscending = numbers.sorted()
print("Sorted numbers ascending: \(sortedNumbersAscending)")

//Example 2: Sorted numbers descending - version 1
let sortedNumbersDescending = numbers.sorted { (a, b) -> Bool in
    a > b
}
print("Sorted numbers descending - version 1: \(sortedNumbersDescending)")

//Example 3: Sorted numbers descending - version 2
let sortedNumbersDescending2 = numbers.sorted{($0 > $1)}
print("Sorted numbers descending - version 2: \(sortedNumbersDescending2)")

//Example 4: Sorted numbers descending - version 3
let sortedNumbersDescending3 = numbers.sorted(by: >)
print("Sorted numbers descending - version 3: \(sortedNumbersDescending3)")


// FLATMAP

// Example 1: Flatmap without optionals
let flatNames = names.flatMap({$0.sorted()})
print("Flatmap of names sorted: \(flatNames)")

//Example 2: Flat Flatmap without optionals
let flatFlatNames = flatNames.flatMap({$0.sorted()})
print("Flat Flatmap of names sorted: \(flatFlatNames)")

//Example 3: Flat with optionals
 let flatMapNumbers: [Int?] = scores.flatMap { str in Int(str) }
 print("Flatmap numbers: \(flatMapNumbers)")


// COMPACTMAP

// Example 1: Compact map with optionals
let compactMapped: [Int?] = scores.compactMap { str in Int(str) }
print("Compact map with optionals: \(compactMapped)")

//Example 2: Compact map without optionals
let compactMapNumbers: [Int] = scores.compactMap { str in Int(str) }
print("Compact map without optionals: \(compactMapNumbers)")


// CHAINING

// Example 1: An array of street names from a specific zipcode
let streetNamesFromZipcode = addresses.filter {$0.zipcode == 1200}.map {$0.street}
print("Street names from specific zipcode: \(streetNamesFromZipcode)")

// Example 2: An array of sorted capitalized planet names
let sortedCapitalizedPlanetNames = planetNames.map { $0.capitalized }.sorted()
print("Sorted capitalized plane names: \(sortedCapitalizedPlanetNames)")

// Example 3: Names flat map sorted descending
let descendingFlatNames = names.flatMap({$0.sorted{$0 > $1}})
print("Descending sorted flat map names: \(descendingFlatNames)")


