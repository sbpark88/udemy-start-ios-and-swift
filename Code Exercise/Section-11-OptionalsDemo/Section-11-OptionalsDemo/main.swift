let myOptional: String?

// myOptional = nil
myOptional = "Hogwarts"

// Error!!
var text: String
// text = myOptional

// 1. Force Unwrapping
text = myOptional!
print("1. Force Unwrapping: \(text)")
text = String.init()

//
// 2. Check for nil value
if myOptional != nil {
    let text = myOptional!
    print("2. Check for nil value: \(text)")
} else {
    print("myOptional was found to be nil.")
}
text = String.init()

//
// 3. Optional Binding
if let text = myOptional {
    print("3. Optional Binding(if): \(text)")
} else {
    print("myOptional was found to be nil.")
}

if let myOptional = myOptional {
    text = myOptional
} else {
    print("myOptional was found to be nil.")
}
print("3. Optional Binding(if): \(text)")
text = String.init()

guard var text = myOptional else {
    fatalError("guard failure handling has not been implemented")
}
print("3. Optional Binding(guard): \(text)")
text = String.init()

//
// 4. Nil Coalescing Operator
text = myOptional ?? "I am the default value."

//
// 5. Optional Chaining
struct MyNewOptional {
    var property = 123

    func method() {
        print("I am the struct's method.")
    }
}

var myNewOptional: MyNewOptional?

myNewOptional = MyNewOptional()
print(myNewOptional?.property)
print(myNewOptional!.property)
myNewOptional?.method()
myNewOptional!.method()

myNewOptional = nil
print(myNewOptional?.property)      // return nil
print(myNewOptional!.property)      // throw Fatal error: Unexpectedly found nil while unwrapping an Optional value
