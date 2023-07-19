import { json } from '@sveltejs/kit';
import { PrismaClient } from '@prisma/client';
 
const prisma = new PrismaClient();

export const GET = async () => {
  return json(await prisma.bandPost.findMany());
};

export const POST = async () => {
	return json(await createBandPost());
};

async function createBandPost() {
  return await prisma.bandPost.create({
    data: {
      heading: 'Pop band söker trummis',
      body: 'Vi söker en trummis som kan köra lite svängig pop som får folk att dansa.',
      email: 'thelookout@gmail.com',
      location: 'Umeå, Umeå',
      name: 'The Lookout',
      keywords: {
        connectOrCreate: {
          where: {
            keyword: 'Pop'
          },
          create: {
            keyword: 'Pop'
          } 
        }
      }
    }
  });
}