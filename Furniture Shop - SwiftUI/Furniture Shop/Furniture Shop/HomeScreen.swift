//
//  HomeScreen.swift
//  Furniture Shop
//
//  Created by Nikita on 15.04.2023.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        NavigationView() {
            ZStack {
                Color.gray.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categories.count) { i in
                                    CategoryView(isActive: i == selectedIndex , text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.title)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    NavigationLink(destination: DetailScreen(), label: {
                                        ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                                    })
                                  
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        Text("Best")
                            .font(.title)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        
                    }
                }
                
                HStack {
                    BottomNavBarItem(image: Image(systemName: "house")) {}
                    BottomNavBarItem(image: Image(systemName: "heart")) {}
                    BottomNavBarItem(image: Image(systemName: "cart")) {}
                    BottomNavBarItem(image: Image(systemName: "person")) {}
                }
                .padding()
                .background(.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: .black.opacity(0.20), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "text.line.first.and.arrowtriangle.forward")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            Button(action: {}) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 47, height: 47)
                    .foregroundColor(.white)
                    .cornerRadius(10.0)
            }
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest")
            .font(.title)
        + Text(" FURNITURE!")
            .font(.largeTitle)
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}) {
                Image(systemName: "qrcode.viewfinder")
                    .resizable()
                    .padding()
                    .foregroundColor(.black)
                    .scaledToFit()
                    .frame(width: 62, height: 62)
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? .black : Color.black.opacity(0.5))
            
            if (isActive) {
                Color(.black)
                    .frame(width: 16, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()->Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
            
        })
    }
}
