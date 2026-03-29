# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "OpenAI-compatible LLM proxy server and MCP tool server"
  homepage "https://kreuzberg.dev"
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.1.1.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"
  head "https://github.com/kreuzberg-dev/liter-llm.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
