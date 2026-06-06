# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.21.tar.gz"
  sha256 "6eaf1f562c8bd3f4f2d162a7ae8309ae188d67b0788bdb3dfc1f972e4b42a1e2"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.20"
    sha256 cellar: :any, arm64_linux: "e6cb4918da43d1823d6c19a6f48e2892e0f9cecca1e94d870a6c888f7e91799b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e1ba2115ed8f5373822580b57a38cf473409f84a427631427dca9459cbd03d5e"
    sha256 cellar: :any_skip_relocation, sequoia: "16ef8e0e38866bb3f34e013b1261d41d1ffb83c4a5f0a8e4cbf1393ff344b1d9"
    sha256 cellar: :any, x86_64_linux: "095bf61a40ba45e7ba682fe5b145bdfb175d3638e4adabccff75810757713d27"
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
