//
//  HomeView.swift
//  ARLibrary
//
//  Created by Brayton Lordianto on 12/7/22.
//

import SwiftUI

struct HomeView: View {

    let welcomeText = "Discover 3Dibner"
    let hiText = "Hi NYUer"
    let exploreText = "This app aims to produce a fully functioning augmented reality app to help NYU students access library resources in one place. \n\nExplore it NOW!"
    let descriptionText = "Tap on a button above to explore the library in Augmented Reality!"
    
    let torchGifName = "nyu_torch"
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Color("NYU_purple")
                        .frame(height: 64)
                    
                    WelcomeView()
                        .padding(.bottom, 1)
                        .padding(.horizontal, 30)
                    
                    HiView()
                        .padding(.bottom, 13)
                        .padding(.horizontal, 30)
                   
                    ExploreView()
                        .padding(.bottom, 15)
                        .padding(.horizontal, 25)
                    
//                    TorchGIFView()
//                        .offset(CGSize(width: -0, height: -11))

                    
                    // different styles to align the buttons
                    // FullButtonViews()
                    FullButtonViewsDouble()

                    DescriptionView()
                        .padding(.top, 10)
                        .padding(.horizontal, 50)
                    
                    Spacer()
                }
                .ignoresSafeArea()
            }
        }
    }
}

extension HomeView {
    
    func DescriptionView() -> some View {
        Text(descriptionText)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("NYU_purple"))
            .font(.custom("Helvetica", size: 14))
        
    }
    
    func HiView() -> some View {
        Text(hiText)
            .multilineTextAlignment(.leading)
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    func WelcomeView() -> some View {
        Text(welcomeText)
            .font(.custom("Helvetica-Bold", size: 20))
            .multilineTextAlignment(.leading)
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
//    func ExploreView() -> some View {
//        Text(exploreText)
//            .multilineTextAlignment(.leading)
//            .foregroundColor(textColor)
//    }
    func ExploreView() -> some View {
        Text(exploreText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .font(.custom("Inria Serif", size: 14))
            .foregroundColor(.black)
            .padding()
            .background(
            RoundedRectangle(cornerRadius: 18) // Apply rounded corners
                .fill(Color.gray.opacity(0.2)) // Set the background color to gray
        )
    }

    
    func TorchGIFView() -> some View {
        GIFView(type: URLType.name(torchGifName))
            .frame(height: 150)
    }
    
    func NavigationButtonView(item: ViewableSpaceItem) -> some View {
        NavigationLink {
            ARLibrary.DescriptionView(item: item)
                .ignoresSafeArea()
        } label: {
            HomeNavigationButton(item: item)
                .foregroundColor(.black)
                .padding(3)
        }
    }
    
    func FullButtonViews() -> some View {
        HStack {
            ForEach(presetViewableItems, id: \.self) {
                NavigationButtonView(item: $0)
            }
        }
    }
    
    func FullButtonViewsDouble() -> some View {
        VStack {
            ForEach(0..<2) { i in
                HStack {
                    // will have to change based on elements num
                    ForEach(0..<2) { j in
//                        Spacer()
                        NavigationButtonView(item: presetViewableItems[i + j*2])
//                        Spacer()
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
