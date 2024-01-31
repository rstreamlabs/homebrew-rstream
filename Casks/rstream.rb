cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.44"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65ba625ca1f4597d2d3e0918/download",
        sha256: "c943fd1b407fea49da63d10d1c7b20c00cdc50ebca5a10cef0f8d3a564636d50",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65ba6260a0d29fe7e401c157/download",
        sha256: "f1789ae1f4cc9293b9885dffe75b92aeded15aa7bb49388647edf285c97ddc0c",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65ba6263a0d29fe7e401c15a/download",
        sha256: "b13382ff6d42aae6f9010da7789c01ca841bc7cf68c60f560fdbff437eca9b5e",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65ba6264a0d29fe7e401c15b/download",
        sha256: "9b93c8ff53c4f1e7b8bea48c50212ec8b262d021ebfcbf8e0ede7f7fd95438c5",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
