//
//  ContentView.swift
//  Day60_Challenge
//
//  Created by Griffin Davidson on 11/23/20.
//

import SwiftUI

struct Result: Codable {
     var results: [User]
}

struct User: Identifiable, Codable {
    let id: UUID
    var isActive: String
    var name: String
    var age: String
    var company: String
    var address: String
    var email: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friends]
}

struct Friends: Identifiable, Codable {
    var name: String
    let id: UUID
}

struct ContentView: View {
    
    @State var results = [User]()
    
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
                    
                    Text(employee.age)
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
                if let decoded = try? JSONDecoder().decode(Result.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decoded.results
                    }
                    
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
