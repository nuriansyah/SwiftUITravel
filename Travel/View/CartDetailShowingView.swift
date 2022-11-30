//
//  CartDetailShowingView.swift
//  Travel
//
//  Created by Nuriansyah Malik on 30/11/22.
//

import SwiftUI

struct CartDetailShowingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text("Pink Beach, Flores")
                    .font(.system(.title).bold())
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("4.8")
            }// MARK: HSTACK
            ScrollView(.horizontal , showsIndicators: false){
                HStack {
                    CategoryItemView(title: "Walk", icon: "figure.walk.motion", color: .green, bgColor: .gray)
                    CategoryItemView(title: "Food", icon: "fork.knife.circle.fill", color: .orange, bgColor: .gray)
                    CategoryItemView(title: "Stays", icon: "house.fill", color: .blue, bgColor: .gray)
                    CategoryItemView(title: "Ride", icon: "sailboat.fill", color: .purple, bgColor: .gray)
                }// MARK: HSTACK
            }// MARK: SCROLLVIEW
            Text("About Destinatiom")
                .font(.system(.subheadline).bold())
            Text("Pink Beach, or Pantai merah, as it aptly named, is one of seven pink beaches on the planet. This was Welcome")
            ButtonCartDetail()
        }// MARK: VSTACK
    }
}

struct CartDetailShowingView_Previews: PreviewProvider {
    static var previews: some View {
        CartDetailShowingView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct CategoryItemView: View {
    var title: String
    var icon: String
    var color: Color
    var bgColor: Color
    var body: some View {
        HStack(spacing:20){
            VStack{
                Image(systemName: icon)
                    .symbolRenderingMode(.monochrome)
                    .font(.system(size: 24))
                    .foregroundColor(color)
                Text(title)
                    
            }
        }//MARK: HStack
        .frame(width: 50,height: 50)
        .padding()
        .overlay(content: {
            Color.gray
                .opacity(0.2)
        })
        .cornerRadius(20)
    }
}

struct ButtonCartDetail: View {
    @State  var showAlert: Bool = false
    var body: some View {
        HStack{
            Text("$81,39")
                .font(.system(.title).bold())
            Spacer()
            Button {
                showAlert = true
            } label: {
                Label {
                    Text("Join Tour")
                        .fontWeight(.semibold)
                        .font(.title2)
                } icon: {
                    Image(systemName: "bag")
                        .font(.title)
                }
            }
            .padding()
            .foregroundColor(.white)
            .padding(.horizontal, 2)
            .background(
                LinearGradient(colors: [.purple, .accentColor], startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(40)
            .shadow(radius: 20)
            .alert("Not Yet Avaible",
                   isPresented: $showAlert) {
                Button {} label: {
                   Text("OK")
                }
            } message: {
                Text("Ccurrently on active development")
            }
        }
    }
}
