import SwiftUI
import SwiftData

struct CryClassifierView: View {
    @State var viewModel = SoundDetectionViewModel()
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            HeaderView(title: "Cry Classifier", subtitle: "Detecting sounds and identifying cry patterns")
            
            Divider()
            
            Spacer()
            
            if let predictedSound = viewModel.identifiedSound {
                VStack(spacing: 5) {
                    if predictedSound.0 == "Background" {
                        Image("diagnostic")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.4)
                            .padding()
                        
                        Text("No cry detected")
                            .font(.title2.bold())
                        
                        Text("Try again in a quieter environment")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    } else {
                        Image("baby-crying")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                            .padding()
                        
                        Text(predictedSound.0)
                            .font(.title.bold())
                        
                        Text("\(predictedSound.1) confidence")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    }
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(.secondary)
                .background(content: {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.ultraThinMaterial)
                })
            } else if !viewModel.detectionStarted {
                ContentUnavailableView("No Sound Detected", systemImage: "waveform.badge.magnifyingglass", description: Text("Tap the microphone to start detecting"))
            } else {
                ProgressView("Classifying sound...")
            }
            
            Spacer()
            
            Button(action: {
                do {
                    try viewModel.checkMicrophonePermission()
                    withAnimation {
                        viewModel.identifiedSound = nil
                        viewModel.detectionStarted.toggle()
                    }
                    viewModel.detectionStarted ? viewModel.startDetection(modelContext: modelContext) : viewModel.stopDetection()
                } catch {
                    viewModel.handleError(error)
                }
            }, label: {
                Image(systemName: viewModel.detectionStarted ? "stop.fill" : "mic.fill")
                    .font(.system(size: 50))
                    .padding(30)
                    .background( (viewModel.detectionStarted ? LinearGradient(colors: [.red, .red.opacity(0.7)], startPoint: .top, endPoint: .bottom) : LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)))
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: 5)
                    .contentTransition(.symbolEffect(.replace))
            })
            .disabled(viewModel.detectionStarted)
            .padding(.bottom, 30)
        }
        .background(Color("background"))
        .onDisappear {
            viewModel.identifiedSound = nil
        }
        .alert("No Microphone Access", isPresented: $viewModel.showErrorAlert) {
            Button("Ok", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
        
    }
}

#Preview {
    CryClassifierView()
}
