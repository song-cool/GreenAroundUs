//
//  WalkPage.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/02.
//

import SwiftUI

struct WalkPage: View {
    
    @State var currentPageIndex: CGFloat = 0
    let cardWidth: CGFloat  = 320
    
    var body: some View {
       
        ZStack(alignment: .bottom){
                MapView()
                .clipped()
                .frame(width: UIScreen.main.bounds.width)

            HStack(alignment: .center, spacing: 16) {
                ForEach( trailList, id:\.self ){
                    trail in
                            

                                VStack(alignment: .leading){
                                    HStack{
                                        NavigationLink(destination: WalkAroundPage()) {
                                        VStack(alignment: .leading, spacing: 0){
                                            Text(trail.name)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Text("\( String(format: "%.1f", trail.distance))km (약 \( String(format: "%.0f",round(trail.distance / 0.067)) )분 소요)")// 0.067km/min
                                                .font(.footnote)
                                        }
                                        Spacer()
                                            Text("\(Image(systemName: "chevron.right"))")
                                        }
                                    }
                                    Divider()
                                    Text(trail.info)
                                        .lineLimit(3)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 24)
                                    
                                    Text("이팝나무 아카시나무 자작나무 가이츠카 향나무...")
                                        .font(.caption)
                                }
                                .frame(width: 280)
                                .padding( 20 )
                                .background(.white)
                                
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(color: .black.opacity(0.25), radius: 3, x: 0, y: 3)
                   
                            
                        }
                    }
            .padding(.bottom, 30)
            .modifier(ScrollingHStackModifier(items: trailList.count, itemWidth: cardWidth, itemSpacing: 16, currentPageIndex: $currentPageIndex))
        }
    }
}



struct WalkPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
