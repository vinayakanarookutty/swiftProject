import Foundation
class UserViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        let apiUrl = URL(string: "https://665b30b1003609eda4601b5e.mockapi.io/user/User")
        let dataTask = URLSession.shared.dataTask(with: apiUrl!) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }

            do {
                // Decode directly into an array of User objects
                let users = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.users = users
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        dataTask.resume()
    }
}
