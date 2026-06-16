# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.21.tar.gz"
  sha256 "bc8db816a2e722cfa4cb7e91e6b2851ddeaeb66f0f876640d46b3acf71837de3"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.20"
    sha256 cellar: :any, arm64_linux: "e05acdfb47535e558c195463ad6cd4414d85946b200ad2e24cfe258b4573d42a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "15767d4196253ee0d8f83628e081bad39d4d3e84dce91e6f91f80e8aafc2a004"
    sha256 cellar: :any_skip_relocation, sequoia: "1f112c5518f4c5c890381c39d326af7ac79cbf77ce05c6333b26aff4b9664364"
    sha256 cellar: :any, x86_64_linux: "3c28fe74924c76ca70071c69c5f411dbf5124c91b171e04f79f7cc41c09bdc1d"
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
