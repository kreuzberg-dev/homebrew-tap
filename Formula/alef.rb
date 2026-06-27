# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.29.4.tar.gz"
  sha256 "6821e8ac428ed4475b7d50fe0c0436cf3cdcb50693b70ac5fc5ba561c140b8a8"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.29.4"
    sha256 cellar: :any, arm64_linux: "22e926b701483cdea1151cad862dee3ec910c332b8babc107209a0f55385cfea"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f2629fa6f96553e52a71b6d1481f2719d6c822cacf1f15cf571be0c74239f3ba"
    sha256 cellar: :any_skip_relocation, sequoia: "d0100069990ad78a3fdce6351348d55ae35d2eebf8fea8afa5be86f366d5b94e"
    sha256 cellar: :any, x86_64_linux: "409e1e7b9c3bb4c4911e80605b2550820e0165429757a68f4cef7c1eb82809ee"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
