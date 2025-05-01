//
//  ListView.swift
//  FocusTrack
//
//  Created by Arman on 21/4/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    
     
    var body: some View {
        List{
            ForEach(listViewModel.items)
            { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear)
                        {
                            listViewModel.updateItem(item: item)
                        }
                    }
                //item in ListRowView(title: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            
        }.listStyle(PlainListStyle())
        .navigationTitle("Focus Track ✅")
        .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView())  )
    }
    
}

#Preview {
    NavigationView()
    {
        ListView()
    }
    .environmentObject(ListViewModel())
    
}


