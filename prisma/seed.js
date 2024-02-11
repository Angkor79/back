const bcrypt = require('bcryptjs')
const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient()

const password = bcrypt.hashSync('123456')
const userData = [
    {
      firstName: "iii",
        lastName : "dy" ,
        email: "maos@gmail.com",
        password: password,
        phone: "0613398749"
        
      }
]



const run = async () => {
  await prisma.user.createMany({
    data : userData
  })
}

run()