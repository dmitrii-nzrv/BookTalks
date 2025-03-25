import Foundation

enum PodcastCategory: String, CaseIterable {
    case all = "All"
    case life = "Life"
    case comedy = "Comedy"
    case tech = "Tech"
}

struct Episode: Identifiable {
    let id: String
    let title: String
    let description: String
    let author: String
    let duration: String
    let imageURL: String
    let audioURL: String
    let category: PodcastCategory
    let backgroundColor: String // For colorful cards
    var likes: Int
    var dislikes: Int
    var comments: [Comment]
    
    struct Comment: Identifiable {
        let id: String
        let text: String
        let author: String
        let timestamp: Date
    }
} 