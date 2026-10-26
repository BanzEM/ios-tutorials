import Cocoa

var greeting = "Hello, playground"

var userName: String? = "Bandi"

//print(userName)

var age: Int? = 25

if let age = age {
    
    //print("Age: \(age)")
}else{
    //print("age is unknown")
}

var nickName: String?

//print(nickName ?? "Guest") // nil coalescing


var score: Int? = nil

if let score = score {
    
    if score >= 50 {
       //print("Passed")
    } else {
       //print("Failed")
    }
    
} else {
    //print("No score available")
}


let input = "abc"
let converted = Int(input)

if let converted = converted {
    
   // print(converted * 2)
} else {
    //print("invalid")
}

func guardExcercise(number: Int) {
    
//    if number % 2 == 0 {
//        print("the even number is \(number)")
//    }
    
    guard number % 2 == 0 else {
        return
    }
    print("the even number is \(number)")
}



func sendEmail(to email: String?) {
    
//    guard email != nil else {
//        print("no email provided")
//        return
//    }
//    print("The email is: \(email ?? "")")
    
    guard let emil = email else {
       // print("no email provided")
        return
    }
   // print("The email is: \(emil)")
}

struct Person {
    var name: String
}

let person: Person? = Person(name: "Emma")

print(person?.name ?? "unknown")
