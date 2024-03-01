//
//  BookRecommendationView.swift
//  ARLibrary
//
//  Created by Shuyang on 10/31/23.
//

import SwiftUI
import Foundation

struct Book: Identifiable {
    let id = UUID()
    let name: String
    let imageUrl: String
    let author: String
    let description: String
}

struct BookView: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: book.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 180)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(width: 120, height: 180)
            }
            
            GeometryReader { geometry in
                Text(book.name)
                    .font(.custom("Inria Serif", size: 14))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .frame(width: geometry.size.width)
            }
        }
    }
}


struct BookRecommendationView: View {
    
    @State private var searchBookName = ""
    @State private var isSubmitting = false
    
    var body: some View {
        NavigationView {
            VStack {
                Color("NYU_purple")
                    .frame(height: 64)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Explore")
                        .font(.custom("Helvetica-Bold", size: 20))
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        ZStack(alignment: .topLeading) {
                            if searchBookName.isEmpty {
                                Text("Search here")
                                    .foregroundColor(.gray)
                                    .font(.custom("Inria Serif", size: 14))
                                    .italic()
                                    .padding(.horizontal, 5)
                                    .padding(.vertical)
                            }
                            TextEditor(text: $searchBookName)
                                .frame(height: 50)
                                .padding(.horizontal, 5)
                                .cornerRadius(18)
                                .colorMultiply(Color.gray.opacity(0.6))
                        }
                        
                        Button(action: {
                            submitForm()
                        }) {
                            Text("Search")
                                .foregroundColor(.white)
                                .font(.custom("Inria Serif", size: 14))
                                .padding(.vertical, 15)
                                .frame(width: 55)
                                .background(Color("NYU_purple"))
                                .cornerRadius(10)
                        }
                        .disabled(isSubmitting)
                        .opacity(isSubmitting ? 0.5 : 1)
                    }
                    
                    
                    Text("Popular now")
                        .font(.custom("Helvetica-Bold", size: 20))
                        .bold()
                        .padding(.bottom, 5)

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(books, id: \.id) { book in
                                BookView(book: book)
                            }
                        }
                    }
                    .padding(.bottom, 5)

                    Text("Recommend for you")
                        .font(.custom("Helvetica-Bold", size: 20))
                        .bold()
                        .padding(.top, -70)

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(books, id: \.id) { book in
                                BookView(book: book)
                            }
                        }
                    }
                    .padding(.top, -40)
                    
                    
                }
                .padding()
                .navigationBarTitle("", displayMode: .inline)
             
            }
            .ignoresSafeArea()
        }
    }
    
    private func submitForm() {
        isSubmitting = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            searchBookName = ""
            isSubmitting = false
        }
    }
}
struct BookRecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookRecommendationView()
        }
    }
}
