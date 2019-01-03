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

## Example

```
ip_taxes git:(master) be bin/calc_bgpb
Налоговые базы по поступлениям:
        xxxx.xx BYN --- 2018-10-02 xxxx.x USD
        xxxx.xx BYN --- 2018-11-02 xxxx.x USD
        xxxx.xx BYN --- 2018-12-04 xxxx.x USD
        xxxx.xx BYN --- 2018-12-29 xxxx.x USD
Налоговые базы по продаже валюты:
           0.00 BYN --- 2018-10-09 xxxx.x USD (2.149 - 2.158)
           0.00 BYN --- 2018-11-06 xxxx.x USD (2.114 - 2.1237)
           0.00 BYN --- 2018-12-06 xxxx.x USD (2.129 - 2.135)
Итоговая налоговая база: xxxxx.xx BYN
Налоговая ставка:  3.00%
Налога к уплате: xxxx.xx BYN
```

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
