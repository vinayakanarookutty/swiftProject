import SwiftUI

struct FoodView: View {
    @ObservedObject var userList = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(userList.users) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            HStack {
                                // Display the avatar image
                                if let avatarUrl = user.avatar, let url = URL(string: avatarUrl) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50) // Avatar size
                                            .clipShape(Circle())
                                    } placeholder: {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle())
                                            .frame(width: 50, height: 50)
                                    }
                                } else {
                                    // Default placeholder if avatar is nil
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 50, height: 50)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(user.name ?? "Unknown Name")
                                        .font(.headline)
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Users")
            }
        }
    }
}

// Detail view showing more info about the selected user
struct UserDetailView: View {
    var user: User // This is the data being passed from the previous view
    
    var body: some View {
        VStack {
            if let avatarUrl = user.avatar, let url = URL(string: avatarUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150) // Avatar size for detail page
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: 150, height: 150)
                }
            }
            
            Text(user.name ?? "Unknown Name")
                .font(.largeTitle)
                .padding(.top, 20)
            
            if let createdAt = user.createdAt {
                Text("Created At: \(createdAt)")
                    .font(.subheadline)
                    .padding(.top, 10)
            }
            
            Spacer()
        }
        .navigationBarTitle("User Details", displayMode: .inline)
    }
}


