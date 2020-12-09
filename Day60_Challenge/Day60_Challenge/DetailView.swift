//
//  DetailView.swift
//  Day60_Challenge
//
//  Created by Griffin Davidson on 12/7/20.
//

import SwiftUI

struct DetailView: View {
    
    let employee: Users
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                //MARK: Status
                
                HStack {
                    Text("Status")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    IsActiveView(isActive: employee.isActive)
                }.padding([.leading, .trailing, .top])
                
                Spacer(minLength: 25)
                
                //MARK: Buisness
                
                Section(header: Text("Buisness").font(.title).bold()) {
                    Text("· Company: \(employee.company)")
                    Text("· Registered: \(formattedDate(date: employee.registered))")
                    Text("· About: \(employee.about)")
                }.padding([.leading, .trailing])
                
                Spacer(minLength: 25)
                
                //MARK: Personal
                
                Section(header: Text("Personal").font(.title).bold()) {
                    Text("· Email: \(employee.email)")
                    Text("· Address: \(employee.address)")
                }.padding([.leading, .trailing])
                
                Spacer(minLength: 25)
                
                //MARK: Tags
                
                Section(header: Text("Tags").font(.title).bold()) {
                    ForEach(employee.tags, id: \.self) { tag in
                        Text("· \(tag)")
                    }
                }.padding([.leading, .trailing])
                
                Spacer(minLength: 25)
                
                //MARK: Friends
                
                Section(header: Text("Friends").font(.title).bold()) {
                    FriendButton(employee: employee)
                }.padding([.leading, .trailing])
                
                Spacer()

            }
            .navigationBarTitle("\(employee.name) · \(employee.age)", displayMode: .inline)
        }
    }
    
    func formattedDate(date: String) -> String {
        //Converts the string ISO8601 date to a exact date in English
        let dateFormatter = ISO8601DateFormatter()
        let explicitDate = dateFormatter.date(from: date)!
        
        // Then converts that specific date into a more user-friendly date
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: explicitDate)
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(employee: Users(id: UUID(),
                                   isActive: true,
                                   name: "John Doe",
                                   age: 25,
                                   company: "Apple Inc.",
                                   address: "1 Infinite Loop",
                                   email: "johnappleseed@apple.com",
                                   about: "enter bio here",
                                   registered: "2015-11-10T01:47:18-00:00",
                                   tags: ["Brilliant", "Funny"], friends: [Friends(name: "Jane Doe", id: UUID())]))
            .preferredColorScheme(.dark)
    }
}
