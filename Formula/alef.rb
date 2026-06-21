# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.59.tar.gz"
  sha256 "36e18dd712b2e013002d2da1b71e2ca149a12f4ec18610c6368b83bf09659828"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.58"
    sha256 cellar: :any, arm64_linux: "c428e1681fe2886ab0c8128eaee267e22dfb6ec7a88c140a3cc2e94061018f63"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0e92ec9f4f486dcd97aa4ce2f0adf9ba875826162bae482f16dbf484237a8608"
    sha256 cellar: :any_skip_relocation, sequoia: "8789e6cccd7b75f86cd688a5c2656316bd8fd629430acb343bd035e2ef61ba61"
    sha256 cellar: :any, x86_64_linux: "4147afd0e315e60880fb6c791749daf7e8c8a5a21547d916b06e0d1d97d92455"
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
