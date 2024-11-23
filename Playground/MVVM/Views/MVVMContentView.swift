//
//  MVVMContentView.swift
//  Playground
//
//  Created by Krishna Prakash on 08/06/24.
//  https://medium.com/@krishnaprakashn/building-an-ios-app-with-mvvm-and-clean-architecture-a-practical-guide-16c0fd74ca44
//

import SwiftUI

struct MVVMContentView: View {
    var body: some View {
        VStack {
            HomeView(viewModel: HomeViewModel(productsUseCase: ProductsUseCaseImpl(repository: ProductsRepositoryImpl(productsService: ProductsService(networkService: NetworkService())))))
        }
        .padding()
    }
}

#Preview {
    MVVMContentView()
}
