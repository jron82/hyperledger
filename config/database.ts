/**
 * Config source: https://git.io/JesV9
 *
 * Feel free to let us know via PR, if you find something broken in this config
 * file.
 */

import Env from '@ioc:Adonis/Core/Env'
import ParseDbUrl from 'App/Lib/ParseDbUrl'
import { DatabaseConfig } from '@ioc:Adonis/Lucid/Database'

const sslEnvs = ['staging', 'production']
const useSsl = sslEnvs.includes(Env.get('NODE_ENV'))
const options = { rejectUnauthorized: false }
const sslOptions = useSsl ? options : false

const databaseUrl = Env.get('DATABASE_URL')
const db = ParseDbUrl.parse(databaseUrl)

const databaseConfig: DatabaseConfig = {
  /*
  |--------------------------------------------------------------------------
  | Connection
  |--------------------------------------------------------------------------
  |
  | The primary connection for making database queries across the application
  | You can use any key from the `connections` object defined in this same
  | file.
  |
  */
  connection: 'pg',

  connections: {
    pg: {
      client: 'pg',
      connection: {
        host: db.host,
        port: db.port,
        user: db.username,
        password: db.password,
        database: db.database,
        ssl: sslOptions,
      },
      pool: {
        min: 4,
        max: 20,
      },
      migrations: {
        naturalSort: true,
      },
      healthCheck: false,
      debug: false,
    },
  },
}

export default databaseConfig
