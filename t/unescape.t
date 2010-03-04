use strict;
use Test::More tests => 5;
use URI::Escape::JavaScript qw(unescape);

ok(unescape('Boofy') eq 'Boofy', 'US-ASCII');
ok(unescape('%28%5Eo%5E%29/') eq '(^o^)/', 'Legacy Escaping for some symbols');
ok(unescape('%u30D0%u30BD%u30AD%u30E4') eq "\x{30d0}\x{30bd}\x{30ad}\x{30e4}", 'Asian Characters');
ok(unescape('KCatch%21%20KCatch%21%20%u305D%u308C%20Boofy%28ry%20Plagger%u3067%u3069%u3046%u3084%u308B%u304B%u306F%uFF4B%28ry') eq "KCatch! KCatch! \x{305d}\x{308c} Boofy(ry Plagger\x{3067}\x{3069}\x{3046}\x{3084}\x{308b}\x{304b}\x{306f}\x{ff4b}(ry", 'mixed');
ok(unescape('D%u0153dge') eq "D\x{0153}dge", 'Catch hex digits in pairs');
