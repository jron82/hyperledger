export type UserRole = 'admin' | 'client'

export interface MailMessage {
  from?: string
  to: string | string[]
  subject: string
  html: string
}
