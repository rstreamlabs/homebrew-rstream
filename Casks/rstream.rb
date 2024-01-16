cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.31"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a6a55041a050e92892c458/download",
        sha256: "",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a6a5503817e56f66b6b211/download",
        sha256: "",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a6a5553817e56f66b6b215/download",
        sha256: "",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a6a55741a050e92892c45e/download",
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
