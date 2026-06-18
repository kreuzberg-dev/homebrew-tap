# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.37.tar.gz"
  sha256 "226c48ae7a3886ea15cbae62c51aa6a8bc028c0795de7647f0861e2ba3207e9d"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.35"
    sha256 cellar: :any, arm64_linux: "eedaa4791d0c7a9baee489f2598d1b7146edadfcdbab6704b8d1ecd0e87fd31a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "924677ffb2d3784ca41af4d368fe8aced3969d4a1ecbea1b17588dd330918032"
    sha256 cellar: :any_skip_relocation, sequoia: "ef77345e72dea7eb3153f4c92bd9a4187c1176a31161e310289cc5a185f27aef"
    sha256 cellar: :any, x86_64_linux: "a15251cd1bf627bc57062f753ce79a9911a434cf19aa2ef80994408ec0994abd"
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
