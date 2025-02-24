//
//  ContentView.swift
//  Avocado
//
//  Created by Mihir Daka on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RecipeListView()
    }
}


struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            ZStack
             {
                 VStack
                {
                    
                    if viewModel.isLoading {
                        ProgressView("Loading Recipes...")
                    } else if let error = viewModel.errorMessage {
                        Text(error)
                            .font(.headline)
                            .foregroundColor(.red)
                    } else {
                        List(viewModel.recipes) { recipe in
                            HStack (alignment: .top) {
                                
                                ImageView(
                                                           url: recipe.photoURLSmall,
                                                           placeHolder: Image(systemName: "photo")
                                                       )
                                                       
                                .frame(width: 80, height: 80)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(recipe.name).bold()
                                    Text(recipe.cuisine).foregroundColor(.gray)
                                }
                                Spacer()
                                VStack (alignment: .center, spacing: 10){
                                    
                                    
                                    Button(action: {
                                        if let url =  recipe.sourceURL {
                                              UIApplication.shared.open(url)
                                           }
                                    }) {
                                        Label("",systemImage: "globe")
                                        
                                    }
                                    .foregroundColor(.blue)
                                    Button(action: {
                                        if let url = recipe.youtubeURL {
                                              UIApplication.shared.open(url)
                                           }
                                    }) {
                                        Label("",systemImage: "play.rectangle")
                                        
                                    }
                                    .foregroundColor(.red)
                                }
                                
                               
                            }
                        }
                        .refreshable {
                            await viewModel.loadRecipes()
                        }
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }.navigationTitle("Avocado")
        }
             .task {
                 await viewModel.loadRecipes()
             }
    }
}


#Preview {
    ContentView()
}
