# Калькулятор налогов для ИП 62010

# Installation

```
git clone git@github.com:pluff/ip_taxes.git
cd ip_taxes
bundle install
brew install iconv
```

# Usage with BGPB

1. Симпортировать выписку с валютного счета за налоговый период в файл usd.txt
1. Симпортировать выписку с рублевого счета за налоговый период в файл byn.txt
1. `bundle exec bin/calc_bgpb`

# Usage with other banks

TODO

# Configuration

```
REMITTANCES_PATH=~/Downloads/usd.txt (default: 'tmp/usd.txt')
EXCHANGES_PATH=~/Downloads/byn.txt (default: 'tmp/byn.txt')
CURRENCY=EUR (default: 'USD')
TAX_RATE=0.05 (default: '0.03')
```

Любую переменную окружения из указанных выше можно записать в `.env` файл
