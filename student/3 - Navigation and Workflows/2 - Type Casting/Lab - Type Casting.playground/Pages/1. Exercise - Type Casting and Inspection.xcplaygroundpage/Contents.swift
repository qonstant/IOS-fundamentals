/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var collection: [Any] = [3.7 , "eleven", 1.1, 7, true, "word"]
print(collection)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in collection {
    if let intItem = item as? Int {
        print("The integer has a value of \(intItem)")
    } else if let doubleItem = item as? Double {
        print("The Double has a value of \(doubleItem)")
    } else if let stringItem = item as? String {
        print("The string has a value of \(stringItem)")
    } else if let booleanItem = item as? Bool {
        print("The boolean has a value of \(booleanItem)")
    }
}
//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var dict: [String: Any] = [
    "this": true,
    "is": 2.3,
    "american": 4,
    "dream": "5"
]
for (key, value) in dict {
    print("Key: \(key) \n Value: \(value)")
}
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (_, value) in dict {
    if let intItem = value as? Int {
        total += Double(intItem)
    } else if let doubleItem = value as? Double {
        total += doubleItem
    } else if let booleanItem = value as? Bool {
        if booleanItem == true {
            total += 2
        } else {
            total -= 3
        }
    } else if let stringItem = value as? String {
        total += 1
    }
}
print("Total: \(total)")
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0.0
for (_, value) in dict {
    if let stringItem = value as? String, let convertedItem = Double(stringItem) {
        total2 += convertedItem
    } else if let intItem = value as? Int{
        total2 += Double(intItem)
    } else if let doubleItem = value as? Double {
        total2 += doubleItem
    }
}
print("Total2: \(total2)")
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
