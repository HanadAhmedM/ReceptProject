//
//  FilterView.swift
//  ReceptProject
//
//  Created by Abdulrahman.Alazrak on 2024-03-08.
//

import SwiftUI

struct FilterView: View {
    @Binding var items: [String: String]
    var type: [String] = ["main course", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup", "beverage", "sauce", "marinade", "fingerfood", "snack", "drink"]
    var sort: [String] = ["meta-score", "pupularity", "healthiness", "price", "time"]
    var cuisine: [String] = ["african", "Asian", "american", "british", "cajun", "caribbean", "chinese", "eastern european", "european", "french", "german", "greek", "indian", "irish", "italian", "japanese", "jewish", "korean", "latin american", "mediteranean", "mexican", "middle eastern", "nordic", "southern", "spanish", "thai", "vietnamese"]
    var intolerances: [String] = ["dairy", "egg", "gluten", "grain", "peanut", "seafood", "sesame", "shellfish", "soy", "sulfite", "tree nut", "wheat"]
    @State var equipment: String = ""
    @State var includeIngredients: String = ""
    @State var excludeIngredients: String = ""
    @State var author: String = ""


    var body: some View {
        VStack(spacing: 0){
            Text("Filters")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 500)
                .foregroundStyle(.black)
                .padding(.bottom, 40)
                .background(.green)
                .border(width: 10, edges: [.bottom], color: .black)
            ScrollView(){
                Text("In: stands for include, out: stands for exclude and ex: stands for by example")
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                    .background(.yellow)
                    .border(width: 6, edges: [.leading, .trailing,  .bottom], color: .green)
                HStack{
                    ChoiceView(myItems: $items, query: "sort", options: ["popularity", "price", "time"])
                    ChoiceView(myItems: $items, query: "type", options: type)
                }
                .padding(.top, 13)
                HStack{
                    MultipleChoiceView(myItems: $items, query: "cuisine", options: cuisine)
                    MultipleChoiceView(myItems: $items, query: "excludeCuisine", options: cuisine)
                }
                MultipleChoiceView(myItems: $items, query: "intolerances", options: cuisine)

                Text("Ingredients")
                    .fontWeight(.bold)
                    .font(.title3)
                HStack{
                    customTextField(text: $excludeIngredients, hint: "out: egg,flour")
                    customTextField(text: $includeIngredients, hint: "In: egg,flour")
                }
                HStack{
                    VStack{
                        Text("Equipment")
                                .fontWeight(.bold)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                        customTextField(text: $equipment, hint: "ex: pan,knife")
                    }
                    VStack{
                        Text("Author")
                                .fontWeight(.bold)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                        customTextField(text: $author, hint: "ex: random guy")
                    }

                }

            }
//            @State var equipment: String = ""
//            @State var includeIngredients: String = ""
//            @State var excludeIngredients: String = ""
//            @State var author: String = ""

            Button(action: {
                if !equipment.isEmpty{
                    items.updateValue(equipment, forKey: "equipment")
                }
                else{
                    items.removeValue(forKey: "equipment")
                }
                if !includeIngredients.isEmpty{
                    items.updateValue(includeIngredients, forKey: "includeIngredients")
                }
                else{
                    items.removeValue(forKey: "includeIngredients")
                }
                if !excludeIngredients.isEmpty{
                    items.updateValue(excludeIngredients, forKey: "excludeIngredients")
                }
                else{
                    items.removeValue(forKey: "excludeIngredients")
                }
                if !author.isEmpty{
                    items.updateValue(author, forKey: "author")
                }
                else{
                    items.removeValue(forKey: "author")
                }

            }, label: {
                Text("Save")
                    .frame(width: 100, height: 50)
                    .background(.green)
                    .padding(1)
                    .foregroundStyle(.black)
                    .border(width: 3, edges: [.leading, .trailing, .top, .bottom], color: .black)
            })
        }
    }
}
struct customTextField: View {
    @Binding var text: String
    var hint: String
    var body: some View {
        TextField("", text: $text, prompt: Text(hint).fontWeight(.bold))
            .multilineTextAlignment(.center)
            .frame(width: 180, height: 52)
            .background(.yellow)
            .border(width: 3, edges: [.leading, .trailing, .top, .bottom], color: .black)

    }
}
struct ChoiceView: View {
    @Binding var myItems: [String: String]
    var query: String
    var options: [String]
    @State var selectText: String = "- select -"
    var body: some View {
        Menu(content: {
            ForEach(options, id: \.hashValue){ option in
                Button(option){
                    myItems.updateValue(option, forKey: query)
                    print(myItems)
                    selectText = option
                }
            }
            Button(action: {
                myItems.removeValue(forKey: query)
                selectText = "- \(self.query) -"
            }, label: {
                Text("- reset " + query + " -")
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
            })

        }, label: {
            HStack(spacing: 0){
                Text(selectText)
                    .padding()
                    .background(.yellow)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .border(width: 3, edges: [.leading, .trailing, .top, .bottom], color: .black)
                Image(systemName: "chevron.up")
                    .frame(width: 30, height: 52)
                    .background(.green)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .border(width: 3, edges: [.leading, .trailing, .top, .bottom], color: .black)

            }
        })
        .onAppear(perform: {
            if(myItems[query] != nil){
                selectText = myItems[query]!
            }
            else{
                selectText = "- \(self.query) -"
            }
        })
    }
}



#Preview {
    FilterView(items: Binding<[String: String]>(get: {
        [String: String]()
    }, set: { newValue , Transaction in
        
    }))
}

struct MultipleChoiceView: View {
    @Binding var myItems: [String: String]
    var query: String
    var options: [String]
    @State var selectedOptions: [String] = []
    @State var selectText: String = "- select -"
    var body: some View {
        Menu(content: {
            ForEach(options, id: \.hashValue){ option in
                Button(action: {
                    let index = indexOfOption(someSelectedOptions: selectedOptions, optionToLookFor: option)
                    if index >= 0{
                        selectedOptions.remove(at: index)
                        makeQuery(someSelectedOptions: selectedOptions)
                        
                    }
                    else {
                        selectedOptions.append(option)
                        makeQuery(someSelectedOptions: selectedOptions)
                    }
                }, label: {
                        
                    Text(option)
                        //indexOfOption(someSelectedOptions: selectedOptions, optionToLookFor: option)
                    if(selectedOptions.contains(option)){
                        Image(systemName: "checkmark.square")
                    }
                    else{
                        Image(systemName: "square")
                    }
                })
                
            }
        }, label: {
            HStack(spacing: 0){
                Text(selectText)
                    .padding()
                    .background(.yellow)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .border(width: 3, edges: [.leading, .trailing, .top, .bottom], color: .black)
                Image(systemName: "chevron.up")
                    .frame(width: 30, height: 52)
                    .background(.green)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .border(width: 3, edges: [.leading, .trailing, .top, .bottom], color: .black)

            }
        })
        .onAppear(perform: {
            if(myItems[query] != nil){
                selectedOptions = myItems[query]!.components(separatedBy: ",")
                print(selectedOptions)
                
            }
            selectText = "- \(self.query) -"
            
        })
    }
    func makeQuery(someSelectedOptions: [String]){
        var text: String = ""
        for someSelectedOption in someSelectedOptions {
            text.append(someSelectedOption + ",")
        }
        if(!text.isEmpty){
            text.removeLast()
            myItems.updateValue(text, forKey: query)
            print(myItems)
        }
        else{
            myItems.removeValue(forKey: query)
            print(text)
        }
    }
    func indexOfOption(someSelectedOptions: [String], optionToLookFor: String) -> Int{
        var currentIndex: Int = 0
        for anOption in someSelectedOptions{
            if anOption == optionToLookFor{
                return currentIndex
            }
            currentIndex += 1
        }
        return -1
    }

}
