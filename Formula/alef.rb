# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.49.tar.gz"
  sha256 "accf849aa85c5b34f559767fe961e44c3623d078bca125e7e16ae9abe0c59203"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.48"
    sha256 cellar: :any, arm64_linux: "5316197ffab275658ad391b7d480b1318087dfc674e160750aabb4bf8edcec70"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "51c1b4d560f56ffe9f4e5c381454079947471f580dce34832696c03ecc9d3a71"
    sha256 cellar: :any_skip_relocation, sequoia: "d4a62c81e0171bef373ec09d385898dfcfc8ed846bce793516d3f377bc449e9f"
    sha256 cellar: :any, x86_64_linux: "a646d1f5f86ec3a74bc39855ff847bf8dd9a3b5cba6ca340253320fb8fe1b829"
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
