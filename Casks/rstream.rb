cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.46"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://rstream.io/api/packages//download",
        sha256: "89a69e9b206f700a0d5730ac22ca0738bb08f9dbdfccde0bf2dfc8627de029db",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages//download",
        sha256: "dbb7334832dc3e25e60563f71da1847c5f108be09899747181d2d6df70e52af1",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://rstream.io/api/packages//download",
        sha256: "1adc77e73bbdbd2b0192a583f7a49cb6f527392f5abfe84e5e3774490adcf20b",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages//download",
        sha256: "9047628b7d619206b308f712ad1e23fcd0e0cd993245509f1990e8d011ed4da0",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
