//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Dhaval Bhadania on 09/07/25.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    
    @State var aphabetical = false
    
    @State var currentSelection = APType.all
    
    var filterDinos : [Apexpredator]{
        predators.filter(by: currentSelection)
        predators.sort(by: aphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(filterDinos){ predator in
                NavigationLink{
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                }label: {
                    HStack{
                        //image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading)
                        {
                            //name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            // type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .padding(.horizontal,13)
                                .padding(.vertical,5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default,value: searchText)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            aphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: aphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: aphabetical)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation()) {
                            ForEach(APType.allCases) { type in
                                HStack {
                                    Label(type.rawValue.capitalized, systemImage: type.icon)
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
