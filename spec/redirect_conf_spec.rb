require 'minitest/autorun'
require 'minitest/spec'
require 'byebug'
describe 'redirect_conf csv_to_apache' do
  describe ' <spec/fixtures/easy.csv' do
    let (:apache_conf) {
      %x(bin/redirect_conf csv_to_apache <spec/fixtures/easy.csv)
    }

    it 'parses correctly' do
      expected_apache_conf = "RewriteRule\t/foo https://localhost/bar [r=302,ne,l]\n"
      expected_apache_conf << "RewriteCond\t%{QUERY_STRING} ^foo_param=123$\n"
      expected_apache_conf << "RewriteRule\t/foo https://localhost/bar [r=302,ne,l]\n"
      apache_conf.must_equal expected_apache_conf
    end
  end

  describe ' <spec/fixtures/difficult.csv' do
    let (:apache_conf) {
      %x(bin/redirect_conf csv_to_apache <spec/fixtures/difficult.csv)
    }

    it 'ignores whitespace on field in condition' do
      apache_conf.wont_match /RewriteCond\t *$/
    end
  end
end

