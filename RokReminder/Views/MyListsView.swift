//
//  MyListsView.swift
//  RokReminder
//
//  Created by Quốc Lộc on 29/05/2024.
//

import SwiftUI

struct MyListsView: View {
    
    let myLists: FetchedResults<MyList>
    
    var body: some View {
        NavigationStack{
            if myLists.isEmpty{
                Spacer()
                Text("No reminder found")
            }else{
                ForEach(myLists){ myList in
                    VStack{
                        Text(myList.name)
                        MyListCellView(myList: myList)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding([.leading], 10)
                            .font(.title)
                        Divider()
                    }
                }
            }
                
        }
    }
}

