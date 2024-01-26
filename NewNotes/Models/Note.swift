//
//  Note.swift
//  NewNotes
//
//  Created by Artur Uvarov on 1/13/24.
//

import Foundation

struct Note : Identifiable {
    let id: UUID
    let title: String
    let body: String
}
