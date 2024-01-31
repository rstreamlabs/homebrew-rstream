cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.39"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9eadd65267ac3339ce33c/download",
        sha256: "2f168f6a3176dd17b65c971df5c92b9431ba362f61f9a1068fb1245e16961df2",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9eadeee18a662bb2979f0/download",
        sha256: "2714287ba339396c9d3b7fad5dc1f76c584368636824ea3fb16a3261dd550a7d",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9eae265267ac3339ce340/download",
        sha256: "871390a7475b79c659bceb550d9deadd27c7289ee7db6e69edf348f205eb20fb",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9eae4ee18a662bb2979f6/download",
        sha256: "f942a28d3d753b46b5a7dc97c76df77314ff0ff7c7dd19efd1fcf6aef69444a0",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
