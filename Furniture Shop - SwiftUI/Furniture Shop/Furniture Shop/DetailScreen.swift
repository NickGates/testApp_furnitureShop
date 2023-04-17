//
//  DetailScreen.swift
//  Furniture Shop
//
//  Created by Nikita on 15.04.2023.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea(.all)
            
            ScrollView {
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                
                DecriptionView()
                    .offset(y: -60)
                    .padding(.vertical)
            }
            .edgesIgnoringSafeArea(.top)
            

            HStack {
                Text("$1299")
                    .font(.title)
                
                Spacer()
                
                Button(action: {}) {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10.0)
                }
                
            }
            .padding()
            .padding(.horizontal)
            .background(.brown)
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image(systemName: "poweroutlet.type.l")
        )
       
    }
    
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}




struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct DecriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Luxury Swedian \nChair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 4) {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.7)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. It carries on the simplicity and honestly ot the archetypical chair")
                .lineSpacing(8.0)
                .opacity(0.8)
            
            HStack (alignment: .top){
                VStack (alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Height: 120 cm")
                        .opacity(0.8)
                    Text("Wide: 80 cm")
                        .opacity(0.8)
                    Text("Diameter: 72 cm")
                        .opacity(0.8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack (alignment: .leading ) {
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Jati wood, Canvas, \nAmazing Love")
                        .opacity(0.8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack (alignment: .bottom) {
                VStack (alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: .brown)
                    }
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Quantity")
                        .fontWeight(.semibold)
                    
                    HStack {
                        
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                    }
                    
                }
          
            }
            
            
            
            
        }
        .padding()
        .padding(.top)
        .background(.gray)
        .cornerRadius(40.0)
    }
}


struct ColorDotView: View {
    let color:Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct CustomBackButtonView: View {
    let action: ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(.white)
                .cornerRadius(8.0)
        })
    }
}
