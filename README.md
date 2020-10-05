# Калькулятор налогов для ИП 62010

# Installation

```
git clone git@github.com:pluff/ip_taxes.git
cd ip_taxes
bundle install
brew install iconv
```

# Usage with BGPB

1. Симпортировать выписку с валютного и рублевого счетов за налоговый период в файл `tmp/bgpb_report.txt`
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
Налоговая база за текущий период: xxxx.xx BYN
Налоговая ставка:  3.00%
==============================
Налога к уплате: xxxx.xx BYN
==============================
Итоговая налоговая база: xxxxx.xx BYN
Накопленного налога: xxxx.xx BYN
```

# Usage with other banks

TODO

# Configuration

```
REPORT_PATH =~/Downloads/report.txt (default: 'tmp/bgpb_report.txt')
REMITTANCES_PATH=~/Downloads/usd.txt (default: REPORT_PATH) # для отдельной выписки с валютного счета
EXCHANGES_PATH=~/Downloads/byn.txt (default: REPORT_PATH) # для отдельной выписки с рублевого счета
CURRENCY=EUR (default: 'USD')
TAX_RATE=0.05 (default: '0.03')
PREV_TAX_BASE=1000 (default: 0) # для вывода доп. информации по итоговой налоговой базе и накопленному налогу.
```

Любую переменную окружения из указанных выше можно записать в `.env` файл
