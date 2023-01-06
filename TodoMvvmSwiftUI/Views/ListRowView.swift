//
//  ListRowView.swift
//  TodoMvvmSwiftUI
//
//  Created by Mehdi Taghdisi on 10/14/1401 AP.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : . red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "some random item", isCompleted: true)
    
    static var previews: some View {
        ListRowView(item: item1)
            .previewLayout(.sizeThatFits)
    }
}
