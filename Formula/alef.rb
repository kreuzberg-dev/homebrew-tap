# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.6.tar.gz"
  sha256 "b838f9f85563c9004dc1fa5e7e1261ec110b2ed14fbc058e252feb31a720612c"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2bbc144039e585a023bfd63ff01f9b4c4f9c17debc8ce0889b247b514f41adb6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6144811330d8cc9e092cc83be03fe5bd5d1b79bc6889be8c1b3b6f7fb4718870"
    sha256 cellar: :any_skip_relocation, sequoia: "73e26eb2f7a79530dcc469043658309ce077ed67f44d4444de9af866fb84299a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6acffbb8fef4176fdf942f447d84ee1a7bd52a76798d9037a3ad92d9264c7b27"
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
