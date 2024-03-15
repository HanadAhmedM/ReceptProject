//
//  NewSearchView.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-06.
//

import SwiftUI

struct NewSearchView: View {
    
    
    @ObservedObject var fr = FavoriteViewModel()
    @ObservedObject var mp = MealPlanViewModel()
    @State private var showFavAlert = false
    @State private var showPlanAlert = false
    @State private var showAlert = false
    @State var searchingKey: String = ""
    @ObservedObject var vm = SearchViewModel()
    @State var items: [String: String] = [:]
    @State private var showDaySelection = false
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Let's Cook\nsomething delicious")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.green)
                    .padding(.top, 25)
                    .padding(.bottom, 25)
                    .multilineTextAlignment(.center)
                    .lineSpacing(6.0)
                HStack {
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
                            .frame(width: 10, height: 10)
                            .padding()
                            .background(.gray)
                            .foregroundStyle(.white)
                            .cornerRadius(8.0)
                            .foregroundColor(searchingKey.isEmpty ? .gray : .white) // Change color based on condition
                    })
                    .padding(.trailing, -10)
                    
                    NavigationLink(destination: {
                        FilterView(items: $items)
                    }, label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .frame(width: 10, height: 10)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8.0)
                            .foregroundColor(.white)
                            .padding()
                    })
                }
                
                
                List(vm.currentRecepies, id: \.id) { recepie in
                    HStack {
                        AsyncImage(url: URL(string: recepie.image), scale: 2.5)
                            .cornerRadius(10)
                            .onTapGesture {
                                // Handle tap on recipe image if needed
                            }
                        
                        VStack {
                            HStack {
                                Spacer().frame(width: 25) // Fixed width for consistent spacing
                                Text(recepie.title)
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundStyle(.green)
                                    .padding(.trailing, 18) // Adjust padding here
                                Spacer()
                                
                                
                                
                                //  Heart button
                                Button(action: {
                                    if fr.recipes.contains(where: { $0.id == recepie.id }) {
                                        showFavAlert = true
                                    } else {
                                        fr.addRecipe(id: recepie.id, title: recepie.title, image: recepie.image)
                                    }
                                }) {
                                    Image(systemName: "heart\(fr.recipes.contains(where: { $0.id == recepie.id }) ? ".fill" : "")")
                                        .foregroundColor(fr.recipes.contains(where: { $0.id == recepie.id }) ? .green : .green)
                                }
                                .padding(.trailing, -5)
                                .gesture(
                                    TapGesture()
                                        .onEnded { _ in
                                            if fr.recipes.contains(where: { $0.id == recepie.id }) {
                                                showFavAlert = true
                                            } else {
                                                fr.addRecipe(id: recepie.id, title: recepie.title, image: recepie.image)
                                            }
                                        }
                                )
                                .alert(isPresented: $showFavAlert) {
                                    Alert(
                                        title: Text("Recipe Already Chosen for Favorites"),
                                        message: Text("You have already chosen this recipe for favorites."),
                                        dismissButton: .default(Text("OK"))
                                    )
                                }
                                
                                // Plus Button
                                Button(action: {
                                    if mp.recipes.contains(where: { $0.id == recepie.id }) {
                                        showPlanAlert = true
                                    } else {
                                        mp.addRecipe(id: recepie.id, title: recepie.title, image: recepie.image)
                                        showDaySelection = true
                                    }
                                }) {
                                    Image(systemName: "plus.circle\(mp.recipes.contains(where: { $0.id == recepie.id }) ? ".fill" : "")")
                                        .foregroundColor(mp.recipes.contains(where: { $0.id == recepie.id }) ? .green : .green)
                                }
                                .padding(.leading, 5)
                                .gesture(
                                    TapGesture()
                                        .onEnded { _ in
                                            if mp.recipes.contains(where: { $0.id == recepie.id }) {
                                                showPlanAlert = true
                                            } else {
                                                mp.addRecipe(id: recepie.id, title: recepie.title, image: recepie.image)
                                                showDaySelection = true // Show DaySelectionView when adding a recipe
                                            }
                                        }
                                )
                                .padding(.trailing, -10)
                                .alert(isPresented: $showPlanAlert) {
                                    Alert(
                                        title: Text("Recipe Already Chosen for Meal Plan"),
                                        message: Text("You have already chosen this recipe for meal plan."),
                                        dismissButton: .default(Text("OK"))
                                    )
                                }
                                
                                
                            }
                            .frame(width: 170, height: 100, alignment: .leading)
                        }
                    }
                    .sheet(isPresented: $showDaySelection, content: {
                        DaySelectionView(selectedDate: $selectedDate, onCancel: {
                            showDaySelection = false
                        }, onSave: {
                            // Implementera spara-logik här om du vill göra något när användaren sparar
                            showDaySelection = false
                        })
                    })
                }
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
