//
//  ContentView.swift
//  NewNotes
//
//  Created by Artur Uvarov on 1/8/24.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject private var notesController: NotesController
    @State private var currentCategory: Category
    @State private var isAddingNote: Bool = false
    @State private var newNoteTitle: String = ""
    
    init(notesController: NotesController = NotesController()) {
        self.notesController = notesController
        self._currentCategory = State(initialValue: notesController.categories.first ?? Category(title: "", systemImageName: "book.pages.fill", notes: []))
    }
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    ForEach(notesController.categories, id: \.self) { category in
                        CategoryIconView(category: category)
                            .onTapGesture {
                                self.currentCategory = category
                            }
                    }
                    Image(systemName: "pencil.line")
                        .padding()
                        .colorInvert()
                        .onTapGesture {
                            self.notesController.addCategory(Category(title: "new one", systemImageName: "book.pages.fill", notes: []))
                        }
                    Spacer()
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.gray, .cyan]), startPoint: .top, endPoint: .bottom)
                )
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(currentCategory.title)
                            .font(.headline)
                            .padding()
                        Spacer()
                        Button(action: {
                            
                            withAnimation {
                                self.isAddingNote.toggle()
                            }
                            
                        }) {
                            Image(systemName: "plus")
                                .padding()
                        }
                    }
                    
                    VStack {
                        if isAddingNote {
                            VStack {
                                TextEditor(text: $newNoteTitle)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .border(Color.gray)
//                                    .padding()
                                HStack {
                                    Spacer()
                                    Button {
                                        currentCategory.addNote(note: Note(id: UUID(), title: "new note 1", body: newNoteTitle))
                                        self.isAddingNote.toggle()
                                    } label: {
                                        Text("Save")
                                    }
                                    .padding()
                                }
                            }
                        }
                        
                        if currentCategory.notes.isEmpty && !isAddingNote {
                            Text("No notes yet")
                        } else {
                            List(currentCategory.notes) { note in
                                Text(note.title)
                            }
                        }
                        
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
}


struct CategoryIconView: View {
    let category: Category
    
    var body: some View {
        Image(systemName: category.systemImageName)
            .padding()
            .colorInvert()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
