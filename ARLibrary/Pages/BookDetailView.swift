//
//  BookDetailView.swift
//  ARLibrary
//
//  Created by 王姝洋 on 11/22/23.
//

import SwiftUI
import Foundation


struct BookDetailView: View {
    @State private var isExpanded = false
    let book: Book
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Text(book.name)
                    .font(.custom("Helvetica-Bold", size: 20))
                    .bold()
                    .padding(.bottom,10) // Add bottom spacing
                
                Text("By "+book.author)
                    .font(.custom("Inria Serif", size: 14))
                    .foregroundColor(.black)
                    .padding(.bottom,10)
                
                AsyncImage(url: URL(string: book.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 70, height: 440, alignment: .center) // Align the image to the leading edge
                        .cornerRadius(10)
                        
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width - 70, height: 440, alignment: .center) // Align the placeholder to the leading edge
                }
                Text("Book Description")
                    .font(.custom("Helvetica-Bold", size: 20))
                    .bold()
                    .padding(.vertical, 10) // Add vertical padding
//                    .padding(.horizontal,20)
                
                VStack(alignment: .leading, spacing: 10) {
                        Text(book.description)
                            .font(.custom("Inria Serif", size: 14))
                            .foregroundColor(.black)
                            .lineLimit(isExpanded ? nil : 3) // 
                            .truncationMode(.tail)
                        
                    if !isExpanded {
                                Button(action: {
                                    isExpanded.toggle()
                                }) {
                                    Text("Read More")
                                        .font(.custom("Inria Serif", size: 14))
                                        .foregroundColor(.blue)
                                }
                            } else {
                                Button(action: {
                                    isExpanded.toggle()
                                }) {
                                    Text("Collapse")
                                        .font(.custom("Inria Serif", size: 14))
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .padding(.bottom, 10)
                    
            }
      
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,40)
        }
    }
}
struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookDetailView(book: Book(name: "The tail", imageUrl: "https://i.ibb.co/XVR1HqH/image-28.png",author:"Yukio Mishima",          description: "This captivating novel takes readers on a thrilling journey through the enchanting world of magic and mystery. Set in a quaint village nestled in the misty mountains, the story follows the extraordinary adventures of a young protagonist named Emily. With her boundless curiosity and unwavering determination, Emily uncovers a hidden portal that leads to a parallel realm filled with mythical creatures and ancient secrets."
                                      
                                     ))
        }
    }
}

