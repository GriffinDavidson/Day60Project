//
//  ContentView.swift
//  Day60_Challenge
//
//  Created by Griffin Davidson on 11/23/20.
//

import SwiftUI

struct Result: Codable {
     var results: [Users]
}

struct Users: Identifiable, Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var address: String
    var email: String
    var about: String
    var registered: String
}

struct ContentView: View {
    
    @State var results = [Users]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.id) { employee in
                HStack {
                    VStack(alignment: .leading) {
                        Text(employee.name)
                            .font(.headline)
                        Text(employee.company)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Text("\(employee.age)")
                }
            }
            .onAppear(perform: loadDocument)
            .navigationBarTitle("Day 60 Project")
        }
    }
    
    func loadDocument() {
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode([Users].self, from: data)
                    DispatchQueue.main.async {
                        do {
                            var user = try Users.self(from: JSONDecoder().self as! Decoder)
                            for decode in decoded {
                                user.about = decode.about
                                user.address = decode.address
                                user.age = decode.age
                                user.company = decode.company
                                user.email = decode.email
                                user.id = decode.id
                                user.isActive = decode.isActive
                                user.name = decode.name
                                user.registered = decode.registered
                                results.append(user)
                            }
                            results.insert(user, at: 0)
                        } catch let error as NSError {
                            print("ERROR 74: \(error.localizedDescription)")
                        }
                    }
                } catch let error as NSError {
                    print("ERROR 78: \(error.localizedDescription) \n\n\(error.userInfo) \n\n\(error) \n\nEND ERROR")
                }
            }
            print("Fetch Failed: \(error?.localizedDescription ?? "Unknown Error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
