//
//  ContentView.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/02.
//

import SwiftUI


struct ContentView: View {
    // 텝 상태
    @State var onTabTitle = ""
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        NavigationView{
            
            ZStack(alignment: .topLeading){
             
                
                TabView{
                    ExplorePage()
                        .tabItem {
                            Label("나무찾기", systemImage: "leaf")
                        }
                        .onAppear(){
                            onTabTitle = "탐색하기"
                        }
                    
                    WalkPage()
                        .tabItem {
                            Label("산책하기", systemImage: "figure.walk")
                        }
                        .onAppear(){
                            onTabTitle = "이달의 산책길"
//                            self.isNavigationBarHidden = true

                        }
                }
                .navigationBarTitle(onTabTitle)
                .ignoresSafeArea(.container, edges: [.top, .horizontal])
                .navigationBarHidden(self.isNavigationBarHidden)
                .onAppear{
                    self.isNavigationBarHidden = true
                }
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 0, y: 4)
                        .frame(height: 80)
                    HStack{
                        Text(onTabTitle)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .padding(.vertical)

                        
                        Spacer()
                    }
                    
                }
                
//                .background(.white)
           
                
            }
        }
        .accentColor(Color("Primary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
