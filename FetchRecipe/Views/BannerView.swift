//
//  BannerView.swift
//  FetchRecipe
//
//  Created by Salmdo on 11/18/24.
//

import SwiftUI

struct BannerView: View {
    let error: ServiceError
    
    private var imgSysName: String {
        error == ServiceError.noData ? "exclamationmark.octagon.fill" : "xmark.circle.fill"
    }
    
    private var bannerColor: Color {
        error == ServiceError.noData ? Color.blue: Color.red
    }
    
    var body: some View {
        if let message = error.errorMessage  {
            VStack(spacing: 30) {
                Text(message)
                    .multilineTextAlignment(.center)
                    .accessibilityIdentifier(RecipeViewIdentifiers.errorBanner.rawValue)
                Image(systemName: imgSysName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(bannerColor)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(bannerColor, lineWidth: 1.5)
            }
            .shadow(radius: 1)
        }
    }
}

#Preview {
    BannerView(error: ServiceError.noData)
}
