# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.30.12.tar.gz"
  sha256 "df96692b265145802ffe094967bd532a252572f0fdfbd2d3d81951c9ebed21b9"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.30.12"
    sha256 cellar: :any, arm64_linux: "789bdc98d6c5d5abbd4bd32af85d732a14e263f7ac6ed5ada6e4a051d60d9bef"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b120af9b23e66d047497f6c2d3c9571e709364a84e113e8e6fa6462d39fddf05"
    sha256 cellar: :any_skip_relocation, sequoia: "21c67bc614450a0ee1e25ca92e394bbcb4b51e3f8afe8fe117ded2202807443f"
    sha256 cellar: :any, x86_64_linux: "3f6da645673c6f4d992feb75d28c22b8e60f73a8ca524cd22eb40d2beae20f7c"
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
