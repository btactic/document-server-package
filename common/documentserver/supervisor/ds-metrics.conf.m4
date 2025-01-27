[program:metrics]
command=/var/www/M4_DS_PREFIX/server/Metrics/metrics ./config/config.js
directory=/var/www/M4_DS_PREFIX/server/Metrics
user=ds
environment=NODE_DISABLE_COLORS=1
stdout_logfile=/var/log/M4_DS_PREFIX/metrics/out.log
stdout_logfile_backups=0
stdout_logfile_maxbytes=0
stderr_logfile=/var/log/M4_DS_PREFIX/metrics/err.log
stderr_logfile_backups=0
stderr_logfile_maxbytes=0
autostart=true
autorestart=true
