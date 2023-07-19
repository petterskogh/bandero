<script lang="ts">
  export let data;
  let bandPosts = data.bandPosts;

  const postBandPost = async () => {
    await fetch('/api/band-posts', 
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
      })
      .then(res => res.json())
      .then(data => console.log(data))
      .catch(err => console.log(err));

    bandPosts = await fetch('/api/band-posts')
      .then(res => res.json())
      .catch(err => console.log(err));
  }
</script>

<h1>🎸 Bandero 🎸</h1>
{ #each bandPosts as bandPost }
  <h2>{bandPost.heading}</h2>
  <p>{bandPost.body}</p>
{ /each }
<button on:click={postBandPost}>Add new post</button>

<style lang="scss">
  :global(body) {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    margin: 0;
    padding: 0;
    height: 100vh;

    font-family: sans-serif;
    background-color: #121212;
    color: #FCFCFC;
  }
  
  h1 {
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 1rem;
  }

  p {
    font-size: 1.5rem;
    font-weight: 400;
  }
</style>
