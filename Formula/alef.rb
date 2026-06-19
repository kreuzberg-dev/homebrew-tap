# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.49.tar.gz"
  sha256 "accf849aa85c5b34f559767fe961e44c3623d078bca125e7e16ae9abe0c59203"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.49"
    sha256 cellar: :any, arm64_linux: "455cda9ea5db0eb5f58e52b0bfc3f69db2a25e2c54e020b38f01917ca09e7ab3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5d18e1b53ea2398240b30202f18bc16594c7740c623a321c2858e0daabc15da8"
    sha256 cellar: :any_skip_relocation, sequoia: "32d28392d406a074adc17fabfc11db04d4c355dfe88be48934789a9cf4de907c"
    sha256 cellar: :any, x86_64_linux: "a337728e7a48994cdd72f2f05156ed45a7d139e3392baade43df6b750455f54f"
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
