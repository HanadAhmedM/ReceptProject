//
//  NewSearchView.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-06.
//

import SwiftUI

struct NewSearchView: View {
    @State var searchingKey: String = ""
    @ObservedObject var vm = SearchViewModel()
    var body: some View {
        ZStack{
            VStack{
                Text("Let's Cook something delicious")
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                HStack{
                    TextField("Search recipe...", text: $searchingKey)
                        .background(Color.white)
                        .foregroundColor(Color(hex: 0xBFBFBF))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        if(!searchingKey.isEmpty){
                            vm.getRecepies(theItems: ["query": searchingKey])
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .padding()
                            .background(.gray)
                            .foregroundStyle(.white)
                            .cornerRadius(8.0)
                    })
                    
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8.0)
                }
                ScrollView(content: {
                    VStack(alignment: .leading){
                        ForEach(vm.currentRecepies){recepie in
                            HStack(){
                                AsyncImage(url: URL(string: recepie.image), scale: 2)
                                        .background(.green)
                                        .border(width: 3, edges: [.trailing], color: Color.green)

                                VStack(){
                                    HStack(){
                                        Spacer()
                                        Image(systemName: "heart")
                                            .foregroundStyle(.green)
                                    }
                                    .padding(10)
                                    Text(recepie.title)
                                    Spacer()
                                }
                            }
                            .frame(width: 350, height: 120, alignment: .center)
                            .border(width: 3, edges: [.top, .bottom, .trailing, .leading], color: .green)
                            .padding([.bottom], 20)
                           
                        }
                    }
                })
            }
        }
    }
}

struct EdgeBorder: Shape {//idk got it from the internet it fixes so that you can have borders in different places
    var width: CGFloat
    var edges: [Edge]
    func path(in rect: CGRect) -> Path {
        edges.map { edge -> Path in
            switch edge {
            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
            }
        }.reduce(into: Path()) { $0.addPath($1) }
    }
}

extension View {//idk got it from the internet it fixes so that you can have borders in different places
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
#Preview {
    NewSearchView()
}
