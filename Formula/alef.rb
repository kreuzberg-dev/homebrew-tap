# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.27.0.tar.gz"
  sha256 "d7e29e6f13f1b6401df011ce4805ce36835ee2bfe345f66b754eae0e8ef08cf1"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.26.8"
    sha256 cellar: :any, arm64_linux: "cdbd3a0fe8dca60059fc560263bec59ea9ae0830c479587dec4bd4b9e4562aed"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5fdc9e6ef98dc6a6b87ec184a227ab27a8f7659c479b8f132d46984444cca6c6"
    sha256 cellar: :any_skip_relocation, sequoia: "44efda22dee38ed22bd9ecb48d3ebd861aed785611c2f3bd47529bea1196a618"
    sha256 cellar: :any, x86_64_linux: "828ffd6a1ee303db74e8331fa5accce271d5fd354674ec52e9aab5916326b9bc"
  end

  head 'https://github.com/kreuzberg-dev/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
