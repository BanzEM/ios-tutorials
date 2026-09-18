import Cocoa




func printName() {
    var name = "Gorge"
    print(name)
    
}



func fullName(_ name: String, _ surname: String) -> String{
    
    return name + " " + surname
}

fullName( "Jada",  "Smith")


func isEven (number: Int) {
    
    if number % 2 == 0 {
        print ("The number is Even")
    } else {
         print("The number is Odd")
    }
    
}

isEven(number: 3)
isEven(number: 4)
isEven(number: 7)
isEven(number: 10)

func greaterNumber(firstNumber: Int, secondNumber: Int ) -> Int {
    
    if firstNumber > secondNumber {
        return firstNumber
    }
    return secondNumber
}

greaterNumber(firstNumber: 10, secondNumber: 15)


let numbers = [1, 2, 3, 4, 5]

let numbersDoubled = numbers.map{$0 * 2}


struct User {
    let firstName: String
    let lastName: String
    let age: Int
    var fullName: String?
}

let users = [
    User(firstName: "John", lastName: "Smith", age: 25),
    User(firstName: "Sarah", lastName: "Jones", age: 17),
    User(firstName: "Mike", lastName: "Brown", age: 32),
    User(firstName: "Anna", lastName: "Wilson", age: 15)
]


let usersUnderAge = users.filter { user  in

    return user.age < 18
    
}
 print(usersUnderAge)


let userFirstName = users.map { user in
    
    return user.firstName
}

struct Player {
    let username: String
    let score: Int
    let isPremium: Bool
}

let players = [
    Player(username: "Dragon99", score: 850, isPremium: true),
    Player(username: "SwiftNinja", score: 420, isPremium: false),
    Player(username: "CodeMaster", score: 1200, isPremium: true),
    Player(username: "NoobSlayer", score: 150, isPremium: false)
]

let playerBoard = players.map { player in
    var board = player.username
    
    if player.isPremium {
        board = "⭐\(board)"
    }
    
    if player.score >= 1000 {
        board = "\(board) - Legend"
    } else if 1000 > player.score && player.score > 499 {
        board = "\(board) - Pro"
    } else if player.score < 500 {
        board = "\(board) - Beginner"
    }
     
    return board
}

print(playerBoard)

let leaderBoard = players.sorted { player1, player2 in
    
    return player1.score > player2.score
    
}

