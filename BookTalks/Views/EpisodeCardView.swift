import SwiftUI

struct EpisodeCardView: View {
    let episode: Episode
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 8) {
                // Episode Image
                Image(episode.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 160)
                    .clipped()
                    .cornerRadius(20)
                    .background(
                        Color(episode.backgroundColor)
                    )
                
                // Title and Author
                Text(episode.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text(episode.author)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(width: 160)
        }
    }
} 