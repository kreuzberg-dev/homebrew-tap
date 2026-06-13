# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.5.1.tar.gz"
  sha256 "6983b8f0530e3d496ea327eac01df41901d559149aca0752247bd2cb9d4ea516"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.5.0"
    sha256 cellar: :any, arm64_linux: "a0bdd4383074c60a12103cd753570c8c0dd330ef018fce135a925cb4a365fe0f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "93b508873bd6ae9733d0f30c83fc764bd983dfeff5700d329b1c52b78c0af350"
    sha256 cellar: :any_skip_relocation, sequoia: "70e09aea13467e6370f16c5faf0488a6cc88d998c4c20b17ebc1ba870cbf71ed"
    sha256 cellar: :any, x86_64_linux: "f596c71944d658fedd84a0fce4a83153d63d41e0138bf6c0661a30aaa61a9c1c"
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
