# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.21.1.tar.gz"
  sha256 "eca03113e8586c8b6920a2bf608306a431d87ef1f21e94b1c65606d6e6908bfe"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.21.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a10137de57e90360e3f6e999e16daaa603207d4ab8ad4ad3d73868324feb4c2c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "439ac8505c9be7e6dff0f7209db031504d3ca8a3847e6a157e34eb50a829eac9"
    sha256 cellar: :any_skip_relocation, sequoia: "062185546196fd89b7339923e6fb823e42067f470c4f268c66dd3e9545ea4311"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b99cb1faa08390b43ca8cb19cf6f1053d958072ef12c5fa9546e27365fb75179"
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
