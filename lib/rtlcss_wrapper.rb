# frozen_string_literal: true

require_relative "rtlcss_wrapper/version"
require "mini_racer"

module RtlcssWrapper
  class FlipError < StandardError; end

  def self.flip_css(orig_css)
    @context ||=
      begin
        context = MiniRacer::Context.new(timeout: 10_000)
        context.eval(
          File.read(File.expand_path("../dist/main.js", __dir__))
        )
        context.eval(<<~JS)
          function rtlcssWrapper(origCss) {
            return rtlcss.process(origCss);
          }
        JS
        context
      end
    @context.call("rtlcssWrapper", orig_css)
  rescue MiniRacer::RuntimeError => e
    raise FlipError.new(cause: e)
  end
end
