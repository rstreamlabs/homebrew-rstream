cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.37"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9e608d8ebe7a7dbb4eaba/download",
        sha256: "ef1f396dffebe2e35a8848f17d37af384adc929c384361383b1aa5c4b22f784b",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9e608e7bb58f63b637e39/download",
        sha256: "70df0fd7fd7ef63d93d5abc5806957d5050c5b922cdf38745a10294b5c8d0dae",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9e60dd8ebe7a7dbb4eabe/download",
        sha256: "07ea79454eb804aae8b84ca6d2526aa3974aeef85586cfab71bd762087b93368",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9e610e7bb58f63b637e3f/download",
        sha256: "466f88b33b7fbb32c70329fec98b94e25c457a03eab35ff917f922ed062db999",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
