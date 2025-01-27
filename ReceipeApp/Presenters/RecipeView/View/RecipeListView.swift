//
//  RecipeListView.swift
//  ReceipeApp
//
//  Created by Ravi Seta on 24/01/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var viewModel: RecipelistViewModel
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                recipeListView
            }
            .onAppear {
                viewModel.getRecipeData()
            }
            .navigationTitle("Recipes")
        }
    }
    
    @ViewBuilder
    var recipeListView: some View {
        List(viewModel.recipe, id: \.id) { data in
            switch data {
            case .loader(_):
                self.prepareListItem(model: .placeholder)
                
            case .data(let model):
                self.prepareListItem(model: model)
                    .padding(EdgeInsets(top: 0, leading: 12, bottom: 12, trailing: 12))
            }
        }
        .listStyle(.plain)
    }
    
    func prepareListItem(model: RecipeListItemViewModel) -> some View {
        RecipeListItem(viewModel: model)
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
            .frame(maxWidth: .infinity)
            .background(Color.getAppColor(.gray30))
        
    }
}

#Preview {
    RecipeListView(viewModel: RecipelistViewModel(recipeListUseCase: RecipeListUseCase(recipeListRepository: RecipeListRepository(netWorkManager: NetWorkManager()))))
}
