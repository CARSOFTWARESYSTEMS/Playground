//
//  HomeView.swift
//  Playground
//
//  Created by Krishna Prakash on 19/06/24.
//

import SwiftUI

struct AppEnvironment {
    let networkService = NetworkService()
    lazy var productsService = ProductsService(networkService: networkService)
    lazy var  productsRepository = ProductsRepositoryImpl(productsService: productsService)
    lazy var  productsUseCase = ProductsUseCaseImpl(repository: productsRepository)
    lazy var  detailsViewModel = DetailsViewModel(productsUseCase: productsUseCase)
}

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var appEnvironment = AppEnvironment()
    
    
    var body: some View {
        NavigationView {
            List(viewModel.companies) { company in
                NavigationLink(destination: DetailsView(viewModel:appEnvironment.detailsViewModel)) {
                    VStack(alignment: .leading) {
                        Text(company.name)
                            .font(.headline)
                        HStack {
                            ForEach(company.products) { product in
                                VStack {
                                    AsyncImage(url: URL(string: product.image)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle()) // Optional: Clip to circle shape
                                        case .failure(let error):
                                            Text("Failed to load image: \(error.localizedDescription)")
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    Text(product.name)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchCompanies()
            }
            .navigationTitle("Companies")
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(productsUseCase: ProductsUseCaseImpl(repository: ProductsRepositoryImpl(productsService: ProductsService(networkService: NetworkService())))))
}
