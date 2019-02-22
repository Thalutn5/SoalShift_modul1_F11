awk '(/cron/ || /CRON/) && (!/sudo/) && (NF < 13)  {print}' /var/log/syslog  >> /home/thalutn5/Documents/Soalshift1/nmr5/soal5.log
