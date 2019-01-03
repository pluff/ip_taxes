module Import
  module Bgpb
    class BgpbFile
      def initialize(filepath)
        @filepath = filepath
      end

      def converted_file
        @converted ||= begin
          `iconv -f cp1251 -t utf-8 #{@filepath.expand_path}`
        end
      end

      def readrow
        rows_enumerator.next
      end

      private

      def rows_enumerator
        @enumerator ||= rows.each
      end

      def rows
        @rows ||= converted_file.split("^\r\n").map do |line|
          line.gsub!("^\r\n", "")
          line.gsub!("\r\n", "")
          line.gsub!(/^\^/, '')
          line
        end
      end
    end
  end
end
