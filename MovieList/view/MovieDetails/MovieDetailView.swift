
import Foundation
import SwiftUI

struct MovieDetailView: View {

    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    let movie: Movie
    let headerHeight: CGFloat = 400

    var body: some View {
        ZStack {
            Color(red: 14.0/255, green: 61.0/255, blue: 149.0/255)
                .ignoresSafeArea()

            GeometryReader { geo in
                VStack {
                    AsyncImage(url: movie.backdropURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geo.size.width, maxHeight: headerHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
            }

            ScrollView {
                VStack(spacing: 12) {
                    Spacer()
                        .frame(height: headerHeight)
                    HStack {
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)

                        Spacer()
                    }

                    HStack {

                    }

                    HStack {
                        Text("About film")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Spacer()
                    }

                    Text(movie.overview)
                        .lineLimit(4)
                        .foregroundColor(.white)


                    HStack {
                        Text("Cast & Crew")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Spacer()
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(model.castProfiles) { cast in
                                CastView(cast: cast)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

            }
            .padding(.leading)
        }
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await model.movieCredits(for: movie.id)
            await model.loadCastProfiles()
        }
    }

}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}
