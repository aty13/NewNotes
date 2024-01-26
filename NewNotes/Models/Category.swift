//
//  Category.swift
//  NewNotes
//
//  Created by Artur Uvarov on 1/25/24.
//

import Foundation

struct Category: Hashable {
    
    var title: String
    var systemImageName: String
    var notes: [Note]
    
    mutating func addNote(note: Note) {
        self.notes.append(note)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.title == rhs.title
    }
    
}
