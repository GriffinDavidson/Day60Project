//
//  FriendButton.swift
//  Day60_Challenge
//
//  Created by Griffin Davidson on 12/8/20.
//

import SwiftUI

struct FriendButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let employee: Users
    
    let lightSchemeFontColor: Color = Color(hue: 0, saturation: 0, brightness: 0.2)
    
    var body: some View {
        GeometryReader { geo in
            LazyVGrid(columns: [GridItem(.adaptive(minimum: geo.size.width/3, maximum: geo.size.width))]) {
                ForEach(employee.friends, id: \.id) { friend in
                    Button(friend.name) {
                        //Action here
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(colorScheme == .dark ? .primary : lightSchemeFontColor)
                    .padding(10)
                    .background(Color.gray.opacity(0.7))
                    .cornerRadius(7)
                }
            }
        }
    }
}

struct FriendButton_Previews: PreviewProvider {
    static var previews: some View {
        FriendButton(employee: Users(id: UUID(),
                                     isActive: true,
                                     name: "John Appleseed",
                                     age: 25,
                                     company: "Apple Inc.",
                                     address: "1 Apple Park Way",
                                     email: "johnapplesseed@apple.com",
                                     about: "This is the bio of John Appleseed",
                                     registered: "2015-11-10T01:47:18-00:00",
                                     tags: ["iOS", "macOS", "watchOS", "tvOS", "iPadOS"],
                                     friends: [Friends(name: "Jane Appleseed", id: UUID()), Friends(name: "Jane Appleseed", id: UUID()), Friends(name: "Jane Appleseed", id: UUID())]))
            .preferredColorScheme(.dark)
    }
}
