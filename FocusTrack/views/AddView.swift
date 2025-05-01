//
//  AddView.swift
//  FocusTrack
//
//  Created by Arman on 21/4/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFIeldText: String = ""
    
    @State var alerTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ScrollView{
            VStack {
                TextField("Type something here... ", text: $textFIeldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                Button(action: {
                    saveButtoPressed()
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding(14)
            
        }.navigationTitle("Add an item 🖊")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func getAlert() -> Alert
    {
        return Alert(title: Text(alerTitle))
    }
    func saveButtoPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFIeldText)
            presentationMode.wrappedValue.dismiss()
        }
         
        
         
    }
    
    func textIsAppropriate() -> Bool {
        if textFIeldText.count < 3
        {
            alerTitle = "Must be more than 3 characters"
            showAlert.toggle()
            return false
        }
        return true
        
    }
}

#Preview {
    NavigationView(){
        AddView()
    }
    .environmentObject(ListViewModel())
    
}
