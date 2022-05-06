//
//  WalkAroundPage.swift
//  GreenAroundUs
//
//  Created by 송시원 on 2022/05/04.
//

import SwiftUI

struct WalkAroundPage: View {
    
    @State var showingSpotName = "동문 맞은편 오솔길"
    @State var showingTree : PosTree = defaultTree
    
    var body: some View {
        ZStack(alignment: .bottom){
            MapView()
            
            // 컨텐츠 구현.
            VStack(alignment: .leading, spacing: 0){
                
                Spacer().frame(height: 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0){
                        ForEach ( spotList[showingSpotName]?.tallTrees ?? [], id: \.self ) { tree in
                            
                            if(tree.isSpecial){
                                Button{
                                    showingTree = tree
                                    
                                } label: {
                                    CircleImageItem(imgName: "treeSample", imgInfo: tree.species)
                                }
                            }
                        }
                        ForEach ( spotList[showingSpotName]?.smallTrees ?? [defaultTree], id: \.self ) { tree in
                            
                            if(tree.isSpecial){
                                Button{
                                    showingTree = tree
                                    
                                } label: {
                                    CircleImageItem(imgName: "treeSample", imgInfo: tree.species)
                                }
                            }
                            
                        }
                        ForEach ( spotList[showingSpotName]?.grasses ?? [defaultTree], id: \.self ) { tree in
                            
                            if(tree.isSpecial){
                                Button{
                                    showingTree = tree
                                    
                                } label: {
                                    CircleImageItem(imgName: "treeSample", imgInfo: tree.species)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 16)
                
                
                Divider()
                    .padding(.bottom, 16)
                
                
                Group{
                    HStack{
                        Text("\(Image(systemName: "arrow.right")) \(showingTree.species)")
                            .font(.headline)
                        Spacer()
                        NavigationLink(destination: DetailPage(showingSpotName: showingSpotName, showingTree: showingTree)) {
                            Text("더보기")
                        }
                        .foregroundColor(.accentColor)
                        .disabled((showingTree == defaultTree) ? true : false)
                        
                    }
                    Text(showingTree.coolPOV)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                HStack{
                    Button {
                        
                    } label: {
                        Text("\(Image(systemName: "chevron.left"))")                    }
                    Spacer()
                    
                    Text("구간이름")
                        .fontWeight(.bold)
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("\(Image(systemName: "chevron.right"))")
                    }
                }
                .padding(.vertical,10)
                .padding(.horizontal, 20)
                .background(.white)
                
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                
                .padding(.vertical,8)
                .padding(.horizontal, 30)
                .background(Color("BGgray"))
                
                
                
            }
            .background(.white)
        }
        .navigationTitle("밥 먹으러 가는 길에는")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct WalkAroundPage_Previews: PreviewProvider {
    static var previews: some View {
        WalkAroundPage()
    }
}
