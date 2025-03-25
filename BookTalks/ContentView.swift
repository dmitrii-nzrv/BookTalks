//
//  ContentView.swift
//  BookTalks
//
//  Created by Dmitrii Nazarov on 17.03.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = EpisodesViewModel()
    @State private var searchText = ""
    @State private var selectedCategory: PodcastCategory = .all
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // MARK: - Discover Tab
            NavigationView {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 20) {
                        // Search Bar
                        SearchBarView(searchText: $searchText)
                        
                        // Categories
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(PodcastCategory.allCases, id: \.self) { category in
                                    Button(action: { selectedCategory = category }) {
                                        Text(category.rawValue)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 8)
                                            .background(selectedCategory == category ? Color.white.opacity(0.1) : Color.clear)
                                            .foregroundColor(selectedCategory == category ? .white : .gray)
                                            .cornerRadius(20)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        ScrollView {
                            VStack(alignment: .leading, spacing: 20) {
                                // Trending Section
                                Text("Trending")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                
                                // Grid of Episodes
                                LazyVGrid(columns: [
                                    GridItem(.flexible(), spacing: 16),
                                    GridItem(.flexible(), spacing: 16)
                                ], spacing: 16) {
                                    ForEach(viewModel.episodes) { episode in
                                        EpisodeCardView(
                                            episode: episode,
                                            onTap: {
                                                // Handle episode selection
                                            }
                                        )
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .navigationTitle("Podkes")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.white)
                    },
                    trailing: Button(action: {}) {
                        Image(systemName: "bell")
                            .foregroundColor(.white)
                    }
                )
                .onAppear {
                    viewModel.fetchEpisodes()
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Discover")
            }
            .tag(0)
            
            // MARK: - Favorites Tab
            NavigationView {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 16) {
                            ForEach(viewModel.episodes.filter { $0.likes > 0 }) { episode in
                                EpisodeCardView(
                                    episode: episode,
                                    onTap: {
                                        // Handle episode selection
                                    }
                                )
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Favorite")
            }
            .tag(1)
            
            // MARK: - Profile Tab
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            .tag(2)
        }
        .preferredColorScheme(.dark)
        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
