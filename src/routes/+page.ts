import type { BandPost } from '@prisma/client';
import type { PageLoad } from './$types';

export const load = (async ({ fetch }) => {
  const bandPosts: BandPost[] = await fetch('/api/band-posts')
    .then(res => res.json())
    .catch(err => console.log(err));
  return { bandPosts }
}) satisfies PageLoad;
