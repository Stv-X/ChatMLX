//
//  AboutView.swift
//  ChatMLX
//
//  Created by John Mai on 2024/8/10.
//

import Luminare
import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image("AppLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)

            Text("ChatMLX")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(
                "Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown")"
            )
            .font(.subheadline)
            .foregroundColor(.white)

            Spacer()
            LuminareSection {
                Link(destination: URL(string: "https://github.com/maiqingqiang/ChatMLX")!) {
                    Image("github-logo")
                        .resizable()
                        .scaledToFit()
                        .padding(6)
                }
                .frame(height: 30)
                .buttonStyle(LuminareButtonStyle())
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ultramanNavigationTitle("About")
    }
}
