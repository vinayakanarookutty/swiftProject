import Foundation

// Renaming user to User for clarity
struct User: Codable, Identifiable {
    var id: String // Keep it as Int
    let name: String?
    let avatar: String?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatar
        case createdAt
    }
}
