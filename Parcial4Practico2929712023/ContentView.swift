//
//  ContentView.swift
//  Parcial4Practico2929712023
//
//  Created by DanielSosa on 18/11/26.
//

import SwiftUI

struct MoviePosterThumbnail: View {
    let urlString: String

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 56, height: 76)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 76)
                    .clipped()
                    .cornerRadius(6)
            case .failure:
                Image(systemName: "film")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .frame(width: 56, height: 76)
                    .background(Color(.systemGray6))
                    .cornerRadius(6)
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct ContentView: View {
    @State private var movies: [Movie] = MovieLoader.loadMovies()
    @State private var selectedTab: Int = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HeaderView(
                    studentName: "Carlos Daniel Castillo Sosa",
                    studentID: "29-2971-2023",
                    showBackToMovies: false
                )

                if selectedTab == 0 {
                    List(movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            HStack(spacing: 12) {
                                MoviePosterThumbnail(urlString: movie.posterImage)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(movie.title)
                                        .font(.headline)
                                    HStack(spacing: 8) {
                                        Text(String(movie.year))
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(movie.genre)
                                            .font(.caption.bold())
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 2)
                                            .background(Color.blue.opacity(0.15))
                                            .foregroundColor(.blue)
                                            .cornerRadius(4)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(.plain)
                } else {
                    VStack(spacing: 12) {
                        Text("Total de películas cargadas: \(movies.count)")
                            .font(.headline)
                        Text("Examen Parcial 4 - ETPS4")
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }

                // Barra inferior solicitada
                HStack {
                    Button(action: { selectedTab = 0 }) {
                        VStack(spacing: 4) {
                            Image(systemName: "film.stack")
                            Text("Películas")
                                .font(.caption)
                        }
                        .foregroundColor(selectedTab == 0 ? .blue : .secondary)
                    }
                    .frame(maxWidth: .infinity)

                    Button(action: { selectedTab = 1 }) {
                        VStack(spacing: 4) {
                            Image(systemName: "info.circle")
                            Text("Resumen")
                                .font(.caption)
                        }
                        .foregroundColor(selectedTab == 1 ? .blue : .secondary)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 10)
                .background(Color(.systemGray6))
            }
            .navigationBarHidden(true)
        }
    }
}
