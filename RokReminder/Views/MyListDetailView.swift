//
//  MyListDetailView.swift
//  RokReminder
//
//  Created by Quốc Lộc on 30/05/2024.
//

import SwiftUI

struct MyListDetailView: View {
    
    let myList: MyList
    @State private var openAddReminder: Bool = false
    @State private var title: String = ""
    
    @FetchRequest(sortDescriptors: [])
    private var reminderResults: FetchedResults<Reminder>
    
    private var isFormValid: Bool{
        !title.isEmpty
    }
    
    init(myList: MyList) {
        self.myList = myList
        _reminderResults = FetchRequest(fetchRequest: ReminderService.getRemindersByList(myList: myList))

    }
    
    var body: some View {
        VStack{
            
            //display List Reminder
            ReminderListView(reminders: reminderResults)
            
            HStack{
                Image(systemName: "plus.circle.fill")
                Button("New Reminder"){
                    openAddReminder = true
                }
            }.foregroundColor(.blue)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
        }.alert("New Reminder", isPresented: $openAddReminder){
            TextField("", text: $title)
            Button("Cancel", role: .cancel){
                
            }
            Button("Done"){
                if isFormValid{
                    //Save reminder to My List
                    do{
                        try ReminderService.saveReminderToMyList(myList: myList, reminderTitle: title)
                    } catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    MyListDetailView(myList: PreviewData.myList)
}
