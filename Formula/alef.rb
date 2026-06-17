# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.30.tar.gz"
  sha256 "97006416f32c570afe2e80d6f0988c260b122f3f96ef38fe861377dfcea14bdc"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.29"
    sha256 cellar: :any, arm64_linux: "d9d316683c9e701ebb9de43f84eaad4c7dcb6304b278af7caeec8fa22e1fc8c9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a5a56a2aa7a84081c39f6245b120f8f6a339d41b6048c44c30a8472fbfe6f243"
    sha256 cellar: :any_skip_relocation, sequoia: "a5095808d42813d5d4c47077d49b13474c536bae7fecac0b50563ac7995067de"
    sha256 cellar: :any, x86_64_linux: "e3063fa83a2f888d368e0530e87d5ccb4e37246adfdc18206a1b0fa78139692c"
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
