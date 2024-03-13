//
//  NewSearchView.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-06.
//

import SwiftUI

struct NewSearchView: View {
    
    @ObservedObject var fr = FavoriteViewModel()
    @State private var showAlert = false
    @State var searchingKey: String = ""
    @ObservedObject var vm = SearchViewModel()
    @State var items: [String: String] = [:]
    var body: some View {
        NavigationView{
            VStack{
                Text("Let's Cook\nsomething delicious")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.green)
                    .padding(.top, 25)
                    .multilineTextAlignment(.center)
                    .lineSpacing(6.0)
                HStack{
                    Spacer()
                    TextField("Search recipe...", text: $searchingKey)
                        .background(Color.white)
                        .foregroundColor(Color(hex: 0xBFBFBF))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        if(!searchingKey.isEmpty){
                            items.updateValue(searchingKey, forKey: "query")
                        }
                        vm.getRecepies(theItems: items)
                        print(items)
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .padding()
                            .background(.gray)
                            .foregroundStyle(.white)
                            .cornerRadius(8.0)
                    })
                    
                    .padding(.trailing, -10)

                    NavigationLink(destination: {
                        FilterView(items: $items)
                    }, label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8.0)
                            .padding()
                    })
                }
                
                ScrollView(content: {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(vm.currentRecepies){recepie in
                            HStack(){
                                AsyncImage(url: URL(string: recepie.image), scale: 2.5)
                                    .cornerRadius(10)
                                        .onTapGesture {
                                            
                                        }
                                VStack(){
                                    HStack(){
                                        Spacer()
                                        Button(action: {
                                            if fr.recipes.contains(where: { $0.id == recepie.id }) {
                                                showAlert = true
                                            } else {
                                                fr.addRecipe(id: recepie.id, title: recepie.title, image: recepie.image)
                                            }
                                        }) {
                                            Image(systemName: "heart")
                                                .foregroundStyle(.green)
                                                .cornerRadius(8.0)
                                        }
                                        .padding(.trailing, 15.0) //

                                        .alert(isPresented: $showAlert) {
                                            Alert(
                                                title: Text("Recipe Already Chosen"),
                                                message: Text("You have already chosen this recipe."),
                                                dismissButton: .default(Text("OK"))
                                            )
                                        }
                                        
                                        
                                    }
                                    
                                    HStack {
                                            Spacer().frame(width: 30) // Fixed width for consistent spacing
                                            Text(recepie.title)
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundStyle(.green)
                                                .padding(.trailing, 25.0) //
                                            Spacer()
                                        }
                                    
                        
                                }
                            }
                            
                            .frame(width: 350, height: 100, alignment: .leading)
                            
                           
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

struct NewSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NewSearchView()
    }
}
