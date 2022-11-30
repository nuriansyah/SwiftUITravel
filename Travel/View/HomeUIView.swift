//
//  HomeUIView.swift
//  Travel
//
//  Created by Nuriansyah Malik on 30/11/22.
//

import SwiftUI

struct HomeUIView: View {
    @State private var isSHowingDetailSheet: Bool = false
    @State private var showWebView: Bool = false
    
    var body: some View {
        ZStack{
            Image("go-to-beach")
                .resizable()
                .overlay{
                    Color.black
                        .opacity(0.4)
                }
                .ignoresSafeArea()
            VStack{
                HStack{
                    cloudsView
                        .fullScreenCover(isPresented: $showWebView) {
                            WebView(url: URL(string: "https://hidayatabisena.com")!)
                        }
                    Spacer()
                    headerView
                    Spacer()
                    cartView
                        .onTapGesture {
                            isSHowingDetailSheet.toggle()
                        }
                        .sheet(isPresented: $isSHowingDetailSheet){
                            VStack{
                                CartDetailShowingView()
                                    .presentationDetents([.medium, .large])
                                
                                .presentationDragIndicator(.visible)
                            }
                            .padding()
                        }
                    
                }// MARK: HSTack
                
                bodyView
                    .padding(.top,60)
                Spacer()
            }// MARK: VSTack
            .padding(.horizontal)
        }// MARK: ZSTack
    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}

extension HomeUIView {
    private var cloudsView: some View{
        Button {
            showWebView = true
        } label: {
            HStack {
                Color.primary
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .opacity(0.6)
                    .overlay{
                        Image(systemName: "cloud.sun.fill"
                              )
                        .symbolRenderingMode(.multicolor)
                        .foregroundColor(.white)
                        .scaledToFit()
                        .padding(10)
                    }
            }
            
        }
        .fullScreenCover(isPresented: $showWebView) {
            WebView(url: URL(string: "https://www.google.com/search?q=google+cuaca&oq=google+cuaca&aqs=chrome..69i57j69i64.10674j0j1&sourceid=chrome&ie=UTF-8")!)
        }
    }
    private var headerView: some View{
        Text("Travel")
            .foregroundColor(.white)
    }
    private var cartView: some View{
        Color.primary
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .opacity(0.6)
            .overlay{
                Image(systemName: "cart.badge.plus"
                      )
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.white)
                .scaledToFit()
                .padding(10)
            }
    }
    private var bodyView: some View{
        VStack(alignment: .leading, spacing: 20) {
            Text("Start Your \nAdventure \nand GO \nTravel Now")
                .foregroundColor(.white)
                .font(.largeTitle)
            .fontWeight(.heavy)
            Text("Discover local destination beauty with bluseky and travel with pride")
                .foregroundColor(.white)
                
                
        }
        .padding(.leading, 40)
    }
}
