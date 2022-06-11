//
//  Home.swift
//  testApp
//
//  Created by Adam Jemni on 6/9/22.
//

import SwiftUI

struct Home: View {
    
    @State var currentIndex: Int = 0
    @State var posts: [Post] = []
    
    var body: some View {
        
        VStack(spacing: 15){

            // snap Carousel
            SnapCarousel(spacing: 20, trailingSpace: 100, index: $currentIndex, items: posts) {post in
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.width)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical, 40)
            
            // Indicator
            HStack(spacing : 10){
                
                ForEach(posts.indices,id: \.self){index in
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.2))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                    
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear{
            for index in 1...5{
                posts.append(Post(postImage: "post\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
