# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.18.tar.gz"
  sha256 "0f8b622fa4f1a7e292b5860ad3b39d5ce47053a5736ff0af28ac734875f039ef"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.18"
    sha256 cellar: :any, arm64_linux: "98354ec70d1b142efef0bf6ca81d1a73c4d78decb9af39c8c412776174552d7d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "166a844dd7a59fa815d94cc7fcd03d54f13b48822f04d93cc047e00485e43e53"
    sha256 cellar: :any_skip_relocation, sequoia: "e43885691c12196ab0c8fdffcca4ef3526af7559499fd74f0b4b1141c4c840a2"
    sha256 cellar: :any, x86_64_linux: "3813848a7531658af1697ce27eb841be9defbe983b9326ab3d285decabcf4af3"
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
