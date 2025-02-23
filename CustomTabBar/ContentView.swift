//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Dmytro Yarmolchuk on 04.07.2024.
//

import SwiftUI

enum Tab{
    case home
    case search
    case notifications
    case settings
}

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var selectedTab:Tab = .home
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedTab,content:  {
                Group {
                    NavigationStack {
                        Home()
                    }
                    .tag(Tab.home)
                    
                    NavigationStack {
                        Search()
                    }
                    .tag(Tab.search)
                    
                    NavigationStack {
                        Notifications()
                    }
                    .tag(Tab.notifications)
                    
                    NavigationStack {
                        Settings()
                    }
                    .tag(Tab.settings)
                }
                .toolbar(.hidden, for: .tabBar)
            })
            
            VStack{
                Spacer()
                tabBar
            }
        }
    }
    
    private var tabBar: some View{
        HStack(content: {
            Spacer()
            
            Button(action: {
                withAnimation {
                    selectedTab = .home
                }
            }, label: {
                VStack(alignment: .center, content: {
                    Image(systemName: "homekit")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                    if selectedTab == .home{
                        Text("Home")
                            .font(.system(size: 12))
                    }
                })
            })
            .foregroundStyle(selectedTab == .home ? Color.primary : Color.secondary)
            Spacer()
            
            Button(action: {
                withAnimation {
                    selectedTab = .search
                }
            }, label: {
                VStack(alignment: .center, content: {
                    Image(systemName: "sparkle.magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                    if selectedTab == .search{
                        Text("Search")
                            .font(.system(size: 12))
                    }
                })
            })
            .foregroundStyle(selectedTab == .search ? Color.primary : Color.secondary)
            Spacer()
            
            Button(action: {
                withAnimation {
                    selectedTab = .notifications
                }
            }, label: {
                VStack(alignment: .center, content: {
                    Image(systemName: "bell.badge.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                    if selectedTab == .notifications{
                        Text("Notification")
                            .font(.system(size: 12))
                    }
                })
            })
            .foregroundStyle(selectedTab == .notifications ? Color.primary : Color.secondary)
            Spacer()
            
            Button(action: {
                withAnimation {
                    selectedTab = .settings
                }
            }, label: {
                VStack(alignment: .center, content: {
                    Image(systemName: "gear.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                    if selectedTab == .settings{
                        Text("Settings")
                            .font(.system(size: 12))
                    }
                })
            })
            .foregroundStyle(selectedTab == .settings ? Color.primary : Color.secondary)
            Spacer()
            
        })
        .padding()
        .frame(height: 68)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(RadialGradient(gradient: Gradient(colors: [.orange, .black]), center: .center, startRadius: 2, endRadius: 350))
                .shadow(color: Color.black.opacity(0.5), radius: 8, y:2)
        }
        .padding(.horizontal)
    }
}

struct Home: View {
    var body: some View {
        Text("Home")
    }
}

struct Search: View {
    var body: some View {
        Text("Search")
    }
}

struct Notifications:View {
    var body: some View {
        Text("Notifications")
    }
}

struct Settings: View {
    var body: some View {
        Text("Settings")
    }
}

#Preview {
    ContentView()
}
