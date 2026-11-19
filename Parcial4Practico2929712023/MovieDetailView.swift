//
//  MovieDetailView.swift
//  Parcial4Practico2929712023
//
//  Created by DanielSosa on 18/11/26.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                studentName: "Carlos Daniel Castillo Sosa",
                studentID: "29-2971-2023",
                showBackToMovies: true,
                onBackToMovies: { dismiss() }
            )

            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    AsyncImage(url: URL(string: movie.posterImage)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .frame(height: 280)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(maxHeight: 340)
                                .cornerRadius(8)
                        case .failure:
                            VStack(spacing: 8) {
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                Text("Imagen no disponible")
                                    .font(.caption)
                            }
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                            .frame(height: 220)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        @unknown default:
                            EmptyView()
                        }
                    }

                    Text(movie.title)
                        .font(.title.bold())

                    HStack(spacing: 12) {
                        Text(String(movie.year))
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text(movie.genre)
                            .font(.subheadline.bold())
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(6)

                        Spacer()

                        // Cantidad de estrellas según el campo "star" del JSON
                        HStack(spacing: 4) {
                            ForEach(0..<max(0, min(movie.star, 5)), id: \.self) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }

                    Text("Sinopsis")
                        .font(.headline)
                        .padding(.top, 4)

                    Text(movie.description)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}
