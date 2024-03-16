//
//  RecipeView.swift
//  ReceptProject
//
//  Created by Hanad.Ahmed on 2024-03-05.
//
import WebKit
import SwiftUI

struct RecipeView: View {
    @State var recept: ReceptFull = ReceptFull()
    var id: Int
    @State var changer = ""
    var body: some View {
        ZStack{
            Text(changer)
                .foregroundStyle(.clear)
            ScrollView(showsIndicators: false){
                VStack{
                    Text(recept.title)
                        .font(.largeTitle)
                        .foregroundStyle(.green)
                    AsyncImage(url: URL(string: recept.image))
                    HStack{
                        VStack{
                            Image(systemName: "dollarsign.circle.fill")
                                .foregroundStyle(.orange)
                            Text("$\(twoDeci(double: recept.pricePerServing))")
                        }
                        VStack{
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                            Text("\(recept.aggregateLikes) likes")
                        }
                        VStack{
                            Image(systemName: "clock.fill")
                                .foregroundStyle(.purple)
                            Text("ready in \(recept.readyInMinutes)")
                        }
                        VStack{
                            Image(systemName: "speedometer")
                                .foregroundStyle(.yellow)
                            Text("spoonacular \nScore: \(twoDeci(double: recept.spoonacularScore))")
                        }
                    }
                    
                    Text(htmlToPlainText(htmlString: recept.summary))
                        .onTapGesture {
                            print(recept.summary)
                        }
                        .background(.yellow)
                        .padding(8)
                        .background(.green)
                    IngredientsView(ingredients: recept.extendedIngredients)
                    Text(htmlToPlainText(htmlString: recept.instructions))
                        .onTapGesture {
                            print(recept.summary)
                        }
                        .background(.yellow)
                        .padding(8)
                        .background(.green)


                    Spacer()
                        .frame(height: 100)

                }
                .frame(width: 393)
            }
            .onAppear(perform: {
                print(id)
//                ApiService.shared.getRecepie(id: self.id, completion: {recept in
//                    self.recept = recept
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){//p.ga syncnings problem behövde jag
//                        changer = "uIUpdgggate"
//                        
//                    }
//                })
                
            })
        }
        
    }
    func getRecept(){
        ApiService.shared.getRecepie(id: self.id, completion: {recept in
            self.recept = recept
        })
    }
    func twoDeci(double: Double) -> String{// because the doubles in recept had too many 
        return String(format: "%.2f", double)
    }
    func htmlToPlainText(htmlString: String) -> String {//From the internet, quick fix to that summary and instructions are Html text(I think) so they had charachters like: <> in the text. With this the charachters go away but no effect of these charachters are acheived for some reason. like making som part of the text bold
        guard let data = htmlString.data(using: .utf8) else {
            return htmlString
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return htmlString
        }
        
        return attributedString.string
    }
}
struct IngredientsView: View {
    @State var showIng = false//variablen som bästemmer om ingrediencerna ska visas eller inte
    var ingredients: [extendedIngredient]
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Ingredients")
                Image(systemName: showIng ? "chevron.up" : "chevron.down")
                Spacer()
            }
            .padding()
            .background(.green)
            .border(width: 3, edges: [.top, .bottom], color: .black)
            .onTapGesture {
                showIng.toggle()
            }
            if showIng{
                ForEach(ingredients, id: \.name){ingredient in
                    IngredientView(ingredient: ingredient)
                }
            }
        }
    }
}
#Preview {
    RecipeView(id: 664959)
}
