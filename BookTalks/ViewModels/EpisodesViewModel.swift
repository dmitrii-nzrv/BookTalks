import Foundation
import SwiftUI

class EpisodesViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    func fetchEpisodes() {
        isLoading = true
        // TODO: Implement actual API call
        // For now, we'll use mock data
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.episodes = [
                Episode(
                    id: "1",
                    title: "The missing 96 percent of the universe",
                    description: "A fascinating journey into dark matter...",
                    author: "Claire Malone",
                    duration: "45:30",
                    imageURL: "claire_profile",
                    audioURL: "episode1_audio",
                    category: .tech,
                    backgroundColor: "#B44BC4",
                    likes: 120,
                    dislikes: 5,
                    comments: []
                ),
                Episode(
                    id: "2",
                    title: "How Dolly Parton led me to an epiphany",
                    description: "A story of inspiration...",
                    author: "Abumenyayang",
                    duration: "38:15",
                    imageURL: "dolly_profile",
                    audioURL: "episode2_audio",
                    category: .life,
                    backgroundColor: "#58B9E6",
                    likes: 85,
                    dislikes: 3,
                    comments: []
                ),
                Episode(
                    id: "3",
                    title: "The missing 96 percent of the universe",
                    description: "Another perspective on dark matter...",
                    author: "Tim McDohl",
                    duration: "42:20",
                    imageURL: "tim_profile",
                    audioURL: "episode3_audio",
                    category: .tech,
                    backgroundColor: "#E67758",
                    likes: 95,
                    dislikes: 4,
                    comments: []
                ),
                Episode(
                    id: "4",
                    title: "Ngobam with Denny Caknan",
                    description: "An entertaining conversation...",
                    author: "Denny Kulon",
                    duration: "35:45",
                    imageURL: "denny_profile",
                    audioURL: "episode4_audio",
                    category: .comedy,
                    backgroundColor: "#E6C758",
                    likes: 150,
                    dislikes: 8,
                    comments: []
                )
            ]
            self.isLoading = false
        }
    }
    
    func likeEpisode(_ episode: Episode) {
        if let index = episodes.firstIndex(where: { $0.id == episode.id }) {
            episodes[index].likes += 1
        }
    }
    
    func dislikeEpisode(_ episode: Episode) {
        if let index = episodes.firstIndex(where: { $0.id == episode.id }) {
            episodes[index].dislikes += 1
        }
    }
    
    func addComment(_ text: String, to episode: Episode) {
        if let index = episodes.firstIndex(where: { $0.id == episode.id }) {
            let newComment = Episode.Comment(
                id: UUID().uuidString,
                text: text,
                author: "User",
                timestamp: Date()
            )
            episodes[index].comments.append(newComment)
        }
    }
} 