# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.20.2.tar.gz"
  sha256 "7ef57d919a04b7956111cd861073d3719d1907064b9d4d7438a69cc9e6d4b58a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.20.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9505509f59a80284d5b0003d3af583d371d703687012f098f12264cdada34f0b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "33cfe0c15275a9cbf3c91e4298a26c1df1665f39cb835aa91f38fd6ebf4a8aaf"
    sha256 cellar: :any_skip_relocation, sequoia: "49aa840059db4dba22272d4970c843961d428ca5d2213e019af7c842baa295e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "889301debca45f5a9fef67ae1becac101b56439b6449369f2184c3088630eee1"
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
