//
//  AddView.swift
//  TodoMvvmSwiftUI
//
//  Created by Mehdi Taghdisi on 10/14/1401 AP.
//

import SwiftUI

struct AddView: View {
    let inputColor = Color(UIColor.secondarySystemBackground)
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("type your todo here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(inputColor)
                .cornerRadius(10)
                
                Button(action: {
                    if isTextAppropriate() {
                        saveButtonPressed()
                    }
                }) {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(10)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed(){
        if(!textFieldText.isEmpty){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func isTextAppropriate() -> Bool {
        if(textFieldText.count < 3){
            alertTitle = "Item must be 3 character long at least"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text("\(alertTitle)"))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
