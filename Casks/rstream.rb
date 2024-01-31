cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.43"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65ba5920fdaa8b5afdd04065/download",
        sha256: "3e605c3a3934c7a0dd0f2ed9d8f5069be693c4b363182ea0a7890738d938c016",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65ba5924f79cf3d1e1d38914/download",
        sha256: "3f02e219ea3b3063c3bf407f1ec1c0961df6188d2e0019d9748cf1a5a41f3dff",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65ba5927f79cf3d1e1d38917/download",
        sha256: "c370eeb2d680c93f39d5094b92a2041eb6414049a814395302f883b6271bac93",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65ba5928f79cf3d1e1d38918/download",
        sha256: "690b0933a246b89107a569e7d2f0c4fff6541d40341c9322d1767d47b84bb638",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
