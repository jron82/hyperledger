import Env from '@ioc:Adonis/Core/Env'
import Mailgun from 'mailgun-js'

interface MailMessage {
  from?: string
  to: string | string[]
  subject: string
  html: string
}

export default class Email {
  public message: MailMessage

  constructor(message: MailMessage) {
    this.message = message
    this.message.from = 'Ronald Jordan <ron@hypergraph.space>'
  }

  public async send() {
    if (Env.get('NODE_ENV') === 'test') {
      console.warn('Email not sent in test environment')
      return true
    }

    const mailgun = Mailgun({
      apiKey: Env.get('MAILGUN_API_KEY'),
      domain: 'my.hyperledger.fun',
    })

    await mailgun
      .messages()
      .send(this.message)
      .catch((err) => {
        console.error(err)
      })
  }
}
