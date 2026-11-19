//
//  HeaderView.swift
//  Parcial4Practico2929712023
//
//  Created by DanielSosa on 18/11/26.
//
import SwiftUI

struct HeaderView: View {
    var studentName: String = "Nombre Alumno"
    var studentID: String = "CARNET"
    var showBackToMovies: Bool = false
    var onBackToMovies: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 6) {
            HStack(alignment: .center, spacing: 12) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)

                VStack(alignment: .leading, spacing: 2) {
                    Text("ETPS4")
                        .font(.title2.bold())
                    Text("Examen parcial 4")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(studentName)
                        .font(.subheadline.bold())
                    Text(studentID)
                        .font(.caption.bold())
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding(.horizontal)

            // Barra / menú inferior del encabezado
            HStack {
                if showBackToMovies {
                    Button(action: { onBackToMovies?() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Películas")
                        }
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    }
                } else {
                    Text("Menú: Películas")
                        .font(.subheadline.bold())
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(.systemGray5))
        }
        .background(Color(.systemBackground))
    }
}
