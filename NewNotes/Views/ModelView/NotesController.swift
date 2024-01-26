//
//  NotesController.swift
//  NewNotes
//
//  Created by Artur Uvarov on 1/22/24.
//

import Foundation

class NotesController: ObservableObject {
    var mockdataObj: MockData
    @Published var categories: [Category]
    
    init(mockdataObj: MockData = MockData(), categories: [Category] = []) {
        self.mockdataObj = mockdataObj
        self.categories = mockdataObj.categories
    }
    
    func addCategory(_ category: Category) {
        categories.append(category)
    }
}
