# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.1.tar.gz"
  sha256 "d6c7c10d8fcb7039077c74e9156e1d639e0788c0aaf5a7d14cf174edfbb5ebd4"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.1"
    sha256 cellar: :any, arm64_linux: "c060e0afeaa2b56036a4db19a5087f1623281b7a900b32b83a7ce84ff9ff2115"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a82682747681dd23bc122ea054a96ba185d1e3dee1facc47eb884d048718c4bb"
    sha256 cellar: :any_skip_relocation, sequoia: "22d0ec38f1f97677688bd5f130ead3fdc2b0a6fda7c173c8d78a39ae66e1d386"
    sha256 cellar: :any, x86_64_linux: "696aa2e087f24c43efad56877e6c0756268d1257a1c769f98849886a4817d089"
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
