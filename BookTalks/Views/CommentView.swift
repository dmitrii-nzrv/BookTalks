import SwiftUI

struct CommentView: View {
    let episode: Episode
    let onSubmit: (String) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var commentText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Write a comment...", text: $commentText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                List(episode.comments) { comment in
                    VStack(alignment: .leading) {
                        Text(comment.text)
                            .font(.body)
                        Text(comment.author)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Comments")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Post") {
                    if !commentText.isEmpty {
                        onSubmit(commentText)
                        commentText = ""
                    }
                }
            )
        }
    }
} 