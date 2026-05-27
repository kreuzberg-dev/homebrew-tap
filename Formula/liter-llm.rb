# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.37.tar.gz"
  sha256 "2a1e74ae5017f1e3e4384cc65375e30a6d26759c32b5be02a7715b9e9663dbdd"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.36"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6e850b44c47b2a6ee229610f4e91b6e9d2d757993fb05649c4426636e10b0b73"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b5823046bc19fefc9fdaa9eca869fac2579d511710d9ebc8585172fd56bb215c"
    sha256 cellar: :any_skip_relocation, sequoia: "69f68470100095842a4ae776fd7feba1ec88368a758e220182bd21fbfed4c94a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "211cff1f88724056c2347efbe63167c395aa336c34b3756dacceb4ed4a41cf08"
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
