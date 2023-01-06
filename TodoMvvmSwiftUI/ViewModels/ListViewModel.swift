//
//  ListViewModel.swift
//  TodoMvvmSwiftUI
//
//  Created by Mehdi Taghdisi on 10/14/1401 AP.
//

import Foundation

class ListViewModel : ObservableObject{
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "Mother Joker", isCompleted: false),
            ItemModel(title: "Say some joke", isCompleted: true),
            ItemModel(title: "You are not so funny", isCompleted: false)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(index: IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}
