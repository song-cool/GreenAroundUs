//
//  ExplorePage.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/02.
//

import SwiftUI

struct ExplorePage: View {
    
    @State var selMode : Int = 0
    
    var body: some View {
            GeometryReader{ geometry in
                
                ZStack{
                    //코어그래픽스 뷰
                    MapView()
                    
//                    //버튼
//                     Button{
//                     // 모드변경
//                         selMode = (selMode == 1) ? 0 : 1
//                     }label: {
//                     ZStack{
//                     Circle()
//                             .fill(.yellow)
//                         Text("\(Image(systemName: "mappin.and.ellipse"))")
//                     }
//                     }.frame(width: 80, height: 80)
//                     .position(x: geometry.size.width-60, y: geometry.size.height-60)
                    
                    //네비게이션 링크로 작성한 부분.
                    NavigationLink(destination: SpotView()) {
                        ZStack{
                            Circle()
                                .fill(Color("Yellow01"))
                                .shadow(color: .black.opacity(0.25), radius: 3, x: 0, y: 3)
                            Text("\(Image(systemName: "mappin.and.ellipse"))")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
//                    .navigationBarTitle("둘러보기")
                    .navigationBarTitleDisplayMode(.large)
                    .frame(width: 80, height: 80)
                    .position(x: geometry.size.width-60, y: geometry.size.height-60)
                    
                }
            }
        
       
    }
}

struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ExplorePage()
        }
    }
}
