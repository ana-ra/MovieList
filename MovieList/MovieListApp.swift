//
//  MovieListApp.swift
//  MovieList
//
//  Created by Silvana Rodrigues Alves on 04/02/24.
//
import SwiftUI

@main
struct MovieLookupApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .tabItem {
                        Image(systemName: "popcorn")
                    }
                Text("Favs")
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
                Text("tickets")
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                    }
            }
        }
    }
}
