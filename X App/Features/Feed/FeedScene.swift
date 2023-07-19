import SwiftUI

struct FeedScene: View {

    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            VStack {
                Text("Feed")
                    .font(.init(.custom("Avenir Next", size: 50)))
                    .padding(.init(top: 130, leading: 50, bottom: 0, trailing: 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
        }
    }
}
