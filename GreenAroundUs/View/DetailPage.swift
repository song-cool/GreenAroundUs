//
//  DetailPage.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/03.
//

import SwiftUI

struct DetailPage: View {
    
    //spotList 에서 정보를 받아옴.
    var showingSpotName : String
    let showingTree : PosTree
    
    @State var showingTreeInfo : TreeSpecies  = defualtTreeSpecies // = treebook[showingTree!.species] ?? defualtTreeSpecies
    
    var body: some View {
        GeometryReader { geometry in
            ZStack( alignment:.topLeading){
                //이미지 영역 뒤에 깔리는 부분. / 위치도 여기임!
                VStack(spacing: 0){
                    ZStack( alignment:.topLeading){
                        Image("treeSample")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.width)
                            .clipped()
                        
                        Text("\(Image(systemName: "location.fill")) \(showingTree.locationDetail)")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .frame( height: 24)
                            .background(.white)
                            .clipShape(Capsule())
                            .padding(.leading)
                            .padding(.top)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    
                    Color(.gray)
                    Color(.white)
                }
                
                //정보가 담기는 부분.
                ScrollView{
                    VStack(spacing: 0){
                        Spacer()// 위에 옵셋 대신에 사용.
                            .padding(.top, geometry.size.width - 24 )
                        
                            
                            VStack(alignment: .leading, spacing: 0){
                                
                                // > 위에 스크롤 인디케이터
                                HStack{
                                    Spacer()
                                    RoundedRectangle (cornerRadius: 3)
                                        .frame(width: 60, height: 5)
                                        .foregroundColor(.gray)
                                        .padding(.top, 8)
                                    Spacer()
                                }
                                .padding(.bottom, 24)
                                
                                
                                // > 기본설명
                                Group{
                                    HStack{
                                        Text(showingTreeInfo.name)
                                            .font( .headline)
                                        Text(showingTreeInfo.scientificName)
                                            .font( .caption2)
                                    }
                                    Spacer()
                                        .frame(height: 8)
                                    Text(showingTreeInfo.detail)
                                    Spacer()
                                        .frame(height: 16)
                                    Link ("자세한 정보", destination: URL(string: showingTreeInfo.link)!)
                                    Spacer() // 자세한 설명 뒤에 여백
                                        .frame(height: 50)
                                }
                                .padding(.horizontal)
                                
                                
                                // > 이 나무의 감상 포인트
                                VStack(alignment: .leading){
                                    Spacer()
                                        .frame( height: 50)
                                    HStack{
                                    Text("+ 이 나무의 감상 포인트")
                                        .font(.headline)
                                        Spacer()
                                    }
                                    Spacer()
                                        .frame(height: 24)
                                    Text(showingTree.coolPOV)
                                    Spacer()
                                        .frame(height: 50)
                                }
                                .padding( .horizontal, 30)
                                .frame(width: geometry.size.width)
                                .background( Color("BGgray") )
                                //조금 더 옅은 색으로 바꾸기.
                                .padding(.bottom, 50)
                                
                                
                                textGroup(headlineContent: "계절적 특징", bodyContent: showingTreeInfo.seasonal)
                                    .padding( .horizontal)
                                Spacer()
                                    .frame( height: 20)

                                
                                ScrollView (.horizontal , showsIndicators: false){
                                    HStack(spacing: 0){ //showingTreeInfo.seasonalDetail.count
                                        ForEach (0 ..< 4) { idx in
                                            CircleImageItem(imgName: "treeSample", imgInfo: "가을의 잎")
                                        }
                                    }
                                }
                                .padding(.bottom, 50)
                                
                                textGroup(headlineContent: "은행나무의 이야기", bodyContent: showingTreeInfo.story)
                                    .padding( .horizontal)
                                Spacer()
                                    .frame(height: 80)
                                
                                
//                                Text("포스텍 내 다른 은행나무")
//                                    .font( .headline)
//                                    .padding(.bottom, 20)
//                                    .padding( .horizontal)
//
//                                MapView()
//                                    .frame(height: 300)
//                                    .clipped()

                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
            }
            .navigationBarTitle("").navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                showingTreeInfo = treebook[showingTree.species] ?? defualtTreeSpecies
                print(showingTreeInfo)
            }
        }
    }
}


struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct textGroup: View {
    var headlineContent : String
    var bodyContent : String
    
    var body: some View {
        Group{
            Text(headlineContent)
                .font( .headline)
                .padding(.bottom,8)
            Text(bodyContent)
        }
    }
}

struct CircleImageItem: View {
    
    let imgName : String
    let imgInfo : String
    
    var body: some View {
        VStack{
            Image(imgName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:90, height: 90)
                .clipShape(Circle())
            
            
            Text(imgInfo)
                .font(.caption)
        }
        .padding(.leading, 16)
    }
}
