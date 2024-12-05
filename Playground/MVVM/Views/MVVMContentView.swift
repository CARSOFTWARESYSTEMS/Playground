//
//  MVVMContentView.swift
//  Playground
//
//  Created by Krishna Prakash on 08/06/24.
//  https://medium.com/@krishnaprakashn/building-an-ios-app-with-mvvm-and-clean-architecture-a-practical-guide-16c0fd74ca44
//

import SwiftUI

struct AppEnvironment0 {
    let networkService = NetworkService()
    lazy var productsService = ProductsService(networkService: networkService)
    lazy var  productsRepository = ProductsRepositoryImpl(productsService: productsService)
    lazy var  productsUseCase = ProductsUseCaseImpl(repository: productsRepository)
    lazy var  homeViewModel = HomeViewModel(productsUseCase: productsUseCase)
}


struct MVVMContentView: View {
    
    @State var appEnvironment = AppEnvironment0()
    
    var body: some View {
        VStack {
            HomeView(viewModel: HomeViewModel(productsUseCase: ProductsUseCaseImpl(repository: ProductsRepositoryImpl(productsService: ProductsService(networkService: NetworkService())))))
            //HomeView(viewModel: appEnvironment0.homeViewModel)
        }
        .padding()
    }
}

#Preview {
    MVVMContentView(appEnvironment0: AppEnvironment0())
}
