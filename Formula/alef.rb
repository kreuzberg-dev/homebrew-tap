# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.0.tar.gz"
  sha256 "8e63214c8a0ed14d0664bee27930d37f77add7f5cd54965e376e19e68a56e68f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.19.25"
    sha256 cellar: :any_skip_relocation, arm64_linux: "65428b886b12eebb51657fa16b201a3424435e75e8235750070fa5679ff46e8d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c87c4f4ca5d62228bebfcd005323b6890d2cea99f250324c4a1b2c6d0425e675"
    sha256 cellar: :any_skip_relocation, sequoia: "3c53f0ab342a152bbe238049313a6b0bdf24d7002161047f3df73b214ab9f11e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5af4f1a92f3575c9715df72cd81cb4374ad84e602376d3264d9dce9794c50e26"
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
