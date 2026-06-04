# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.59.tar.gz"
  sha256 "2e78636f95797c35d1b739a7863647cde74ca5aa9a70d0902c686582faf69f2f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.59"
    sha256 cellar: :any, arm64_linux: "cd048ec3de425dc40b0e8b46ba59f903f0fd54c5c52d6df2d1dc623a126b6b86"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "390703e45650cfd0a911dfddbb58cde4c0f8b0f9c27c525b72f600b905664835"
    sha256 cellar: :any_skip_relocation, sequoia: "430c8f220e4d7f5a3f2953b200372fbd433c547a9fcdec9df2405d224465a714"
    sha256 cellar: :any, x86_64_linux: "10fd5c72d3408af53e8edf2221928fbb6160801539070706d97d0eba3cb165cb"
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
