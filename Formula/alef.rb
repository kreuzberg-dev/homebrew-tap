# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.6.tar.gz"
  sha256 "84650aa8b7a5d9680c84fb274b7ba3eabf6b31cc9559141be6dc4002f6687018"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.6"
    sha256 cellar: :any, arm64_linux: "25dd4d45c423e499d72b08494a7da87898f79fefdd72369da001fa36a8f7fdd9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ddb5ad4b37291e82f0045c9dce99b051d9a7ba1977c5ca9c3795bae345369d4c"
    sha256 cellar: :any_skip_relocation, sequoia: "d7c4e0e5619003fa69de68791098ec9b8be55bad7400684a5852d4f5f4a90106"
    sha256 cellar: :any, x86_64_linux: "ee243ecc9f621f77539a364236497e90455f684d9adff47295f18257ef7dee03"
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
