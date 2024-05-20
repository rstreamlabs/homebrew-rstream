cask "rstream" do
  name "rstream"
  desc "Powerful Tunnels for Modern Applications."
  homepage "https://rstream.io"
  version "0.0.47"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://rstream.io/api/packages/65e87dc8e21a4ea76354d7b8/download",
        sha256: "4a67f3e907cb2cbd4c21a531c286628d89f228eaa354928ff5b193e28ea2b682",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/65e87dc8434814bb25801789/download",
        sha256: "b94428d5d814e1f3783e5a7bd53fddd47a783198966248839d1a451733fd1aa1",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://rstream.io/api/packages/65e87dcb434814bb25801790/download",
        sha256: "2bff1d010212faa03d1c2f616980e9ff94f26d60c0abc4638ee829565421a849",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/65e87dcb434814bb25801793/download",
        sha256: "850af849bdac148fc457f07e3584c49945a014e4845b1d3cd11fbc5650985225",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
