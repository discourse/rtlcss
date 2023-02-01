# frozen_string_literal: true

require "test_helper"

class TestRtlcssWrapper < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RtlcssWrapper::VERSION
  end

  def test_it_flips_css_correctly
    flipped = RtlcssWrapper.flip_css(<<~CSS)
      a {
        right: 100px;
        margin-left: 50px;
        padding: 0.33rem calc(var(--d-sidebar-row-horizontal-padding) / 3);
        background: linear-gradient(
          to bottom,
          rgba(var(--secondary-rgb), 0),
          rgba(var(--secondary-rgb), 100%)
        );
      }
    CSS
    assert_equal(<<~CSS.strip, flipped.strip)
      a {
        left: 100px;
        margin-right: 50px;
        padding: 0.33rem calc(var(--d-sidebar-row-horizontal-padding) / 3);
        background: linear-gradient(
          to bottom,
          rgba(var(--secondary-rgb), 0),
          rgba(var(--secondary-rgb), 100%)
        );
      }
    CSS
  end

  def test_it_raises_for_invalid_css
    error = assert_raises(RtlcssWrapper::FlipError) do
      RtlcssWrapper.flip_css(<<~CSS)
        a {
          right: 100px;
      CSS
    end
    assert_instance_of(RtlcssWrapper::FlipError, error)
    assert_match(/CssSyntaxError/, error.cause.message)
  end
end
