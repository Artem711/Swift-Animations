//
//  HomeView.swift
//  Animater
//
//  Created by Артём Мошнин on 3/7/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CircleDragView()) {
                    Text("CircleDragView")
                }
            }
            .navigationBarTitle("Home View")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
