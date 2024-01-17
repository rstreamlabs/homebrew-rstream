cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.34"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a8164565a40c02ba36e182/download",
        sha256: "665b2cf65b5df599da8aea176c35dd3c1be9f0568198647c4b546e9bd1b78490",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a81645a5fac6add33c8e8d/download",
        sha256: "dd317fe78072aa3e57f09ad6684d36789b5688f572961698937d104d4e54edbe",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a8164aa5fac6add33c8e91/download",
        sha256: "91cbe381c98145dd1950c6f7ee4a2a4c7f90db1218a1130e5eeb495242553258",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a8164d65a40c02ba36e188/download",
        sha256: "bfc05e8d927a529608273f318442c7af3d43bdb25ecdcf8fe93a263c53f0f750",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
