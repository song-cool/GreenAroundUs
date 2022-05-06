//
//  MapView.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/02.
//

import SwiftUI
import CoreGraphics

struct MapView: View {
    
    //좌표변화값 저장 : translate
    //임시 좌표변화값 : offset
    @State private var translate: CGSize = CGSize(width: 0, height: 0)
    @State private var offset = CGSize.zero
    @State private var scale :CGFloat = 1
//    @State private var scaleDelta :CGFloat = 1


    //좌표점
    let coord : CGPoint = CGPoint(x: -1500, y: -300)
    

    
    
    
    var body: some View {
        ZStack{
            
            //지도부분
            Image("Map01")
                .position(x:  coord.x , y: coord.y )
                .offset(x: translate.width + offset.width, y: translate.height +  offset.height)
                .scaleEffect(scale)
                .gesture(
                    DragGesture()
                        .onChanged { guesture in
                            offset = guesture.translation
                            print(offset)
                        }
                        .onEnded { guesture in
                            translate = CGSize(width: guesture.translation.width + translate.width, height: guesture.translation.height + translate.height)
                            offset = CGSize.zero
                            print("End translate : \(translate)")
                            print("x: \(translate.width + coord.x + offset.width), y: \(translate.height + coord.y + offset.height)")
                        }
                
                )
                .gesture(
                    MagnificationGesture()
                        .onChanged { guesture in
                            print(guesture)
                            scale = guesture
                        }
                        .onEnded { guesture in
                            scale = guesture
                        }
                )
           
            
            Path { path in
                path.move(to: CGPoint(x: -120, y: 80))
                path.addLine(to: CGPoint(x: 70, y: 210))
                path.addLine(to: CGPoint(x: 140, y: 370))
                path.addLine(to: CGPoint(x: 220, y: 350))
//                path.closeSubpath()
            }
            .offset(x: translate.width + offset.width, y: translate.height +  offset.height)
            .stroke(Color("Yellow01"), lineWidth: 3 / scale) //같은 선두께 유지
            .scaleEffect(scale)

            
            
            VStack{
                Text("동문 맞은편 오솔길")
                    .font(.system(size: 11/scale))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Circle()
                    .frame(width:17/scale,height:17/scale)
                    .foregroundColor(Color("Green01"))
                
            }
            .position(x: -120 , y: 64)
            .offset(x: translate.width + offset.width, y: translate.height +  offset.height)
            .scaleEffect(scale)

            
            Text("+")
                .font(.largeTitle)
                .foregroundColor(Color("Primary"))
        }.clipped()
        
    }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
