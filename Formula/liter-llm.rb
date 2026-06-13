# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.5.1.tar.gz"
  sha256 "6983b8f0530e3d496ea327eac01df41901d559149aca0752247bd2cb9d4ea516"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.5.1"
    sha256 cellar: :any, arm64_linux: "9f7a7b4278bb0b7ec94f8a163e967151c84fe43dafc11d0379bc180d20e503eb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f04ed8af78e3652ae0acf2287ca9750b68c080d01882ce34e1c265cf3545ed20"
    sha256 cellar: :any_skip_relocation, sequoia: "f06b3528f826020c82b4dd7571083d8080fab75c1b4d11c9870c2c7e04faa79a"
    sha256 cellar: :any, x86_64_linux: "c1c9eb17011224f2c799960b71590277abafe65e8bfb575f97d8938296fe98a9"
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
