'use strict';

/**
 * PM2 config for running the built app on a VM.
 *   npm run build && pm2 start ecosystem.config.js
 */
module.exports = {
  apps: [
    {
      name: 'hrms-backend',
      cwd: __dirname,
      script: 'dist/main.js',
      exec_mode: 'cluster',
      instances: 2,
      autorestart: true,
      watch: false,
      max_memory_restart: '1G',
      env: { NODE_ENV: 'production' },
    },
  ],
};
