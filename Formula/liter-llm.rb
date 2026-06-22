# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.8.0.tar.gz"
  sha256 "59584215cee486624bc92471ac9741feab072a19c70987c3b3a3301ca03ae5e0"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.7.6"
    sha256 cellar: :any, arm64_linux: "ad8051be246e8b424711683279054a3c486a6749e2cd97524ad6c25b8c19ccc7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1a121d13ea35513d3b6aadfd880d0108d3504dcfcf8374caf3c8a2d4259af125"
    sha256 cellar: :any_skip_relocation, sequoia: "1ece601af8e81afe124065c6d916ff37c06e5a65f99b0c58ac93871fac440469"
    sha256 cellar: :any, x86_64_linux: "72b9a2380cc82b765a132e5844aafbf02a8f4b8764e5bf0c98cad04b76b12672"
  end

  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
