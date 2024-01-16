cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.33"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a6b606d55c0e93a2badd98/download",
        sha256: "66d1d3342869add2cd5dd83e7459496340d2a1e1e90fc30c082e2de0b09959d5",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a6b60a47f987ba1b571cb0/download",
        sha256: "a10e1258948f7f83fc2a21dd6e32dbe2be241ebd91afa5b9577e1e09e7a62b39",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a6b60d47f987ba1b571cb3/download",
        sha256: "2de8d8dfb5870c6983da502f5b36d7a7875d9260f81ea4f07598027d0fd82166",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a6b60f47f987ba1b571cb4/download",
        sha256: "c66ddaf1ccb610bad99066650f8e5b97c410caedc877b8b56f42e4e11a3aa9dc",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
