//
//  NoteView.swift
//  NewNotes
//
//  Created by Artur Uvarov on 1/13/24.
//

import SwiftUI

struct NoteItem: View {
    var note: Note

    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .font(.headline)
            Text(note.body)
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NoteItem(note: Note(id: "", title: "New one", body: "Hello note"))
}
