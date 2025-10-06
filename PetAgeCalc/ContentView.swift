import SwiftUI

struct ContentView: View {
    @State private var petAge: String = ""
    @State private var selectedPet = 0
    @State private var humanAge: Int = 0

    let pets = ["Dog (Small)", "Dog (Medium)", "Dog (Large)", "Cat", "Rabbit", "Hamster", "Guinea Pig", "Parrot"]

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.orange.opacity(0.6), Color.pink.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("🐾 Pet Age Calc")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 50)

                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Pet Type")
                            .foregroundColor(.white)
                            .font(.headline)

                        Picker("Pet Type", selection: $selectedPet) {
                            ForEach(0..<pets.count, id: \.self) { index in
                                Text(pets[index])
                            }
                        }
                        .pickerStyle(.menu)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Pet's Age (years)")
                            .foregroundColor(.white)
                            .font(.headline)

                        TextField("Enter age", text: $petAge)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)

                Button(action: calculateAge) {
                    Text("Calculate Human Age")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(15)
                }
                .padding(.horizontal)

                if humanAge > 0 {
                    VStack(spacing: 15) {
                        Text("In Human Years")
                            .font(.headline)
                            .foregroundColor(.white)

                        Text("\(humanAge)")
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(.white)

                        Text("years old")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.9))

                        Text(getAgeDescription())
                            .font(.body)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(20)
                    .padding(.horizontal)
                }

                Spacer()
            }
        }
    }

    func calculateAge() {
        guard let age = Double(petAge), age > 0 else {
            humanAge = 0
            return
        }

        switch selectedPet {
        case 0: // Small Dog
            if age <= 2 {
                humanAge = Int(age * 12.5)
            } else {
                humanAge = 25 + Int((age - 2) * 4.5)
            }
        case 1: // Medium Dog
            if age <= 2 {
                humanAge = Int(age * 12)
            } else {
                humanAge = 24 + Int((age - 2) * 5)
            }
        case 2: // Large Dog
            if age <= 2 {
                humanAge = Int(age * 11)
            } else {
                humanAge = 22 + Int((age - 2) * 6)
            }
        case 3: // Cat
            if age == 1 {
                humanAge = 15
            } else if age == 2 {
                humanAge = 24
            } else if age > 2 {
                humanAge = 24 + Int((age - 2) * 4)
            } else {
                humanAge = Int(age * 15)
            }
        case 4: // Rabbit
            humanAge = Int(age * 8)
        case 5: // Hamster
            humanAge = Int(age * 25)
        case 6: // Guinea Pig
            humanAge = Int(age * 14)
        case 7: // Parrot
            humanAge = Int(age * 1.5)
        default:
            humanAge = 0
        }
    }

    func getAgeDescription() -> String {
        switch humanAge {
        case 0..<13:
            return "Your pet is like a child 👶"
        case 13..<20:
            return "Your pet is a teenager 🎓"
        case 20..<40:
            return "Your pet is a young adult 💪"
        case 40..<60:
            return "Your pet is middle-aged 🧘"
        case 60..<80:
            return "Your pet is a senior 👴"
        default:
            return "Your pet is very elderly 🎂"
        }
    }
}

#Preview {
    ContentView()
}
