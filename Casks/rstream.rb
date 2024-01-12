cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.22"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a13bb32ae9bfc64e1f910f/download",
        sha256: "fde73c6e46e9c5060c7297a70d4129626e03af39f742daebb745348d9b0c48b1",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a13bb520c761a9da557b3a/download",
        sha256: "00647c7e5fb466b65327d842d373d666546d6f6bdc26081dee8ff7f1012af2a3",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a13bbd2ae9bfc64e1f9112/download",
        sha256: "f128a2a09698f7e38b41c97fc68de7db3794964495715aa59eafd00d66e432a6",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a13bc02ae9bfc64e1f9113/download",
        sha256: "4a6b69adef6b2647672ad7401a07e667cdbca98f096cbef3c452262eca065e01",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
