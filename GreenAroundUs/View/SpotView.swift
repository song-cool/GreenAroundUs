//
//  SpotView.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/02.
//

import SwiftUI

struct SpotView: View {
    
    @State var showingSpotName = "동문 맞은편 오솔길"

    @State private var sortTree : Int = 1
    
    var body: some View {
        
        VStack{
            //상단 타이틀, 네비게이션 뷰에서 사실 그려야하는데,,,??
            //                ZStack{
            //                    Color(.white)
            //                        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
            //
            //
            //                    Text("C5 앞 보도")
            //                        .font(.largeTitle)
            //                        .fontWeight(.bold)
            //                }
            //                .frame(height: 200)
            
            MapView()
            
            VStack(alignment:.leading, spacing: 0){
             
                listedGridView(sortTree: $sortTree, treeClass: "교목", treeClassDetail: "큰키나무", treeList: spotList[showingSpotName]!.tallTrees, viewIdx: 1, showingSpotName: showingSpotName)
                listedGridView(sortTree: $sortTree, treeClass: "관목",treeClassDetail: "작은키나무", treeList:  spotList[showingSpotName]!.smallTrees, viewIdx: 2, showingSpotName: showingSpotName)
                listedGridView(sortTree: $sortTree, treeClass: "초본",treeClassDetail: "키큰나무", treeList:  spotList[showingSpotName]!.grasses, viewIdx: 3, showingSpotName: showingSpotName)
//                Spacer()
            }
//            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
            .background(.white)

        }
        .navigationTitle(showingSpotName)
        .navigationViewStyle(.columns)
//        .navigationBarItems(
//            trailing: Button("완료") {
//                self.profileState.toggle()
//                self.presentation.wrappedValue.dismiss()
//            })
        .onAppear(){
//            UINavigationBar.UINavigationBarAppearance.TitleTextAttributes(shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2))
        }
    }
}


struct listedGridView: View {
    

    @Binding var sortTree : Int
    let treeClass: String
    let treeClassDetail: String
    let treeList: [PosTree]
    let viewIdx : Int
    let showingSpotName : String
    
    var body: some View {
        
        
        //타이틀 부분 선택뷰로 바꿀까?
        HStack{
            Text("\(treeClass)")
                .font(.headline)
            
            Text("\(treeClassDetail)")
                .font(.body)
            Spacer()
            Text("2")
            Text("\(Image(systemName: "chevron.backward"))")
        }
        .padding(.horizontal)
        .padding(.vertical, 20)
        .onTapGesture {
            print("누름누름")
            
            if( sortTree == viewIdx){
                sortTree = -1
            } else{
                sortTree = viewIdx
                
            }
        }
        
        // 나무선택기 뷰
        if(sortTree==viewIdx){
            
            ScrollView(.horizontal, showsIndicators: false ){
                
                HStack{
                    ForEach (treeList) { tree in
                        NavigationLink(destination: DetailPage(showingSpotName: showingSpotName, showingTree: tree )) {
                            VStack(alignment:.leading){
                                Image(tree.img)
                                    .resizable()
                                    .frame(width: 157, height: 157)
                                Text(tree.species)
                                    .font(.headline)
                                Text(tree.locationDetail)
                                    .font(.caption)

                            }
                            .frame(width: 157)
                        }
                    }
                }
                .padding(.leading)
                .padding(.bottom, 20)
            }
        }
        //            .withAnimation(<#T##SwiftUI.Animation?#>, <#T##() -> Result#>)
        
    }
}

struct SpotView_Previews: PreviewProvider {
    static var previews: some View {
        SpotView()
        ContentView()
    }
}
