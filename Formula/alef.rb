# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.28.tar.gz"
  sha256 "3513525bf649e829e977caf1f8edd14fbb99e0083060b57aeb7f080019a6100b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.26"
    sha256 cellar: :any, arm64_linux: "bf21e3bb76f95006eb83f1b2c9d95d5dba2c58b126eca197097ccf65099b542d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6f6617921ffa0c3fd84d5d4071fae90a961ffc8515281c7bee55fe4064bdf713"
    sha256 cellar: :any_skip_relocation, sequoia: "3a99afbbaa33a56ca40125873573774daa689c3a315a5ba5f2a02b0eaba09126"
    sha256 cellar: :any, x86_64_linux: "daf8a0bf1e0f418bbf50099d713be9547a02f7306741ce0082dbc8858b73fcd1"
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
