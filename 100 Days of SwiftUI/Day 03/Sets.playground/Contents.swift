import UIKit

// === How to use sets for fast data lookup == //

// .. they are similar to arrays, except you can't add duplicate
// .. items, and they don't store their items in a particular order

// .. the standard way of creating a set from fixed data
var people = Set([
    "denzel",
    "tom",
    "nicolas",
    "samuel"
])

// .. the set will automatically remove any duplicate values
// .. it won't remember the exact order that was used in the array

print(people)

// .. the set just doesn't care what order its items come in
// .. important difference when adding items: "insert()"

people.insert("washinton")
people.insert("cruise")
people.insert("cage")
people.insert("jackson")

// .. instead of storing your items in the exact order you specify, sets
// .. instead store them in a highly optimized order that makes it very fast
// .. to localte items


// === Array vs Set === //

// .. Initialization: they are quite the same
var arrayOfCategories: [String] = ["swift", "debugging", "xcode"]
var setOfCategories: Set<String> = ["swift", "debugging", "xcode"]

// .. you can use a seet instead of an array when the order of items is not important,
// .. or when yoou need to ensure that an item only appears once

// .. a Set is unordered while an Array is keeping its order
print(arrayOfCategories)
print(setOfCategories)

// .. both Arrays and Sets are value types
// .. we have to use "append()" for an Array and "insert()" for a Set
arrayOfCategories.append("wwdc")
setOfCategories.insert("wwdc")

// .. the return type of the "insert()" method:
// .. it returns both:
// .. "insert" boolean and a "memberAfterInsert" property which either
// .. contains the already-existing object or the just inserted object

// .. this can be valuable of you want to give feedback to the user
// .. if an object already exists:

let (inserted, memberAfterInsert) = setOfCategories.insert("swift")
if !inserted {
    print("\(memberAfterInsert) already exists")
}

// .. Uniqueness of elements:
// .. an Array can contain the same value twice
// .. while a Set will never contain duplicates

// .. The order of elements:
// .. Array: an ordered, random-access collection
// .. Set: an unordered collection of unique elements

// .. Performance differences:
// .. another reason to go for a Set is when performance is important
// .. or when a large amount of data is expected

// .. its good practice, in general, to create immutable
// .. collections if possible for performance

// .. CONCLUSION

// .. Go for an Array if:
// .. order is important
// .. duplicate elements should be possible
// .. performance is not important

// .. Go for a Set if:
// .. order is not important
// .. unique elements is a requirement
// .. performance is important
