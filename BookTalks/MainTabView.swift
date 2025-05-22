import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(white: 0.7, alpha: 1.0)
    }
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Browse")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            LibraryView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Library")
                }
            HistoryView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
        }
        .accentColor(.blue)
    }
}

struct BrowseView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Поиск + профиль
                    HStack {
                        TextField("Search", text: .constant(""))
                            .padding(12)
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Рекомендация
                    VStack(alignment: .center) {
                        Button(action: {}) {
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .foregroundColor(.blue)
                        }
                        Text("For your taste")
                            .font(.title2).bold()
                            .foregroundColor(.white)
                        Text("Playlist based on your preferences: History")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()

                    // Favorite shows
                    SectionHeader(title: "Favorite shows")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<5) { _ in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 100, height: 140)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Playlists of the day
                    SectionHeader(title: "Playlists of the day")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<3) { _ in
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 200, height: 120)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .background(Color.black.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            Button("More") {}
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .padding(.horizontal)
    }
}

struct SearchView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Search")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct LibraryView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Library")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

struct HistoryView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("History")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
} 