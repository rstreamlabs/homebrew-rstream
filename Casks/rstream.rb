cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.32"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a6ab392f635edd114b76e3/download",
        sha256: "",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a6ab395f7d560f58c4fba3/download",
        sha256: "",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a6ab3e5f7d560f58c4fba7/download",
        sha256: "",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a6ab402f635edd114b76e9/download",
        sha256: "",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
