# frozen_string_literal: true

module Homebrew
  module Tests
    class TapSyntax < Test
      def run!(args:)
        test_header(:TapSyntax)

        test "brew", "style", tap.name

        return if tap.formula_files.blank? && tap.cask_files.blank?

        test "brew", "readall", "--aliases", tap.name
        test "brew", "audit", "--tap=#{tap.name}"
      end
    end
  end
end
