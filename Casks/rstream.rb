cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.35"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a826d286833f19bfe7b4fb/download",
        sha256: "25ee405cf4adead8551c884400b8324a7f72bb9c984de3c66fce8de3d20a5495",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a826d3309eeaed0ce88703/download",
        sha256: "75e37d47f8ff48a1c29d1e87adcc65b74c4adb3530064fe3654cd75a5749266f",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a826d8309eeaed0ce88707/download",
        sha256: "296d6fde500a6be6814f44150aeb407f5fcf9668f26121ed11b27691a45e7e7d",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a826da309eeaed0ce88708/download",
        sha256: "c1d4c1ba0792d0609df47f4f9ea21237fc17a3e822d59a72d55603a4423a40a1",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
