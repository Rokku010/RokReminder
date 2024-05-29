//
//  ContentView.swift
//  RokReminder
//
//  Created by Quốc Lộc on 27/05/2024.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @FetchRequest(sortDescriptors: [])
    private var myListResults: FetchedResults<MyList>
    
    @State private var isPresented : Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                MyListsView(myLists: myListResults)
                
                Spacer()
                    
                Button{
                    isPresented = true
                }label: {
                    Text("Add List")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.headline)
                }.padding()
            }
            .sheet(isPresented: $isPresented){
                NavigationView{
                    AddNewListView{ name, color in
                        // save the list to the database
                        do{
                            try ReminderService.saveMyList(name, color)
                        } catch{
                            print(error)
                        }
                    }
                }
            }
        }
        .padding()
    }
}
#Preview {
    HomeView()
        .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
}

