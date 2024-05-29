//
//  AddNewListView.swift
//  RokReminder
//
//  Created by Quốc Lộc on 28/05/2024.
//

import SwiftUI

struct AddNewListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var selecedColor: Color = .yellow
    
    let onSave: (String, UIColor) -> Void
    
    private var isFromValid: Bool{
        !name.isEmpty
    }
    
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "line.3.horizontal.circle.fill")
                    .foregroundColor(selecedColor)
                    .font(.system(size: 100))
                TextField("List Name", text: $name)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(30)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            
            ColorPickerView(selectedColor: $selecedColor)
            
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("NEW LIST")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("CLOSE"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("DONE"){
                        //save the list
                        onSave(name,UIColor(selecedColor))
                        
                        dismiss()
                    }.disabled(!isFromValid)
                }
            }
    }
}

#Preview {
    NavigationView{
        AddNewListView(onSave: {(_, _) in})
    }
}
