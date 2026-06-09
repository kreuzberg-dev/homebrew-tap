# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.65.tar.gz"
  sha256 "2f6b201cbdccb55209ee7ee6cc692e8639e1ba37a0ae65fa70997eb1cd7ef83d"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.63"
    sha256 cellar: :any, arm64_linux: "829476c31351c5e594c3c6f54dda2e5ccafc1a57d3e65f80c4bc8b79a1d72db9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c11937062dfe3952c2070ad7a6994ebc054702dd39578e2c3f7ae651a9210940"
    sha256 cellar: :any_skip_relocation, sequoia: "10b0b497a27f7cf455b70a2380b6f2d278738ca3ec51dac9f9922feeb4cf647e"
    sha256 cellar: :any, x86_64_linux: "525a12c627a08c79cfa86e09ce6c1eb1b218e8e348d3fec67473c6cefd780a49"
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
