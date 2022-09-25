//
//   IteratorPattern.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 19/09/22.
//

import Foundation
/*
 This pattern is used for iterating over a collection of elements. It does not expose the data structure used in implementing it (array, dictionary or linked list) rather it gives an interface which iterates over the collection of elements without exposing its underlying representation.
 */
struct MyBestFilms: Sequence {
    let films: [String]
    
    func makeIterator() -> MyBestFilmsIterator {
        return MyBestFilmsIterator(films)
    }
}

struct MyBestFilmsIterator: IteratorProtocol {
    
    var films: [String]
    var cursor: Int = 0

    init(_ films: [String]) {
        self.films = films
    }
    
    mutating func next() -> String? {
        defer { cursor += 1 }
        return films.count > cursor ? films[cursor] : nil
    }
}

class TestIterator {
    func testIterator() {
        let myFilms = MyBestFilms(films: ["Godfather Trilogy", "Silence of the Lambs", "Call Me By Your Name"])
        for film in myFilms {
          print(film)
        }
//        Output:
//        Godfather Trilogy
//        Silence of the Lambs
//        Call Me By Your Name
    }
}
