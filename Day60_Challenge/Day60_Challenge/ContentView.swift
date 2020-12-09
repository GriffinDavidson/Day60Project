//
//  ContentView.swift
//  Day60_Challenge
//
//  Created by Griffin Davidson on 11/23/20.
//

import SwiftUI

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
    var tags: [String]
    var friends: [Friends]
}

struct Friends: Identifiable, Codable {
    var name: String
    var id: UUID
}

struct ContentView: View {
    
    @State var results = [Users]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.id) { employee in
                NavigationLink(destination: DetailView(employee: employee)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(employee.name)
                                .font(.headline)
                            Text("\(employee.company) · \(employee.age)")
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        IsActiveView(isActive: employee.isActive)
                    }
                }
            }
            .onAppear(perform: loadDocument)
            .navigationBarTitle("People")
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
                        self.results = decoded
                    }
                } catch let error as NSError {
                    print("ERROR: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
