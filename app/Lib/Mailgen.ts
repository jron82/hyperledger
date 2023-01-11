import Mailgen from 'mailgen'

var defaultMailer = new Mailgen({
  theme: 'default',
  product: {
    name: 'Ronald Jordan',
    link: 'https://www.hypergraph.space',
  },
})

export default defaultMailer
