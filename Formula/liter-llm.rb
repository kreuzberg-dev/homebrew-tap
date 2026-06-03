# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.55.tar.gz"
  sha256 "d52c80fbb4dea2821d0f71f0bcfccf0568ce97d2e70fa98af38f0183371f75bc"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.55"
    sha256 cellar: :any, arm64_linux: "933cdd3dd288bab09db17c4a5bd9b0c57b0afc4f303887fd255edcae431f22da"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0baef9d26b51f19e8e25ca9e74b35cdfd04efc173d3ac1be4fd0c52b318e72f6"
    sha256 cellar: :any_skip_relocation, sequoia: "45eeab5ca2e2abe98a17b672771b476ac2a236f98d43bd7c861ed38231ec9838"
    sha256 cellar: :any, x86_64_linux: "e65555041f9e71d2c9f890d960569360a647b324d0cc3e37c40fd5fe42bc7f80"
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
