# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.1.tar.gz"
  sha256 "60f22b83a5f7b4512887c74537718f0f63aa5ef5ec5708b68f46d301e853fc55"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.0"
    sha256 cellar: :any, arm64_linux: "d9f083dec791b1e5047b489f500e70f5180948be6f2b47735ccb654d320054a8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "02518b635193dfa44922336f6d8b8f9b5da726039ed92b87077a926a523e7ae2"
    sha256 cellar: :any_skip_relocation, sequoia: "324334291389201e51a4dd50e26b4a55f320a0fc13b61a5236afd7e28e4ed585"
    sha256 cellar: :any, x86_64_linux: "0ca7d7e740b9d63d1006b9050e1cd44236bea0e5f6824e0d92706e7dd97aeb5d"
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
