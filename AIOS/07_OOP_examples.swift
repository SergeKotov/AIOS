//
//  07_OOP_examples.swift
//  AIOS
//
//  Created by Serge Kotov on 04.08.2022.
//

import Foundation


// Examples to handle OOP inheritance and initialization issues

enum Country {
    case argentina, britain, china, france, germany, italy, japan, usa
}

enum Genre {
    case fiction, mystery, thriller, horror, historical, romance,
         western, scienceFiction, fantasy, realist, magical
}

struct Book {
    let author: Author // attention!
    let title: String
    let year: Int
    let genre: Genre
}

class Author {
    let name: String
    let country: Country
    let genre: Genre
    
    private var bookCounter = 0
    private(set) var books = [Int: Book]()
    
    init(name: String, country: Country, genre: Genre) {
        self.name = name
        self.country = country
        self.genre = genre
    }
    
    func writeNewBook(title: String) {
        let year = Calendar(identifier: .gregorian).component(.year, from: Date())
        let newBook = Book(author: self, title: title, year: year, genre: genre)
        
        bookCounter += 1
        books[bookCounter] = newBook
        
        print("\(self.name) just wrote a book '\(title)'")
    }
    
    func publishBook(title: String) {
        if let number = books.first(where: { $1.title == title })?.key {
            print("\(self.name) just published the \(number)th book '\(title)'")
        } else {
            print("No such book with title: \(title)")
        }
    }
}

final class HorrorAuthor: Author {

    let ageRating: Int

    init(name: String, country: Country) {
        ageRating = 16
        super.init(name: name, country: country, genre: .horror)
    }

    override func publishBook(title: String) {
        super.publishBook(title: title)
        print("The book has age rating \(ageRating)+")
    }
}

public class Library {
    private var bookCounter = 0
    private(set) var books: [Int: Book] = [:]
    
    // public interface
    func getBooksByGenre(_ genre: Genre) -> [Book] {
        let filtered = books.filter { $1.genre == genre }
        return Array(filtered.values)
    }
    
    func getBooksByAuthor(_ author: String) -> [Book] {
        // write code here
        return []
    }
    
    func addNewBook(_ book: Book) {
        bookCounter += 1
        books[bookCounter] = book
    }
    
    func deleteBook(_ book: Book) {
        // write code here
    }
}

let literature = {
    var jonRead = Author(name: "Jon Read", country: .usa, genre: .fiction)
    jonRead.writeNewBook(title: "Hello my funny world")
    print(jonRead.books[1] ?? "nothing")
    print(jonRead.books[1]?.author.books[1] ?? "nothing") // check differences a reference type from a value type
    jonRead.publishBook(title: "Hello my funny world")
    jonRead.publishBook(title: "The strange world")
    print()
    
    let drJekyll = HorrorAuthor(name: "Dr. Jekyll", country: .britain)
    drJekyll.writeNewBook(title: "Strange Case of Dr Jekyll and Mr Hyde")
    drJekyll.publishBook(title: "Strange Case of Dr Jekyll and Mr Hyde")
    print()
}
